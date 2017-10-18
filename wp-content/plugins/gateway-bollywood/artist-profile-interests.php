<?php

function profile_interests_validation($artist_category, $artist_interest)  {
    global $reg_errors;
    $reg_errors = new WP_Error;

    if (!isset($artist_category) || empty($artist_category) ) {
        $reg_errors->add( 'category_invalid', 'Please Select One or more Category' );
    }

    if (!isset($artist_interest) || empty($artist_interest) ) {
        $reg_errors->add( 'interest_invalid', 'Please Select One or more Interest' );
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

function complete_interests_profile() {
    global $reg_errors, $artist_category, $artist_interest, $user_id;
    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

        //var_dump($artist_category);
        if(is_array($artist_category)) $artist_category_str = implode(',', $artist_category);
        //var_dump($artist_interest);
        //exit;
        
        if(!empty($artist_category_str)) update_user_meta( $user_id, 'artist_category_str', $artist_category_str);
        if(!empty($artist_category)) update_user_meta( $user_id, 'artist_category', $artist_category);
        if(!empty($artist_interest)) update_user_meta( $user_id, 'artist_interest', $artist_interest);

        //echo 'Profile Information Updated.';

        global $wpdb;
        $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
        $profile_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_id."'");

        if(!empty($profile_status_data->status)){
            
            $profile_status_data_status = (int)$profile_status_data->status;
            if($profile_status_data_status < 2){
                $wpdb->update(
                    $profile_status_table_name, //table
                    array('status' => 2), //data
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
        ?><div class="goto-button">Profile Interests Saved<br><a style="display: none;" href="<?php echo get_page_link($options['gateway_bollywood_field_profileexperience_page']) ?>">Go to next page</a></div><?php
        //exit;   
    }
}

function artist_profile_interests_html(){
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
            global $saved;
            $saved = false;

            $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
            $profle_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$current_user->id."'");

            if(empty($profle_status_data)){
                $options = get_option( 'gateway_bollywood_options' );
                echo '<h1>You are not authorized.</h1>';
                ?>Please fill your information first : <a href="<?php echo get_page_link($options['gateway_bollywood_field_profile_page']) ?>">Go to Profile page</a><?php
                exit;
            }
            elseif(!empty($profle_status_data->status)){
                $profle_status_data->status = (int)$profle_status_data->status;
                if($profle_status_data->status < 1){
                    $options = get_option( 'gateway_bollywood_options' );
                    echo '<h1>You are not authorized.</h1>';
                    ?>Please fill your information first : <a href="<?php echo get_page_link($options['gateway_bollywood_field_profile_page']) ?>">Go to Profile page</a><?php
                    exit;
                }
            }

            if ( isset($_POST['submit'] ) ) {

                //print_r($_POST);

                profile_interests_validation(
                $_POST['artist_category'],
                $_POST['artist_interest']
                );
                 
                // sanitize user form input
                global $artist_category, $artist_interest, $user_id;
                $artist_category = $_POST['artist_category'];
                $artist_interest  = $_POST['artist_interest'];
                $user_id = $current_user->id;
         
                // call @function complete_registration to create the user
                // only when no WP_error is found
                complete_interests_profile(
                $artist_category,
                $artist_interest
                );

            } else {

                //echo '<pre>';print_r($current_user);

                $username = $current_user->user_login;
                $email = $current_user->user_email;
                $first_name = $current_user->user_firstname;
                $last_name = $current_user->user_lastname;
                $display_name = $current_user->display_name;
                $user_id = $current_user->id;
            }

            echo artist_profile_timeline_html();
            ?>

            <form class="profile-form-2" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="post" enctype="multipart/form-data">
                <?php
                // artist category

                $all_categories = get_posts(array('post_type'=>'category','numberposts' => 50));
                //echo '<pre>';print_r($all_categories);echo '</pre>';
                if(count($all_categories) > 0){
                    ?>
                    <div>
                    <label for="artist_category">Artist Category*</label>
                    <?php
                    $artist_category_counter = 1;
                    foreach ($all_categories as $cate_key => $category) {
                        if(!empty($_POST['artist_category']) && in_array($category->ID, $_POST['artist_category']))
                        {
                            $selectedStr = 'checked="checked"';
                        }
                        elseif(!empty(get_user_meta($user_id, 'artist_category')[0]) && in_array($category->ID, get_user_meta($user_id, 'artist_category')[0])) 
                        {
                            $selectedStr = 'checked="checked"';
                        }
                        else {
                            $selectedStr = '';
                        }

                        echo '<div class="check-box"><input type="checkbox" '.$selectedStr.' name="artist_category[]" id="artist_category" value="'.$category->ID.'"> '.$category->post_title.'</div>';
                        $artist_category_counter++;
                    }
                    ?></div><?php
                }
                ?>


                <?php
                // artist interest

                $all_interests = get_posts(array('post_type'=>'interest', 'numberposts' => 50));
                //echo '<pre>';print_r($all_interests);echo '</pre>';
                if(count($all_interests) > 0){
                    ?>
                    <div>
                    <label for="artist_interest">Artist Interests*</label>
                    <?php
                    $artist_interest_counter = 1;
                    foreach ($all_interests as $cate_key => $interest) {
                        if(!empty($_POST['artist_interest']) && in_array($interest->ID, $_POST['artist_interest']))
                        {
                            $selectedStr = 'checked="checked"';
                        }
                        elseif(!empty(get_user_meta($user_id, 'artist_interest')[0]) && in_array($interest->ID, get_user_meta($user_id, 'artist_interest')[0])) 
                        {
                            $selectedStr = 'checked="checked"';
                        }
                        else {
                            $selectedStr = '';
                        }

                        echo '<div class="check-box"><input type="checkbox" '.$selectedStr.' name="artist_interest[]" id="artist_interest" value="'.$interest->ID.'"> '.$interest->post_title.'</div>';
                        $artist_interest_counter++;
                    }
                    ?></div><?php
                }
                ?>
                <br>
                <br>
                <?php
                $options = get_option( 'gateway_bollywood_options' );
                ?>
                <a class="back-btn" href="<?php echo get_page_link($options['gateway_bollywood_field_profile_page']) ?>">Back to Profile Information</a>
                <input type="submit" name="submit" value="Save & Continue"/>
                <?php
                $options = get_option( 'gateway_bollywood_options' );
                if($saved){
                    ?>
                    <a class="back-btn" href="<?php echo get_page_link($options['gateway_bollywood_field_profileexperience_page']) ?>">Go to next page</a>
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
?>