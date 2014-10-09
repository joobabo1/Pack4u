<?php

//Include the common file
require('../common.php');

//Check if the user is logged in
if (!$authentication->logged_in() || !$authentication->is_admin()) header("Location: login.php");



//Display the template
$tpl->display('admin/shipping_delivery');

?>
