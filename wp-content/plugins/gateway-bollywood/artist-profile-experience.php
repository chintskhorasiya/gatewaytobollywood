<?php

function profile_experience_validation($years_experience, $months_experience, $work_description)  {
    global $reg_errors;
    $reg_errors = new WP_Error;

    if (!isset($years_experience) || empty($years_experience) ) {
        $reg_errors->add( 'years_empty_invalid', 'Please enter years of experience' );
    } elseif (!is_numeric($years_experience) || ($years_experience < 0 || $years_experience > 100)) {
        $reg_errors->add( 'years_invalid', 'Please enter valid years of experience' );
    }

    if (!isset($months_experience) || empty($months_experience) ) {
        $reg_errors->add( 'months_empty_invalid', 'Please enter months of experience' );
    } elseif (!is_numeric($months_experience) || ($months_experience < 1 || $months_experience > 12)) {
        $reg_errors->add( 'months_invalid', 'Please enter valid months of experience' );
    }

    if (!isset($work_description) || empty($work_description) ) {
        $reg_errors->add( 'work_empty_invalid', 'Please enter your Work Description' );
    }

    global $user_ID;

    if ( is_wp_error( $reg_errors ) ) {
     
        foreach ( $reg_errors->get_error_messages() as $error ) {
         
            echo '<div class="error">';
            echo '<strong>ERROR</strong>:';
            echo $error . '<br/>';
            echo '</div>';
             
        }
     
    }
}

function complete_experience_profile() {
    global $reg_errors, $years_experience, $months_experience, $work_description, $user_id;
    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

        //var_dump($artist_category);
        //var_dump($artist_interest);
        //exit;
        
        if(!empty($years_experience)) update_user_meta( $user_id, 'years_experience', $years_experience);
        if(!empty($months_experience)) update_user_meta( $user_id, 'months_experience', $months_experience);
        if(!empty($work_description)) update_user_meta( $user_id, 'work_description', $work_description);

        global $wpdb;
        $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
        $profile_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_id."'");

        if(!empty($profile_status_data->status)){
            $profile_status_data_status = (int)$profile_status_data->status;
            if($profile_status_data_status < 3){
                $wpdb->update(
                    $profile_status_table_name, //table
                    array('status' => 3), //data
                    array('user_id' => $user_id), //data
                    array('%d'), //data format  
                    array('%d') //data format         
                );
            }
        }

        echo '<div class="goto-button">Profile Information Updated.</div>';   
    }
}

function artist_profile_experience_html(){
    ?>
    <!-- Theme Template Code -->

    <div id="profile-interests">

        <?php global $user_ID, $user_identity; if (!empty($user_ID)) { ?>

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
                $options = get_option( 'gateway_bollywood_options' );
                echo '<h1>You are not authorized.</h1>';
                //$_SESSION['message'] = 'Profile Information Saved';
                ?>Please fill your interests first : <a href="<?php echo get_page_link($options['gateway_bollywood_field_profileinterest_page']) ?>">Go to Profile Interests</a><?php
                exit;
            }
            elseif(!empty($profle_status_data->status)){
                $profle_status_data->status = (int)$profle_status_data->status;
                if($profle_status_data->status < 2){
                    $options = get_option( 'gateway_bollywood_options' );
                    echo '<h1>You are not authorized.</h1>';
                    //$_SESSION['message'] = 'Profile Information Saved';
                    ?>Please fill your interests first : <a href="<?php echo get_page_link($options['gateway_bollywood_field_profileinterest_page']) ?>">Go to Profile Interests</a><?php
                    exit;
                }
            }

            if ( isset($_POST['submit'] ) ) {

                //print_r($_POST);

                profile_experience_validation(
                $_POST['years_experience'],
                $_POST['months_experience'],
                $_POST['work_description']
                );
                 
                // sanitize user form input
                global $years_experience, $months_experience, $work_description, $user_id;
                $years_experience = $_POST['years_experience'];
                $months_experience  = $_POST['months_experience'];
                $work_description = $_POST['work_description'];
                $user_id = $current_user->id;
         
                // call @function complete_registration to create the user
                // only when no WP_error is found
                complete_experience_profile(
                $years_experience,
                $months_experience,
                $work_description
                );

            } else {

                //echo '<pre>';print_r($current_user);

                $username = $current_user->user_login;
                $email = $current_user->user_email;
                $first_name = $current_user->user_firstname;
                $last_name = $current_user->user_lastname;
                $display_name = $current_user->display_name;
                $user_id = $current_user->id;
                $years_experience = get_user_meta($user_id, 'years_experience', true);
                $months_experience = get_user_meta($user_id, 'months_experience', true);
                $work_description = get_user_meta($user_id, 'work_description', true);
            }

            echo artist_profile_timeline_html();
            ?>

            <form class="profile-form-3" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="post" enctype="multipart/form-data">
                
                <div>
                    <label for="">Years of experience*</label>
                    <input type="number" name="years_experience" min="0" max="100" id="years_experience" placeholder="Years" value="<?php echo $years_experience; ?>" />
                    <input type="number" name="months_experience" min="1" max="12" id="months_experience" placeholder="Months" value="<?php echo $months_experience; ?>" />
                </div>

                <br>

                <div>
                    <label for="">Work Description*</label>
                    <textarea name="work_description" id="work_description"><?php echo $work_description; ?></textarea>
                </div>
                
                <br>
                <br>
                <?php
                $options = get_option( 'gateway_bollywood_options' );
                ?>
                <a class="back-btn" href="<?php echo get_page_link($options['gateway_bollywood_field_profileinterest_page']) ?>">Back to Profile Interests</a>
                <input type="submit" name="submit" value="Save Profile"/>
            
            </form>
        
        <?php } else {

            $options = get_option( 'gateway_bollywood_options' );

            echo 'Please <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here';

        } ?>

    </div>

<?php
}
?>