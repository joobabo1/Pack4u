<?php require_once('header' . config_item('template', 'template_extension')); ?>

<script type="text/javascript">
// <![CDATA[
$(document).ready(function() {

	//qTip
	$('span[title]').qtip({
		style: {
			classes: 'ui-tooltip-shadow ui-tooltip-plain'
		},
		position: {
			my: 'bottom center',
			at: 'top center'
		}
	});
		
	//Check form fields
	$("form#create_account").validate({
		rules: {
			first_name: "required",
			last_name: "required",
			email: {
				required: true,
				email: true
			},
			telephone: {
				required: true,
				number: true
			},
			address: "required",
			city: "required",
			post_code: "required",
			zone: "required",
			password: "required",
			confirm_password: {
				required: true,
				equalTo: "#password"
			}
		},
		messages: {
			first_name: "Enter your first name.",
			last_name: "Enter your last name.",
			email: {
				required: "Enter your email address.", 
				email: "Email address not valid."
			},
			telephone: {
				required: "Enter your telephone number.", 
				number: "Please enter a valid number."
			},
			address: "Enter your address.",
			city: "Enter your city.",
			post_code: "Enter your post code.",
			zone: "Enter your zone.",
			password: "Enter your password.",
			confirm_password: {
				required: "Confirm your password.", 
				equalTo: "The password does not match."
			}
		},
		success: function(label) {
			label.html("&nbsp;").addClass("success");
		}
	});
			
});
// ]]>
</script>

	<!-- BEGIN #main -->
	<div class="container">
				
		<!-- BEGIN .grid_12 -->
		<div class="grid_12">
			
			<?php if ($error->has_errors()): ?>
			
				<div class="alert error">
					<span>
						<strong>An error occurred while processing request</strong>
					</span>
					<?php foreach ($error->display_errors() as $value): ?>		
						<p><?php echo $value; ?></p>
					<?php endforeach; ?>
				</div>
			
			<?php $error->clear_errors(); endif; ?>

			<?php if (isset($failed)): ?>
				<div class="alert error">
					<p>
						<span>This email address is already taken!</span>
					</p>
				</div>
			<?php endif; ?>
						
			<?php if (isset($success)): ?>
				
				<?php if (config_item('authentication', 'email_activation') && !config_item('authentication', 'approve_user_registration')): ?>
					
					<div class="alert success">
						<p>
							<span>Thank you for registering!</span>
						</p>
						<p>
							You will receive an email soon with a link to activate your account.
							If you don't receive an email after some time, check your spam folder.
						</p>
					</div>
					
				<?php elseif (!config_item('authentication', 'email_activation') && config_item('authentication', 'approve_user_registration')): ?>

					<div class="alert success">
						<p>
							<span>Thank you for registering!</span>
						</p>
						<p>
							You will be notified by email once your account has been activated by the store owner.							
						</p>
					</div>
									
				<?php else: ?>

					<div class="alert success">
						<p>
							<span>Congratulations! Your new account has been successfully created.</span>
						</p>
					</div>
									
				<?php endif; ?>
				
			<?php endif; ?>

    		<!--Start register form-->
                 <div class="row" style="margin-top:20px">
                    <div class="col-xs-12 col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
                        <form action="" id="login" method="post" class="form-horizontal">
                            <fieldset>
                                <h2>Welcome Register</h2>
                                <hr class="colorgraph">
                                <h3>Your personal details</h3>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">First name<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="first_name" id="first_name" value="<?php if (isset($_POST['first_name'])) echo $_POST['first_name']; ?>" class="form-control" placeholder="Please enter your first name">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Last name<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="last_name" id="last_name" value="<?php if (isset($_POST['last_name'])) echo $_POST['last_name']; ?>" class="form-control" placeholder="Please enter your lastt name">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Email<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="email" id="email" value="<?php if (isset($_POST['email'])) echo $_POST['email']; ?>" class="form-control input-lg" placeholder="Please enter your lastt name">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Telephone<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="telephone" id="telephone" value="<?php if (isset($_POST['telephone'])) echo $_POST['telephone']; ?>" class="form-control input-lg" placeholder="Please enter your telephone number">
                                    </div>
                                </div>

                                
                                <h3>Your password</h3>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Password<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="password" name="password" id="password" class="form-control input-lg">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Confirm pw<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="password" name="confirm_password" id="confirm_password"  class="form-control input-lg">
                                    </div>
                                </div>


                                <h3>Your address</h3>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Company</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="company" id="company" value="<?php if (isset($_POST['company'])) echo $_POST['company']; ?>" class="form-control input-lg" placeholder="Please enter your company name">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Address<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="address" id="address" value="<?php if (isset($_POST['address'])) echo $_POST['address']; ?>" class="form-control input-lg" placeholder="Please enter your address">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">City<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="city" id="city" value="<?php if (isset($_POST['city'])) echo $_POST['city']; ?>" class="form-control input-lg" placeholder="Please enter your city">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Post Code<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="post_code" id="post_code" value="<?php if (isset($_POST['post_code'])) echo $_POST['post_code']; ?>" class="form-control input-lg" placeholder="Please enter your post code number">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Country<span class="required">*</span></label>
                                    <select id="country" name="country" class="col-sm-10">
                                        <?php foreach ($countries as $row): ?>
                                            <option value="<?php echo $row['country_id']; ?>"><?php echo $row['country_name']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Ragion/state<span class="required">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="zone" id="post_zonecode" value="<?php if (isset($_POST['zone'])) echo $_POST['zone']; ?>" class="form-control input-lg" placeholder="Please enter your post code number">
                                    </div>
                                </div>
                                
                                <hr class="colorgraph">
                                <div class="row">
                                    <div class="col-xs-5 col-sm-4 col-md-4">
                                        <input type="submit" name="submit" class="btn btn-sm btn-success btn-block" value="Register account">
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
                <!--End register form-->
		<div class="clear">&nbsp;</div>
				
	</div>
	<!-- END #main -->

<?php require_once('footer' . config_item('template', 'template_extension')); ?>
