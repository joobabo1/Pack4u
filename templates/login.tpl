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
	$("form#login").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
			password: "required"
		},
		messages: {
			email: {
				required: "Enter your email address.", 
				email: "Email address not valid."
			},
			password: "Enter your password."
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
	
		<div class="clear">&nbsp;</div>
				
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

			<?php if (isset($failed) && isset($_POST['login'])): ?>
				<div class="alert error">
					<span>
						<strong>An error occurred while processing request</strong>
					</span>	
					<p>Login failed!</p>
				</div>
			<?php endif; ?>
									
			<!--Login form-->
			 <div class="row" style="margin-top:20px">
                <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                    <form action="" id="login" method="post">
                        <fieldset>
                            <h2>Please Login</h2>
                            <hr class="colorgraph">
                            <div class="form-group">
                                <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
                            </div>
                            <span class="button-checkbox">
                                <input type="checkbox" name="remember" id="remember" value="remember">
                                Remember Me
                                <a href="lost_password.php" class="btn btn-link pull-right">Forgot Password?</a>
                            </span>
                            <hr class="colorgraph">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <input type="submit" name="login" class="btn btn-sm btn-success btn-block" value="LogIn">
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <a href="" class="btn btn-sm btn-primary btn-block">Register</a>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
			<!--End loging form-->
												
		</div>
		<!-- END .grid_12 -->
						
	</div>
	<!-- END #main -->
	
	

        <div class="clear">&nbsp;</div>

<?php require_once('footer' . config_item('template', 'template_extension')); ?>
