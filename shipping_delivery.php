<?php

//Include the common file
require_once('common.php');

//Check if the user is logged in
if (!$authentication->logged_in() || !$authentication->is_group('customer')) header("Location: login1.php");


//Customer addresses
$customer_addresses = array();

foreach ($db->query("SELECT * FROM " . config_item('cart', 'table_addresses') . " WHERE user_id = '" . $session->get('user_id') . "'") as $row)
	$customer_addresses[] = $row;

//Countries
foreach ($db->query("SELECT * FROM " . config_item('cart', 'table_countries') . "") as $row)
	$countries[] = $row;

//Check if the existing form has been submitted
if (isset($_POST['submit'])) {

	$validate->numeric($_POST['telephone'], 'Please enter Telephone number.');
	$validate->required($_POST['weight'], 'Please enter Weight.');
	$validate->required($_POST['contents'], 'Please enter Contents.');
	
	if(!$error->has_errors()){
		
			//$result = $db->fetch_row_assoc("SELECT user_id FROM " . config_item('authentication', 'table_users') . " WHERE user_email = '" . $_POST['email'] . "'");

			$values = array(

				'user_id' => $session->get('user_id'),
				//'first_name' => $result['first_name'],
				//'last_name' => $result['last_name'],3
				'shipping_telephone' => $_POST['telephone'],
				'shipping_weight' => $_POST['weight'],
				'shipping_content' => $_POST['contents'],
				'shipping_first_name' => $_POST['first_name_existing'],
				'shipping_last_name' => $_POST['last_name_existing'],
				'shipping_address' => $_POST['address_existing'],
				'shipping_post_code' => $_POST['post_code_existing'],
				'shipping_city' => $_POST['city_existing'],
				'shipping_country_id' => $_POST['country_id_existing'],
				'shipping_zone' => $_POST['zone_existing']
				
			); 

			$db->insert(config_item('cart', 'table_shipping_delivery_existing'), $values);
							
			$tpl->set('success', true);	

	}else{
		$tpl->set('failed', true);
	}
}

//Check if the new address form has been submitted
if (isset($_POST['submit2'])) {

	$validate->numeric($_POST['telephone'], 'Please enter Telephone number.');
	$validate->required($_POST['weight'], 'Please enter Weight.');
	$validate->required($_POST['contents'], 'Please enter Contents.');
	
	if(!$error->has_errors()){
		
	
			$values = array(

				'user_id' => $session->get('user_id'),
				//'first_name' => $result['first_name'],
				//'last_name' => $result['last_name'],3
				'shipping_telephone' => $_POST['telephone'],
				'shipping_weight' => $_POST['weight'],
				'shipping_content' => $_POST['contents'],
				'shipping_first_name' => $_POST['first_name_new'],
				'shipping_last_name' => $_POST['last_name_new'],
				'shipping_address' => $_POST['address_new'],
				'shipping_post_code' => $_POST['post_code_new'],
				'shipping_city' => $_POST['city_new'],
				'shipping_country_id' => $_POST['country_id_new'],
				'shipping_zone' => $_POST['zone_new']
				
			); 

			$db->insert(config_item('cart', 'table_shipping_delivery_new'), $values);
							
			$tpl->set('success', true); 			

	}else{
		$tpl->set('failed', true);
	}
}		



//Template values
$tpl->set('customer_addresses', $customer_addresses);
$tpl->set('countries', $countries);	
	
//Display the template
$tpl->display('shipping_delivery');	
	
?>