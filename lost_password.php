<?php

//Include the common file
require_once('common.php');

//Check if the user is logged in
if ($authentication->logged_in() && $authentication->is_group('customer')) header("Location: account.php");


//Check if the form has been submitted
if (isset($_POST['reset_password'])) {

	$validate->email($_POST['email'], 'Email address not valid.');
	
	if (!$error->has_errors()) {
		
		if ($authentication->new_password($_POST['email']))
			$tpl->set('success', true);
		else
			$tpl->set('failed', true);
			
	}
				
}

//Display the template
$tpl->display('lost_password');
			
?>
