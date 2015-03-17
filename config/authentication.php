<?php if (__FILE__ == $_SERVER['SCRIPT_FILENAME']) exit('No direct access allowed.');

$config['table_users'] = 'users';
$config['table_groups'] = 'user_groups';
$config['table_profiles'] = 'user_profiles';

$config['site_title'] = 'Pack4u';

$config['site_url'] = 'http://pack4u.co.nz/';

$config['absolute_path'] = '/home/a9314939/public_html/';

$config['admin_email'] = 'nzpack4u@gmail.com';

$config['default_group'] = 2;

$config['admin_group'] =  1;

$config['email_activation'] = false;

$config['approve_registration'] = false;

$config['email_activation_expire'] = 60 * 60 * 24;

$config['email_subject_1'] = 'Thank you for registering';

$config['email_subject_2'] = 'New password';

$config['email_subject_3'] = 'A new customer has registered';

$config['user_expire'] = 3600 * 24 * 30;

$config['secret_word'] = 'cd3aa854';

?>