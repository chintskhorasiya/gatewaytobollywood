<?php
session_start();
require_once("../wp-load.php");

global $reg_errors;
$reg_errors = new WP_Error;

if ( isset($_POST['user-submit']) && $_POST['user-submit'] == "Login" ) {

	$username   =   sanitize_user( $_POST['log'] );
    $password   =   esc_attr( $_POST['pwd'] );
    $rememberme       =   $_POST['rememberme'];
    $redirect_to       =   $_POST['redirect_to'];
    $user_cookie       =   $_POST['user-cookie'];


   	//var_dump($redirect_to);exit;

    if ( empty( $username ) ) {
        $reg_errors->add('field', 'Please enter your username');
    	$_SESSION['login_error_msgs'][] = "Please enter your username";
    }

    if ( empty( $password ) ) {
        $reg_errors->add('field', 'Please enter your password');
        $_SESSION['login_error_msgs'][] = "Please enter your password";
    }

    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

        $credentials = array(); // Back-compat for plugins passing an empty string.

        $credentials['user_login'] = $username;
        $credentials['user_password'] = $password;
        $credentials['remember'] = $rememberme;

        $user = wp_signon ( $credentials, $user_cookie );

        if(is_wp_error($user)){

            $login_errors = $user->errors;

            foreach ($login_errors as $login_error) {
                
                if(is_array($login_error)){
                    
                    foreach ($login_error as $single_error) {

                        //$reg_errors->add('field', $single_error);
                        $_SESSION['login_error_msgs'][] = $single_error;
                    
                    }

                } else {
                    //$reg_errors->add('field', $login_error);
                    $_SESSION['login_error_msgs'][] = $login_error;
                }

            }
            wp_redirect(site_url().'/login');
        } else{
        	wp_redirect($redirect_to);
        }
    }
}
?>