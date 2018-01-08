<?php
session_start();
require_once("../wp-load.php");

global $reg_errors;
$reg_errors = new WP_Error;

if ( isset($_POST['user-submit']) && $_POST['user-submit'] == "Reset my password" ) {

    $user_login = $_POST['user_login'];
    $redirect_to       =   $_POST['redirect_to'];
    $user_cookie       =   $_POST['user-cookie'];


    //var_dump($redirect_to);exit;

    if ( empty( $user_login ) ) {
        $reg_errors->add('field', 'Please enter your email or username');
        $_SESSION['login_error_msgs'][] = "Please enter your email or username";
    }

    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

        $credentials = array(); // Back-compat for plugins passing an empty string.

        $credentials['user_login'] = $user_login;
        
        $user = retrieve_password();

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
            
            wp_redirect($redirect_to);
        } else{
            
            $redirect_url = $redirect_to;
            //$redirect_url = add_query_arg( 'checkemail', 'confirm', $redirect_url );
            $_SESSION['login_success_msgs'][] = "Please check your email. We send you reset password link";
            wp_redirect($redirect_url);
        }
    } else {
        wp_redirect($redirect_to);
    }
}

function retrieve_password() {
    $errors = new WP_Error();

    if ( empty( $_POST['user_login'] ) ) {
        $errors->add('empty_username', __('<strong>ERROR</strong>: Enter a username or email address.'));
    } elseif ( strpos( $_POST['user_login'], '@' ) ) {
        $user_data = get_user_by( 'email', trim( wp_unslash( $_POST['user_login'] ) ) );
        if ( empty( $user_data ) )
            $errors->add('invalid_email', __('<strong>ERROR</strong>: There is no user registered with that email address.'));
    } else {
        $login = trim($_POST['user_login']);
        $user_data = get_user_by('login', $login);
    }

    /**
     * Fires before errors are returned from a password reset request.
     *
     * @since 2.1.0
     * @since 4.4.0 Added the `$errors` parameter.
     *
     * @param WP_Error $errors A WP_Error object containing any errors generated
     *                         by using invalid credentials.
     */
    do_action( 'lostpassword_post', $errors );

    if ( $errors->get_error_code() )
        return $errors;

    if ( !$user_data ) {
        $errors->add('invalidcombo', __('<strong>ERROR</strong>: Invalid username or email.'));
        return $errors;
    }

    // Redefining user_login ensures we return the right case in the email.
    $user_login = $user_data->user_login;
    $user_email = $user_data->user_email;
    $key = get_password_reset_key( $user_data );

    //$_SESSION['login_success_msgs'][] = $key;

    if ( is_wp_error( $key ) ) {
        return $key;
    }

    $message = __('You have requested a password reset for the following account:') . "\r\n\r\n";
    //$message .= network_home_url( '/' ) . "\r\n\r\n";
    $message .= sprintf(__('Username: %s'), $user_login) . "\r\n\r\n";
    //$message .= __('If this was a mistake, just ignore this email and nothing will happen.') . "\r\n\r\n";
    $message .= __('To reset your password, visit the following address:') . "\r\n\r\n";
    //$message .= '<' . network_site_url("wp-login.php?action=rp&key=$key&login=" . rawurlencode($user_login), 'login') . ">\r\n";
    $message .= '<' . site_url("resetpassword/?action=rp&key=$key&login=" . rawurlencode($user_login), 'login') . ">\r\n\r\n";
    
    $message .= '<b>'.__('Regards,')."</b>"."\r\n";
    $message .= '<b>'.sprintf(__("Team GatewayToBollywood")) . "</b>"."\r\n\r\n";

    if ( is_multisite() ) {
        $blogname = get_network()->site_name;
    } else {
        /*
         * The blogname option is escaped with esc_html on the way into the database
         * in sanitize_option we want to reverse this for the plain text arena of emails.
         */
        $blogname = wp_specialchars_decode(get_option('blogname'), ENT_QUOTES);
    }

    /* translators: Password reset email subject. 1: Site name */
    $title = sprintf( __('%s Website Password Reset'), $blogname );

    /**
     * Filters the subject of the password reset email.
     *
     * @since 2.8.0
     * @since 4.4.0 Added the `$user_login` and `$user_data` parameters.
     *
     * @param string  $title      Default email title.
     * @param string  $user_login The username for the user.
     * @param WP_User $user_data  WP_User object.
     */
    $title = apply_filters( 'retrieve_password_title', $title, $user_login, $user_data );

    /**
     * Filters the message body of the password reset mail.
     *
     * If the filtered message is empty, the password reset email will not be sent.
     *
     * @since 2.8.0
     * @since 4.1.0 Added `$user_login` and `$user_data` parameters.
     *
     * @param string  $message    Default mail message.
     * @param string  $key        The activation key.
     * @param string  $user_login The username for the user.
     * @param WP_User $user_data  WP_User object.
     */
    $message = apply_filters( 'retrieve_password_message', $message, $key, $user_login, $user_data );

    if ( $message && !wp_mail( $user_email, wp_specialchars_decode( $title ), $message ) ){
        //wp_die( __('The email could not be sent.') . "<br />\n" . __('Possible reason: your host may have disabled the mail() function.') );
        $_SESSION['login_error_msgs'][] = __('The email could not be sent.') . "<br />\n" . __('Possible reason: your host may have disabled the mail() function.');
    }

    return true;
}
?>