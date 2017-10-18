<?php

function registration_form( $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio ) {
    
    $options = get_option( 'gateway_bollywood_options' );
 
    echo '
    <form class="register-form" action="' . $_SERVER['REQUEST_URI'] . '" method="post">
    <div>
    <label for="role">Type <strong>*</strong></label>
    <input type="radio" name="role" value="1" '. ( (!empty($_POST['role']) && $_POST['role'] == "1" ) ? 'checked="checked"' : '' ) .' /> Talent
    <input type="radio" name="role" value="2" '. ( (!empty($_POST['role']) && $_POST['role'] == "2" ) ? 'checked="checked"' : '' ) .' /> Recruiter
    </div>

    <div>
    <label for="username">Username <strong>*</strong></label>
    <input type="text" name="username" value="' . ( isset( $_POST['username'] ) && !empty($_POST['username']) ? $username : null ) . '">
    </div>
     
    <div>
    <label for="password">Password <strong>*</strong></label>
    <input type="password" name="password" value="' . ( isset( $_POST['password'] ) && !empty($_POST['password']) ? $password : null ) . '">
    </div>
     
    <div>
    <label for="email">Email <strong>*</strong></label>
    <input type="text" name="email" value="' . ( isset( $_POST['email']) ? $email : null ) . '">
    </div>
     
    <div>
    <label for="firstname">First Name</label>
    <input type="text" name="fname" value="' . ( isset( $_POST['fname']) ? $first_name : null ) . '">
    </div>
     
    <div>
    <label for="website">Last Name</label>
    <input type="text" name="lname" value="' . ( isset( $_POST['lname']) ? $last_name : null ) . '">
    </div>
     
    <div>
    <label for="nickname">Nickname</label>
    <input type="text" name="nickname" value="' . ( isset( $_POST['nickname']) ? $nickname : null ) . '">
    </div>
     
    <div>
    <label for="bio">About / Bio</label>
    <textarea name="bio">' . ( isset( $_POST['bio']) ? $bio : null ) . '</textarea>
    </div>
    <input type="submit" name="submit" value="Register"/>Already Registered as Artist ! Please <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here.
    </form>
    ';
}

/*
<div>
    <label for="website">Website</label>
    <input type="text" name="website" value="' . ( isset( $_POST['website']) ? $website : null ) . '">
    </div>
*/

function registration_validation( $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio ,$role)  {
    global $reg_errors;
    $reg_errors = new WP_Error;

    if ( empty( $username ) || empty( $password ) || empty( $email ) ) {
        $reg_errors->add('field', 'Required form field is missing');
    }

    if ( empty( $role ) ) {
        $reg_errors->add('role_required', 'Please select your Role Type');
    }
    
    if ( 4 > strlen( $username ) ) {
        $reg_errors->add( 'username_length', 'Username too short. At least 4 characters is required' );
    }

    if ( username_exists( $username ) ) $reg_errors->add('user_name', 'Sorry, that username already exists!');

    if ( ! validate_username( $username ) ) {
        $reg_errors->add( 'username_invalid', 'Sorry, the username you entered is not valid' );
    }

    if ( 5 > strlen( $password ) ) {
        $reg_errors->add( 'password', 'Password length must be greater than 5' );
    }

    if ( !is_email( $email ) ) {
        $reg_errors->add( 'email_invalid', 'Email is not valid' );
    }

    if ( email_exists( $email ) ) {
        $reg_errors->add( 'email', 'Email Already in use' );
    }

    if ( ! empty( $website ) ) {
        if ( ! filter_var( $website, FILTER_VALIDATE_URL ) ) {
            $reg_errors->add( 'website', 'Website is not a valid URL' );
        }
    }

    if ( is_wp_error( $reg_errors ) ) {
     
        foreach ( $reg_errors->get_error_messages() as $error ) {
         
            echo '<div class="errors">';
            echo '<strong>ERROR</strong>:';
            echo $error . '<br/>';
            echo '</div>';
             
        }
     
    }
}

// Redefine user notification function
if ( !function_exists('custom_new_user_notification') ) {
    function custom_new_user_notification( $user_id, $plaintext_pass = '' ) {
        $user = new WP_User($user_id);
  
        $user_login = stripslashes($user->user_login);
        $user_email = stripslashes($user->user_email);
  
        $message  = sprintf(__('New user registration on your blog %s:'), get_option('blogname')) . "rnrn";
        $message .= sprintf(__('Username: %s'), $user_login) . "rnrn";
        $message .= sprintf(__('E-mail: %s'), $user_email) . "rn";
  
        @wp_mail(get_option('admin_email'), sprintf(__('[%s] New User Registration'), get_option('blogname')), $message);
  
        if ( empty($plaintext_pass) )
            return;
  
        $message  = __('Hi there,') . "rnrn";
        $message .= sprintf(__("Welcome to %s! Here's how to log in:"), get_option('blogname')) . "rnrn";
        $message .= wp_login_url() . "rn";
        $message .= sprintf(__('Username: %s'), $user_login) . "rn";
        $message .= sprintf(__('Password: %s'), $plaintext_pass) . "rnrn";
        $message .= sprintf(__('If you have any problems, please contact me at %s.'), get_option('admin_email')) . "rnrn";
        $message .= __('Adios!');
  
        wp_mail($user_email, sprintf(__('[%s] Your username and password'), get_option('blogname')), $message);
  
    }
}

function complete_registration() {
    global $reg_errors, $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $role;
    
    $options = get_option( 'gateway_bollywood_options' );

    //var_dump($role);exit;
    //$website = "http://www.testartist.com";

    if ( 1 > count( $reg_errors->get_error_messages() ) ) {
        $userdata = array(
        'user_login'    =>   $username,
        'user_email'    =>   $email,
        'user_pass'     =>   $password,
        'user_url'      =>   $website,
        'first_name'    =>   $first_name,
        'last_name'     =>   $last_name,
        'nickname'      =>   $nickname,
        'description'   =>   $bio,
        );

        //var_dump($userdata);exit;
        $user = wp_insert_user( $userdata );

        if($role == "2") wp_update_user( array ('ID' => $user, 'role' => 'recruiter') ) ;

        if($user){
            //wp_new_user_notification($user, null, 'both');
            custom_new_user_notification($user);
        }

        echo 'Registration complete. Goto <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login page</a>.';   
    }
}

function artist_login_register_password_html() {
    if ( isset($_POST['submit'] ) ) {
        registration_validation(
        $_POST['username'],
        $_POST['password'],
        $_POST['email'],
        $_POST['website'],
        $_POST['fname'],
        $_POST['lname'],
        $_POST['nickname'],
        $_POST['bio'],
        $_POST['role']
        );
         
        // sanitize user form input
        global $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $role;
        $username   =   sanitize_user( $_POST['username'] );
        $password   =   esc_attr( $_POST['password'] );
        $email      =   sanitize_email( $_POST['email'] );
        $website    =   esc_url( $_POST['website'] );
        $first_name =   sanitize_text_field( $_POST['fname'] );
        $last_name  =   sanitize_text_field( $_POST['lname'] );
        $nickname   =   sanitize_text_field( $_POST['nickname'] );
        $bio        =   esc_textarea( $_POST['bio'] );
        $role       =   $_POST['role'];
 
        // call @function complete_registration to create the user
        // only when no WP_error is found
        complete_registration(
        $username,
        $password,
        $email,
        $website,
        $first_name,
        $last_name,
        $nickname,
        $bio,
        $role
        );
    }
 
    registration_form(
        $username,
        $password,
        $email,
        $website,
        $first_name,
        $last_name,
        $nickname,
        $bio,
        $role
        );
}