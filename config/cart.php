<?php if (__FILE__ == $_SERVER['SCRIPT_FILENAME']) exit('No direct access allowed.');

$config['table_categories'] = 'categories';
$config['table_category_products'] = 'category_products';
$config['table_products'] = 'products';
$config['table_product_images'] = 'product_images';
$config['table_digital_goods'] = 'digital_goods';
$config['table_carts'] = 'carts';
$config['table_cart_product_options'] = 'cart_product_options';
$config['table_countries'] = 'countries';
$config['table_customers'] = 'customers';
$config['table_addresses'] = 'addresses';
$config['table_orders'] = 'orders';
$config['table_order_status'] = 'order_status';
$config['table_order_status_descriptions'] = 'order_status_descriptions';
$config['table_order_products'] = 'order_products';
$config['table_order_digital_goods'] = 'order_digital_goods';
$config['table_order_options'] = 'order_options';
$config['table_coupons'] = 'coupons';
$config['table_product_options'] = 'product_options';
$config['table_product_option_values'] = 'product_option_values';

$config['table_shipping_delivery_existing'] = 'shipping_delivery_existing';
$config['table_shipping_delivery_new'] = 'shipping_delivery_new';
$config['table_shipping_delivery_pickup'] = 'shipping_delivery_pickup';
$config['table_shipping_status'] = 'shipping_status';
$config['table_shipping_status_descriptions'] = 'shipping_status_descriptions';

$config['site_title'] = 'post4u';

$config['site_url'] = 'http://localhost/post4u/example/';

$config['absolute_path'] = 'C:\xampp\htdocs\Post4U\example/';

$config['admin_email'] = 'joobabo1@gmail.com';

$config['email_subject'] = 'Order received';

$config['per_page_catalog'] = 8;

$config['per_page_admin'] = 6;

$config['currency_symbol'] = '&#36;';

$config['currency_code'] = 'NZD';

$config['currency_position'] = 'left';

$config['shipping_cost'] = 0;

$config['tax_description'] = '';

$config['tax_rate'] = 0;

$config['tax_shipping'] = false;

$config['cart_expire'] = 60 * 60 * 24;

$config['paypal_email'] = 'joobabo1@gmail.com';

$config['paypal_return'] = 'http://localhost/post4u/example/checkout_success.php';

$config['paypal_cancel_return'] = 'http://localhost/post4u/example/';

$config['paypal_notify_url'] = 'http://localhost/post4u/example/payments/paypal/ipn.php';

$config['paypal_sandbox'] = 0;

$config['log_path'] = 'C:\xampp\htdocs\Post4U\example/logs/';

$config['new_order_notification'] = 1;

?>
