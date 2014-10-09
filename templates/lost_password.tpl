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
    $("form#password_forgotten").validate({
        rules: {
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            email: {
                required: "Enter your email address.", 
                email: "Email address not valid."
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

            <?php if (isset($failed) && isset($_POST['reset_password'])): ?>
                <div class="alert error">
                    <span>
                        <strong>An error occurred while processing request</strong>
                    </span> 
                    <p>The email address was not found in our records, please try again!</p>
                </div>
            <?php endif; ?>

            <?php if (isset($success) && isset($_POST['reset_password'])): ?>
                <div class="alert success">
                    <p>
                        <span>A new password has been sent to your email address!</span>
                    </p>
                </div>
            <?php endif; ?>
                                    
            <!--Start Lost password form-->
            <div class="row" style="margin-top:20px">
                <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                    <form action="" id="password_forgotten" method="post">
                        <fieldset>
                            <h2>Lost password</h2>
                                <hr class="colorgraph">
                                <p>
                                    If you've forgotten your password, enter your email address below and we'll send 
                                    you an email message containing your new password.
                                </p><br>

                            <div class="form-group">
                                <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address">
                            </div>
                            <hr class="colorgraph">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <input type="submit" name="reset_password" class="btn btn-sm btn-success btn-block" value="Submit request">
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
            <!-- End password form-->
                                                
        </div>
        <!-- END .grid_12 -->
                                
    </div>
    <!-- END #main -->

<?php require_once('footer' . config_item('template', 'template_extension')); ?>
