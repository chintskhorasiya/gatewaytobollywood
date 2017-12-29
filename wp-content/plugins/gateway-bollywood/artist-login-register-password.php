<?php

function registration_form( $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $role, $mobileno) {

    //print_r($_POST);
    //var_dump($mobileno);
    $options = get_option( 'gateway_bollywood_options' );
 
    echo '
    <form class="register-form" action="' . $_SERVER['REQUEST_URI'] . '" method="post" enctype="multipart/form-data">
    <div class="role-option">
    <label for="role">Type <strong>*</strong></label>
    <input type="radio" name="role" value="1" '. ( (!empty($_POST['role']) && $_POST['role'] == "1" ) ? 'checked="checked"' : '' ) .' /> <span>Talent</span>
    <input type="radio" name="role" value="2" '. ( (!empty($_POST['role']) && $_POST['role'] == "2" ) ? 'checked="checked"' : '' ) .' /> <span>Recruiter</span>
    </div>

    <div class="clear"></div>
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
     
    <div class="clear"></div>
    <div>
    <label for="bio">About / Bio</label>
    <textarea name="bio">' . ( isset( $_POST['bio']) ? $bio : null ) . '</textarea>
    </div>

    <div>
    <label for="mobileno">Mobile no.</label>
    <input type="number" name="mobileno" value="' . ( isset( $_POST['mobileno']) ? $mobileno : null ) . '">
    </div>

    <div>
    <label for="photo">Profile Photo*</label>
    <input type="file" name="user_meta_image" id="user_meta_image" value="'.(!empty($_POST['user_meta_image']) ? $_POST['user_meta_image'] : null ).'">
    <span>(Max:2MB)</span>
    </div>

    <div class="clear"></div>
    <div><input type="submit" name="submit" value="Register"/>Already Registered as Artist ! Please <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here.</div>
    </form>
    ';
}

/*
<div>
    <label for="website">Website</label>
    <input type="text" name="website" value="' . ( isset( $_POST['website']) ? $website : null ) . '">
    </div>
*/

function registration_validation( $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio ,$role, $mobileno, $user_meta_image)  {
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

    if( !empty($mobileno)){
        $mobileno = preg_replace('/[^0-9]/', '', $mobileno);
        if(strlen($mobileno) < 10 || strlen($mobileno) > 12) {
            $reg_errors->add( 'mobileno', 'Mobile Number is not valid' );
        }
    }

    // user image validation
    //var_dump($user_meta_image);exit;
    $photo_error = array();
    $uploaddir = ABSPATH . 'wp-content/uploads/profilephotos/';
    $allowed_ext = "jpg, gif, png";
    $max_size = (1024*1024)*2; // 2MB
    $max_height = '400';
    $max_width = '450';

    // Check mime types are allowed  
    $extension = pathinfo($user_meta_image['name']);  
    $extension = $extension['extension'];
    $allowed_paths = explode(", ", $allowed_ext);
    for($i = 0; $i < count($allowed_paths); $i++) {  
        if ($allowed_paths[$i] == $extension) {
            $ok = "1";  
        }
    }

    if ($ok == "1") {  
        if($user_meta_image['size'] > $max_size)  
        {  
            $reg_errors->add( 'user-image-size', 'Profile Photo size is too big!' );  
            //$photo_error = true;
            array_push($photo_error, 1);
        }

        // Check Height & Width  
        /*if ($max_width && $max_height) {  
            list($width, $height, $type, $w) = getimagesize($user_meta_image['tmp_name']);  
            if($width > $max_width || $height > $max_height)  
            {  
                $reg_errors->add( 'user-image-height-width', 'Image is too big! max allowable width is&nbsp;' . $max_width .'px and max allowable height is&nbsp;' . $max_height .'px' );  
                array_push($photo_error, 2);
            } 
        } */

        //var_dump($photo_error);

        /*if(count($photo_error) <= 0) {
            $image_name=time().'.'.$extension;
            // Rename file and move to folder
            
            $target = $uploaddir.$user_ID.'/';
            wp_mkdir_p( $target );

            $newname=$target.$image_name;
            //var_dump($newname);exit;  
            if(is_uploaded_file($user_meta_image['tmp_name']))  
            { 
                move_uploaded_file($user_meta_image['tmp_name'], $newname);
                update_user_meta( $user_ID, 'user_meta_image', $image_name); 
                //echo 'Photo uploaded!<br>'; 
            }  
        }*/
    }  else {
        $reg_errors->add( 'user-image-type', 'Profile Photo should be required and image type only (jpg, gif, png)!' );  
        array_push($photo_error, 3);
    }


    ///////

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
    function custom_new_user_notification( $user_id, $plaintext_pass = '' , $role = null) {
        $user = new WP_User($user_id);
  
        $user_login = stripslashes($user->user_login);
        $user_email = stripslashes($user->user_email);
        $first_name = stripslashes($user->first_name);
        $last_name = stripslashes($user->last_name);
        $nickname = stripslashes($user->nickname);
        $about = stripslashes($user->description);
        $current_profile_photo = stripslashes($user->user_meta_image);

        $headers[] = 'Content-Type: text/html; charset=UTF-8';
        //$headers[] = 'Cc: Rutvi Seawind <rutvi@seawindsolution.com>';
        //$headers[] = 'Cc: Chintan Seawind <chintan@seawindsolution.com>';
  
        $message  = '<b>'.sprintf(__('New user registration on %s:'), get_bloginfo('name')) . "</b><br><br>";
        
        $message .= sprintf(__('Username: %s'), $user_login) . "<br>";
        $message .= sprintf(__('E-mail: %s'), $user_email) . "<br>";
        $message .= sprintf(__('First name: %s'), $first_name) . "<br>";
        $message .= sprintf(__('Last name: %s'), $last_name) . "<br>";
        $message .= sprintf(__('Nick name: %s'), $nickname) . "<br>";
        $message .= sprintf(__('About user: %s'), $about) . "<br>";
        
        if($role == "2"){
            $message .= sprintf(__('Role: Recruiter')) . "<br>";
        } else {
            $message .= sprintf(__('Role: Talent')) . "<br>";
        }

        $message .= sprintf(__('User photo:')) . "<br>";
        $message .= '<img width="150px" height="150px" src="'.site_url().'/wp-content/uploads/profilephotos/'.$user_id.'/'.$current_profile_photo.'"/>';

        $message .= '<br>';

        $message .= '<b>'.__('Regards,')."</b><br>";
        $message .= '<b>'.sprintf(__("Team GatewayToBollywood")) . "</b><br>";
  
        @wp_mail(get_option('admin_email'), sprintf(__('%s Website New User Registration Details'), get_bloginfo('name')), $message , $headers);
  
        if ( empty($plaintext_pass) )
            return;
  
        if($role == "2"){
            $message  = sprintf(__("Hi %s,"), $first_name) . "<br><br>";

            $options = get_option( 'gateway_bollywood_options' );

            $message .= sprintf(__("Welcome to %s!"), get_bloginfo('name')) . "<br><br>";
            
            $message .= sprintf(__("You're Going Too Good :)")) . "<br><br>";
            
            $message .= sprintf(__("Thanks & Congratulations to register with us!!")) . "<br><br>";
            
            //$message .= get_page_link($options['gateway_bollywood_field_login_page']) . "<br>";
            $message .= sprintf(__("Below are your login details :")) . "<br>";
            $message .= sprintf(__('Username: %s'), $user_login) . "<br>";
            $message .= sprintf(__('Password: %s'), $plaintext_pass) . "<br><br>";
            $message .= sprintf(__('You can login here %s.'), get_page_link($options['gateway_bollywood_field_login_page'])) . "<br><br>";
            //$message .= sprintf(__('If you have any problems, please contact me at %s.'), get_option('admin_email')) . "<br><br>";

            $message .= sprintf(__("For Help")) . "<br>";
            $message .= sprintf(__("Email : help@gatewaytobollywood.com")) . "<br>";
            $message .= sprintf(__("Call Us : +91 9927716717")) . "<br><br>";
            
            $message .= sprintf(__("Wish You Good Luck in Your Career.")) . "<br><br>";

            $message .= '<b>'.__('Regards,')."</b><br>";
            $message .= '<b>'.sprintf(__("Team GatewayToBollywood")) . "</b><br>";

        } else {
            //$message  = __('Hi Talent,') . "<br><br>";
            $message  = sprintf(__("Hi %s,"), $first_name) . "<br><br>";

            $options = get_option( 'gateway_bollywood_options' );

            $message .= sprintf(__("Welcome to %s!"), get_bloginfo('name')) . "<br><br>";
            $message .= sprintf(__("You're Going Too Good :)")) . "<br><br>";
            $message .= sprintf(__("In Bollywood Industry, Your talent is your face to thousands of correspondent hunting for the best talent. Keeping your GatewayToBollywood portfolio updated is the most effortless way to stand out among others. Also, we suggest you should be ready to get the best openings-always.")) . "<br><br>";
            $message .= sprintf(__("Thanks & Congratulations to register with us!!")) . "<br><br>";
            
            //$message .= get_page_link($options['gateway_bollywood_field_login_page']) . "<br>";
            $message .= sprintf(__("Below are your login details :")) . "<br>";
            $message .= sprintf(__('Username: %s'), $user_login) . "<br>";
            $message .= sprintf(__('Password: %s'), $plaintext_pass) . "<br><br>";
            $message .= sprintf(__('You can login here %s.'), get_page_link($options['gateway_bollywood_field_login_page'])) . "<br><br>";

            $message .= sprintf(__("For Help")) . "<br>";
            $message .= sprintf(__("Email : help@gatewaytobollywood.com")) . "<br>";
            $message .= sprintf(__("Call Us : +91 9927716717")) . "<br><br>";
            $message .= sprintf(__("Wish You Good Luck in Your Career.")) . "<br><br>";

            $message .= '<b>'.__('Regards,')."</b><br>";
            $message .= '<b>'.sprintf(__("Team GatewayToBollywood")) . "</b><br>";

        }
  
        wp_mail($user_email, sprintf(__('Your registration Details for %s Website'), get_bloginfo('name')), $message , $headers);
  
    }
}

function complete_registration() {
    //echo "in complete_registration";exit;
    global $reg_errors, $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $role, $mobileno, $user_meta_image;
    
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
            
            // mobile save [[CUSTOM]]
            update_user_meta($user, 'mobileno', $mobileno);
            //

            // profile photo save
            //echo "here";exit;
            $extension = pathinfo($user_meta_image['name']);  
            $extension = $extension['extension'];
            $image_name=time().'.'.$extension;
            // Rename file and move to folder
            $uploaddir = ABSPATH . 'wp-content/uploads/profilephotos/';
            $target = $uploaddir.$user.'/';
            wp_mkdir_p( $target );

            $newname=$target.$image_name;
            //var_dump($newname);exit;  
            if(is_uploaded_file($user_meta_image['tmp_name']))  
            { 
                move_uploaded_file($user_meta_image['tmp_name'], $newname);
                update_user_meta( $user, 'user_meta_image', $image_name); 
                //echo 'Photo uploaded!<br>'; 
            }
            // profile photo save

            custom_new_user_notification($user, $password, $role);
        }

        //echo 'Registration complete. You need to wait for admin approval, once you approved by Admin you can <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> with your login credentials.'; 
        echo 'Thanks for signed in to GATEWAY TO BOLLYWOOD.​';
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
        $_POST['role'],
        $_POST['mobileno'],
        $_FILES['user_meta_image']
        );
         
        // sanitize user form input
        global $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $role, $mobileno, $user_meta_image, $user;
        $username   =   sanitize_user( $_POST['username'] );
        $password   =   esc_attr( $_POST['password'] );
        $email      =   sanitize_email( $_POST['email'] );
        $website    =   esc_url( $_POST['website'] );
        $first_name =   sanitize_text_field( $_POST['fname'] );
        $last_name  =   sanitize_text_field( $_POST['lname'] );
        $nickname   =   sanitize_text_field( $_POST['nickname'] );
        $bio        =   esc_textarea( $_POST['bio'] );
        $role       =   $_POST['role'];
        $mobileno   =   (int)$_POST['mobileno'];
        $user_meta_image   =   $_FILES['user_meta_image'];

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
        $role,
        $mobileno,
        $user_meta_image
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
        $role,
        $mobileno
        );
}