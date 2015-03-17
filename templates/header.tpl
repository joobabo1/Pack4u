<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <!-- BEGIN head -->
    <head>
        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Title -->
        <title>Pack4u</title>

        <!-- Style sheet -->

        <link href="<?php echo config_item('template', 'site_url'); ?>templates/bootstrap-3.1.1-dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<?php echo config_item('template', 'site_url'); ?>templates/font-awesome-4.0.3/css/font-awesome.min.css" rel="stylesheet" />
        <link href="<?php echo config_item('template', 'site_url'); ?>templates/css/magnific-popup.css" rel="stylesheet" />
        <!--<link href="<?php echo config_item('template', 'site_url'); ?>templates/css/jquery.aw-showcase.stytle.css" rel="stylesheet" />
        <link href="<?php echo config_item('template', 'site_url'); ?>templates/css/theme.css" rel="stylesheet" />
        <link href="<?php echo config_item('template', 'site_url'); ?>templates/css/sticky.min.css" rel="stylesheet" />-->
        

        <!-- jQuery plugins -->
        <!--<script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/jquery.qtip.min.js"></script>
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/jquery.blockUI.js"></script>
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/jquery.fancybox.js"></script>
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/jquery.cookie.js"></script>-->
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

        <!-- Custom js -->
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/custom.min.js"></script>
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/response.min.js"></script>
        
        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

        <script type="text/javascript" src="<?php echo config_item('template', 'site_url'); ?>templates/js/jquery.magnific-popup.js"></script>
        


    </head>
    <!-- END head -->

    <!-- BEGIN body -->
    <body>       
        <!-- BEGIN #wrapper -->
        <div id="wrapper">

            <!-- BEGIN #header -->
            <div id="header" class="container">
                <div class="row">
                    <!-- BEGIN #user_menu -->
                    <div id="user_menu" class="links pull-right">
                        <ul>
                            <?php require_once('display_cart.php');	?>

                            <?php if (!$authentication->logged_in() || !$authentication->is_group('customer')): ?>
                            <a>Welcome: Guest</a>
                            <a href="login.php">Login</a>
                            <a href="create_account.php">Register</a>
                            <?php else: ?>
                            <a href="account.php"> Welcome: <?php if ($session->get('user_email')) echo $session->get('user_email'); ?> </a>

                            <a href="?logout">Logout</a>
                            <?php endif; ?>
                            <a href="view_cart.php">Viewcart</a>
                        </ul>
                    </div>
                </div>
                <!-- END #user_menu -->

                <!-- BEGIN #nav-->
                <?php include "nav.tpl";?>
                <!-- END #nav-->

            </div>
            <!-- END #header -->

        </div>
    </body>
</html>