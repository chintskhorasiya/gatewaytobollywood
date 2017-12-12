<?php

function profile_validation($email, $website, $first_name, $last_name, $nickname, $bio, $user_meta_image, $mobileno, $custom_fields )  {
    global $reg_errors;
    $reg_errors = new WP_Error;

    if ( !is_email( $email ) ) {
        $reg_errors->add( 'email_invalid', 'Email is not valid' );
    }

    global $user_ID;

    if ( email_exists( $email ) && $user_ID != email_exists( $email ) ) {
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
    
    $photo_error = array();
    $uploaddir = ABSPATH . 'wp-content/uploads/profilephotos/';

    $target = $uploaddir.$user_ID.'/';
    wp_mkdir_p( $target );

    // Allowed mimes    
    $allowed_ext = "jpg, gif, png";  

    // Default is 50kb 
    $max_size = (1024*1024)*2; // 2MB  

    // height in pixels, default is 175px 
    $max_height = '400';  

    // width in pixels, default is 450px 
    $max_width = '450';

    //var_dump($user_meta_image);
    //var_dump($max_size);

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
        if ($max_width && $max_height) {  
            list($width, $height, $type, $w) = getimagesize($user_meta_image['tmp_name']);  
            if($width > $max_width || $height > $max_height)  
            {  
                $reg_errors->add( 'user-image-height-width', 'Image is too big! max allowable width is&nbsp;' . $max_width .'px and max allowable height is&nbsp;' . $max_height .'px' );  
                array_push($photo_error, 2);
            } 
        } 

        //var_dump($photo_error);

        if(count($photo_error) <= 0) {
            $image_name=time().'.'.$extension;
            // Rename file and move to folder
            $newname=$target.$image_name;
            //var_dump($newname);exit;  
            if(is_uploaded_file($user_meta_image['tmp_name']))  
            { 
                move_uploaded_file($user_meta_image['tmp_name'], $newname);
                update_user_meta( $user_ID, 'user_meta_image', $image_name); 
                //echo 'Photo uploaded!<br>'; 
            }  
        }
    }  else {
        if(!empty(get_user_meta( $user_ID, 'user_meta_image', true)) || !empty($_FILES['user_meta_image']['name'])){
            
        } else {
            $reg_errors->add( 'user-image-type', 'Profile Photo should be required and image type only (jpg, gif, png)!' );  
            array_push($photo_error, 3);
        }
    }


    ///////

    //echo '<pre>';print_r($custom_fields);echo '</pre>';
    
    //if(count($custom_fields) > 0){
        global $wpdb, $artist;

        if($artist){

            $table_name = $wpdb->prefix . "gateway_bollywood_fields";

            $fieldsData = $wpdb->get_results("SELECT id,fid,label,required,validation from $table_name where `active`='1'");

            //echo '<pre>';print_r($fieldsData);echo '</pre>';
            foreach ($fieldsData as $cf_key => $fieldValidationData) {

                //echo '<pre>';print_r($fieldValidationData);echo '</pre>';
                if($fieldValidationData->required){

                    if(!isset($custom_fields[$fieldValidationData->fid]) || empty($custom_fields[$fieldValidationData->fid])){
                        $reg_errors->add($fieldValidationData->fid.'_required', $fieldValidationData->label.' is required' );
                    }

                }

                if($fieldValidationData->validation){

                    if($fieldValidationData->validation == '4'){

                        if(!empty($custom_fields[$fieldValidationData->fid])){

                            if (!is_numeric($custom_fields[$fieldValidationData->fid]) || ($custom_fields[$fieldValidationData->fid] < 1 || $custom_fields[$fieldValidationData->fid] > 100)) {
                                $reg_errors->add($fieldValidationData->fid.'_valid_age', $fieldValidationData->label.' is not valid, Please use numbers between 1 to 100 only' );
                            }

                        }
                    }

                }
            }

        }
    //}

    if ( is_wp_error( $reg_errors ) ) {
     
        foreach ( $reg_errors->get_error_messages() as $error ) {
         
            echo '<div class="error">';
            echo '<strong>ERROR</strong>:';
            echo $error . '<br/>';
            echo '</div>';
             
        }
     
    }
}

function complete_profile() {
    global $reg_errors, $email, $website, $first_name, $last_name, $nickname, $bio, $user_id, $mobileno;
    if ( 1 > count( $reg_errors->get_error_messages() ) ) {
        
        if(!empty($email)) update_user_meta( $user_id, 'email', $email);
        if(!empty($website)) update_user_meta( $user_id, 'user_url', $website);
        if(!empty($mobileno)) update_user_meta( $mobileno, 'mobileno', $website);
        if(!empty($first_name)) update_user_meta( $user_id, 'first_name', $first_name);
        if(!empty($last_name)) update_user_meta( $user_id, 'last_name', $last_name);
        if(!empty($nickname)) update_user_meta( $user_id, 'nickname', $nickname);
        if(!empty($bio)) update_user_meta( $user_id, 'description', $bio);

        $completed_custom_fields = $_POST['custom_field'];
        //echo '<pre>';print_r($completed_custom_fields);echo '</pre>';
        if(count($completed_custom_fields) > 0){
            foreach ($completed_custom_fields as $ccf_key => $completed_custom_field) {
                if(!empty($completed_custom_fields[$ccf_key])) update_user_meta( $user_id, $ccf_key, $completed_custom_fields[$ccf_key]);
            }
        }

        global $wpdb;
        $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
        $profile_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_id."'");
        if(!empty($profile_status_data)){
            $profile_status_data_status = (int)$profile_status_data->status;
            if($profile_status_data_status < 1){
                $wpdb->update(
                    $profile_status_table_name, //table
                    array('status' => 1), //data
                    array('user_id' => $user_id), //data
                    array('%d'), //data format  
                    array('%d') //data format         
                );
            }
        }

        $options = get_option( 'gateway_bollywood_options' );
        //$_SESSION['message'] = 'Profile Information Saved';
        global $saved;
        $saved = true;
        ?><div class="goto-button">Profile Information Saved<br><a style="display: none;" href="<?php echo get_page_link($options['gateway_bollywood_field_profileinterest_page']) ?>">Go to next page</a></div><?php
        //exit;
    }
}

function artist_profile_html(){
    ob_start();
    ?>
    <!-- Theme Template Code -->

    <div id="login-register-password">

        <?php global $user_ID, $user_identity; 

        $role = get_user_meta($user_ID, 'wp_capabilities');

        global $artist;
        global $saved;
        $saved = false;

        $artist = false;
        
        if($role[0]['artist']) $artist = true;

        if (!empty($user_ID)) { ?>

            <?php
            $current_user = wp_get_current_user();
            /**
             * @example Safe usage: $current_user = wp_get_current_user();
             * if ( !($current_user instanceof WP_User) )
             *     return;
             */

            global $wpdb;
            $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
            $profle_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$current_user->id."'");

            if(empty($profle_status_data)){
                $wpdb->insert(
                    $profile_status_table_name, //table
                    array('user_id' => $current_user->id, 'status' => 0), //data
                    array('%d', '%d') //data format         
                );
            }

            if ( isset($_POST['submit'] ) ) {
                profile_validation(
                $_POST['email'],
                $_POST['website'],
                $_POST['fname'],
                $_POST['lname'],
                $_POST['nickname'],
                $_POST['bio'],
                $_FILES['user_meta_image'],
                $_POST['mobileno'],
                $_POST['custom_field']
                );
                 
                // sanitize user form input
                global $email, $website, $first_name, $last_name, $nickname, $bio, $user_id, $mobileno;
                $email      =   sanitize_email( $_POST['email'] );
                $website    =   esc_url( $_POST['website'] );
                $first_name =   sanitize_text_field( $_POST['fname'] );
                $last_name  =   sanitize_text_field( $_POST['lname'] );
                $nickname   =   sanitize_text_field( $_POST['nickname'] );
                $bio        =   esc_textarea( $_POST['bio'] );
                $user_id = $current_user->id;
                $mobileno = (int) $_POST['mobileno'];
         
                // call @function complete_registration to create the user
                // only when no WP_error is found
                complete_profile(
                $email,
                $website,
                $first_name,
                $last_name,
                $nickname,
                $bio,
                $mobileno,
                $_POST['custom_field']
                );

            } else {

                //echo '<pre>';print_r($current_user);

                $username = $current_user->user_login;
                $email = $current_user->user_email;
                $first_name = $current_user->user_firstname;
                $last_name = $current_user->user_lastname;
                $display_name = $current_user->display_name;
                $user_id = $current_user->id;
                $website = get_user_meta($user_id, 'user_url', true);
                $mobileno = get_user_meta($user_id, 'mobileno', true);
                $nickname = get_user_meta($user_id, 'nickname', true);
                $bio = get_user_meta($user_id, 'description', true);

                /*var_dump($website);
                var_dump($nickname);
                var_dump($bio);*/

                //echo '</pre>';
            }


            
            echo artist_profile_timeline_html();
            ?>

            <form class="profile-form-1" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="post" enctype="multipart/form-data">
                <div>
                    <label for="firstname">First Name</label>
                    <input type="text" name="fname" value="<?php echo ( !empty($first_name) ? $first_name : null ) ?>">
                </div>
                 
                <div>
                    <label for="lastname">Last Name</label>
                    <input type="text" name="lname" value="<?php echo ( !empty($last_name) ? $last_name : null ) ?>">
                </div>
                
                <div>
                    <label for="email">Email <strong>*</strong></label>
                    <input type="text" name="email" value="<?php echo ( !empty($email) ? $email : null ) ?>">
                </div>

                <div>
                    <label for="nickname">Nickname</label>
                    <input type="text" name="nickname" value="<?php echo ( !empty($nickname) ? $nickname : null ) ?>">
                </div>
                 
                <div>
                    <label for="website">Website</label>
                    <input type="text" name="website" value="<?php echo ( !empty($website) ? $website : null ) ?>">
                </div>

                <div>
                    <label for="mobileno">Mobile</label>
                    <input type="number" name="mobileno" value="<?php echo ( !empty($mobileno) ? $mobileno : null ) ?>">
                </div>

                <div class="clear"></div>
                <div>
                    <label for="website">Profile Photo* (Max Width:450px and Max Height:400px)</label>
                    <input type="file" name="user_meta_image" id="user_meta_image" value="<?php echo ( !empty($user_meta_image) ? $user_meta_image : null ) ?>">
                    <?php
                    $current_profile_photo = get_user_meta($user_id, 'user_meta_image', true);
                    //var_dump($current_profile_photo);
                    if(!empty($current_profile_photo)){
                        
                        $uploaddir = ABSPATH . 'wp-content/uploads/profilephotos/';
                        $target = $uploaddir.$user_ID.'/';
                        
                        if(file_exists($target.$current_profile_photo))  
                        { 
                            ?>
                            Current Profile Photo : <img src="<?php echo site_url().'/wp-content/uploads/profilephotos/'.$user_ID.'/'.$current_profile_photo ?>" alt="<?php echo $current_user->display_name; ?>" height="50" width="65" />
                            <?php
                        }
                    }
                    ?>
                </div>

                <?php
                global $wpdb;

                if($artist){
                
                $table_name = $wpdb->prefix . "gateway_bollywood_fields";

                $fields = $wpdb->get_results("SELECT id,fid,label,type,options,required,tab,validation from $table_name where `active`='1'");
                
                //exit( var_dump( $wpdb->last_query ) );
                //echo '<pre>';
                //print_r($fields);
                //echo '</pre>';
                
                foreach ($fields as $f_key => $field) {
                    $field_type = $field->type;

                    switch ($field_type) {
                        case 1:
                            if($field->required){ $requiredStr = '*'; } else { $requiredStr = ''; }
                            if($field->validation == '4'){ $noteStr = ' (Please enter age in years, use numbers only, between 1 - 100)'; } else { $noteStr = ''; }

                            if (!empty($_POST['custom_field'][$field->fid]))
                            {
                                $fieldValue = sanitize_text_field($_POST['custom_field'][$field->fid]);
                            }
                            elseif(!empty(get_user_meta($user_id, $field->fid, true))) 
                            {
                                $fieldValue = sanitize_text_field(get_user_meta($user_id, $field->fid, true));
                            }
                            else
                            {
                                $fieldValue = '';
                            }
                            
                            if($field->fid == "location") echo '<div class="clear"></div>';
                            echo '
                            <div>
                                <label for="'.$field->fid.'">'.$field->label.$requiredStr.$noteStr.'</label>
                                <input type="text" name="custom_field['.$field->fid.']" value="'.$fieldValue.'">
                            </div>';
                            break;

                        case 2:
                            if($field->required){ $requiredStr = '*'; } else { $requiredStr = ''; }
                            
                            if (!empty($_POST['custom_field'][$field->fid]))
                            {
                                $fieldValue = sanitize_text_field($_POST['custom_field'][$field->fid]);
                            }
                            elseif(!empty(get_user_meta($user_id, $field->fid, true))) 
                            {
                                $fieldValue = sanitize_text_field(get_user_meta($user_id, $field->fid, true));
                            }
                            else
                            {
                                $fieldValue = '';
                            }

                            echo '
                            <div>
                                <label for="'.$field->fid.'">'.$field->label.$requiredStr.'</label>
                                <textarea name="custom_field['.$field->fid.']">'.$fieldValue.'</textarea>
                            </div>';
                            break;

                        case 3:
                            if($field->required){ $requiredStr = '*'; } else { $requiredStr = ''; }
                            echo '
                            <div>
                                <label for="'.$field->fid.'">'.$field->label.$requiredStr.'</label>';
                                
                                $field_options = json_decode($field->options, true);
                                $field_options_counter = 1;
                                foreach ($field_options as $fo_key => $option) {
                                    if($_POST['custom_field'][$field->fid] == $field_options_counter)
                                    {
                                        $selectedStr = 'checked="checked"';
                                    }
                                    elseif(get_user_meta($user_id, $field->fid, true) == $field_options_counter) 
                                    {
                                        $selectedStr = 'checked="checked"';
                                    }
                                    else {
                                        $selectedStr = '';
                                    }

                                    echo '<input type="radio" '.$selectedStr.' name="custom_field['.$field->fid.']" value="'.$field_options_counter.'"> '.$option.' ';
                                    $field_options_counter++;
                                }
                            
                            echo '</div>';
                            break;

                        case 4:
                            $type_name = 'Checkbox';
                            if($field->required){ $requiredStr = '*'; } else { $requiredStr = ''; }
                            echo '
                            <div>
                                <label for="'.$field->fid.'">'.$field->label.$requiredStr.'</label>';
                                
                                $field_options = json_decode($field->options, true);
                                $field_options_counter = 1;
                                foreach ($field_options as $fo_key => $option) {
                                    if(!empty($_POST['custom_field'][$field->fid]) && in_array($field_options_counter, $_POST['custom_field'][$field->fid]))
                                    {
                                        $selectedStr = 'checked="checked"';
                                    }
                                    elseif(!empty(get_user_meta($user_id, $field->fid)[0]) && in_array($field_options_counter, get_user_meta($user_id, $field->fid)[0])) 
                                    {
                                        $selectedStr = 'checked="checked"';
                                    }
                                    else {
                                        $selectedStr = '';
                                    }

                                    echo '<input type="checkbox" '.$selectedStr.' name="custom_field['.$field->fid.'][]" value="'.$field_options_counter.'"> '.$option.' ';
                                    $field_options_counter++;
                                }
                            
                            echo '</div>';
                            break;

                        case 5:
                            if($field->required){ $requiredStr = '*'; } else { $requiredStr = ''; }
                            echo '
                            <div>
                                <label for="'.$field->fid.'">'.$field->label.$requiredStr.'</label>
                                <select name="custom_field['.$field->fid.']">';

                            $field_options = json_decode($field->options, true);
                            $field_options_counter = 1;
                            foreach ($field_options as $fo_key => $option) {
                                if($_POST['custom_field'][$field->fid] == $field_options_counter)
                                {
                                    $selectedStr = 'selected="selected"';
                                }
                                elseif(get_user_meta($user_id, $field->fid, true) == $field_options_counter) 
                                {
                                    $selectedStr = 'selected="selected"';
                                }
                                else {
                                    $selectedStr = '';
                                }
                                echo '<option '.$selectedStr.' value="'.$field_options_counter.'">'.$option.'</option>';
                                $field_options_counter++;
                            }

                            echo '
                            </select>
                            </div>';
                            break;

                        case 6:
                            $type_name = 'Image';
                            break;

                        case 7:
                            $type_name = 'Document';
                            break;

                    }
                }

                }
                ?>
                <div class="clear"></div>
                <div>
                    <label for="bio">About / Bio</label>
                    <textarea name="bio"><?php echo ( !empty($bio) ? $bio : null ) ?></textarea>
                </div>

                <div class="clear"></div>
                <div>
                    <input type="submit" name="submit" value="Save And Continue" />
                </div>
                <?php
                $options = get_option( 'gateway_bollywood_options' );
                
                if($saved){
                    ?>
                    <a class="back-btn" href="<?php echo get_page_link($options['gateway_bollywood_field_profileinterest_page']) ?>">Go to next page</a>
                    <?php
                }
                ?>
            
            </form>
        
        <?php } else {

            $options = get_option( 'gateway_bollywood_options' );

            echo 'Please <a class="back-btn" href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here';

        } ?>

    </div>

<?php
}
ob_get_clean();
?>