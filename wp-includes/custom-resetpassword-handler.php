<?php
session_start();
require_once("../wp-load.php");

global $reg_errors;
$reg_errors = new WP_Error;

if ( isset($_POST['user-submit']) && $_POST['user-submit'] == "Reset my password" ) {

	$pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];
    $redirect_to       =   $_POST['redirect_to'];
    $page_from       =   $_POST['page_from'];
    $user_id       =   $_POST['user_id'];


   	//var_dump($redirect_to);exit;

    if ( empty( $pass1 ) || empty($pass2) ) {
        $reg_errors->add('field', 'Please enter both password');
    	$_SESSION['login_error_msgs'][] = "Please enter both password";
    }

    if ( $pass1 != $pass2 ) {
        $reg_errors->add('field', 'Both password should be same');
        $_SESSION['login_error_msgs'][] = "Both password should be same";
    }

    if ( empty($user_id) ) {
        $reg_errors->add('field', 'Something went wrong');
        $_SESSION['login_error_msgs'][] = "Something went wrong";
    }

    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

        wp_set_password($pass1, $user_id);

        $redirect_url = $redirect_to;
        $_SESSION['login_success_msgs'][] = "New password set successfully. Please login with new password.";
        wp_redirect($redirect_url);
    }
    else
    {
        wp_redirect($page_from);
    }
}
?>