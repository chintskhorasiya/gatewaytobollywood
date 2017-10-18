<?php
session_start();

function login_validation( $username, $password, $rememberme, $redirect_to, $user_cookie)  {
    global $reg_errors;
    $reg_errors = new WP_Error;

    if ( empty( $username ) ) {
        $reg_errors->add('field', 'Please enter your username');
    }

    if ( empty( $password ) ) {
        $reg_errors->add('field', 'Please enter your password');
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

function artist_login_html(){

//echo do_shortcode('[wpadm-login]');
if ( isset($_POST['user-submit']) && $_POST['user-submit'] == "Login" ) {
    
    //print_r($_POST);
    
    login_validation(
        $_POST['log'],
        $_POST['pwd'],
        $_POST['rememberme'],
        $_POST['redirect_to'],
        $_POST['user-cookie]']
    );

    $username   =   sanitize_user( $_POST['log'] );
    $password   =   esc_attr( $_POST['pwd'] );
    $rememberme       =   $_POST['rememberme'];
    $redirect_to       =   $_POST['redirect_to'];
    $user_cookie       =   $_POST['user-cookie'];

    global $reg_errors;

    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

        $credentials = array(); // Back-compat for plugins passing an empty string.

        $credentials['user_login'] = $username;
        $credentials['user_password'] = $password;
        $credentials['remember'] = $rememberme;

        $user = wp_signon ( $credentials, $user_cookie );

        //var_dump($user);

        if(is_wp_error($user)){

            $login_errors = $user->errors;

            foreach ($login_errors as $login_error) {
                
                if(is_array($login_error)){
                    
                    foreach ($login_error as $single_error) {

                        $reg_errors->add('field', $single_error);
                    
                    }

                } else {
                    $reg_errors->add('field', $login_error);
                }

            }

            foreach ( $reg_errors->get_error_messages() as $error ) {
         
                echo '<div class="errors">';
                echo '<strong>ERROR</strong>:';
                echo $error . '<br/>';
                echo '</div>';
                 
            }

        } else {
            exit;
        }
    }
}
?>
<!-- CSS -->

<style type="text/css">
/* tabbed list */
ul.tabs_login {
    padding: 0; margin: 20px 0 0 0;
    position: relative;
    list-style: none;
    font-size: 14px;
    z-index: 1000;
    float: left;
    }
ul.tabs_login li {
    border: 1px solid #E7E9F6;
     -webkit-border-top-right-radius: 10px;
     -khtml-border-radius-topright: 10px;   
     -moz-border-radius-topright: 10px;
    border-top-right-radius: 10px;
     -webkit-border-top-left-radius: 10px;
     -khtml-border-radius-topleft: 10px;    
     -moz-border-radius-topleft: 10px;
    border-top-left-radius: 10px;
    line-height: 28px; /* = */ height: 28px;
    padding: 0; margin: 0 5px 0 0;
    position: relative;
    background: #fff;
    overflow: hidden;
    float: left;
    }
ul.tabs_login li a {
    text-decoration: none;
    padding: 0 10px;
    display: block;
    outline: none;
    }
html ul.tabs_login li.active_login {
    border-left: 1px solid #E7E9F6;
    border-bottom: 1px solid #fff;
     -webkit-border-top-right-radius: 10px;
     -khtml-border-radius-topright: 10px;   
     -moz-border-radius-topright: 10px;
    border-top-right-radius: 10px;
     -webkit-border-top-left-radius: 10px;
     -khtml-border-radius-topleft: 10px;    
     -moz-border-radius-topleft: 10px;
    border-top-left-radius: 10px;
    background: #fff;
    color: #333;
    }
html body ul.tabs_login li.active_login a { font-weight: bold; }
.tab_container_login {
    background: #fff;
    position: relative;
    margin: 0 0 20px 0;
    border: 1px solid #E7E9F6;
     -webkit-border-bottom-left-radius: 10px;
     -khtml-border-radius-bottomleft: 10px; 
     -moz-border-radius-bottomleft: 10px;
    border-bottom-left-radius: 10px;
     -webkit-border-bottom-right-radius: 10px;
     -khtml-border-radius-bottomright: 10px;    
     -moz-border-radius-bottomright: 10px;
    border-bottom-right-radius: 10px;
     -webkit-border-top-right-radius: 10px;
     -khtml-border-radius-topright: 10px;   
     -moz-border-radius-topright: 10px;
    border-top-right-radius: 10px;
    z-index: 999;
    float: left;
    width: 100%;
    top: -1px;
    }
.tab_content_login {
    padding: 7px 15px 15px 15px;
    padding-top: 10px;
    }
    .tab_content_login ul {
        padding: 0; margin: 0 0 0 15px;
        }
        .tab_content_login li { margin: 5px 0; }
/* global styles */
#login-register-password {}
    #login-register-password h3 {
        border: 0 none;
        margin: 10px 0;
        padding: 0;
        }
    #login-register-password p {
        margin: 0 0 15px 0;
        padding: 0;
        }
/* form elements */
.wp-user-form {}
    .username, .password, .login_fields {
        margin: 7px 0 0 0;
        overflow: hidden;
        width: 100%;
        }
        .username label, .password label { float: left; clear: none; width: 25%; }
        .username input, .password input { 
            font: 12px/1.5 "Lucida Grande", "Lucida Sans Unicode", Verdana, sans-serif;
            float: left; clear: none; width: 200px; padding: 2px 3px; color: #777;
            }
.rememberme { overflow: hidden; width: 100%; margin-bottom: 7px; }
#rememberme { float: left; clear: none; margin: 4px 4px -4px 0; }
.user-submit { padding: 5px 10px; margin: 5px 0; }
.userinfo { float: left; clear: none; width: 75%; margin-bottom: 10px; }
    .userinfo p { 
        margin-left: 10px; 
        }
.usericon { float: left; clear: none; width: 15%; margin: 0 0 10px 22px; }
    .usericon img {
        border: 1px solid #F4950E;
        padding: 1px;
        }
</style>


<div id="login-register-password">

    <?php global $user_ID, $user_identity, $reg_errors; if (!$user_ID) { ?>

    <?php
    $login_errors = $_SESSION['login_error_msgs'];
    if ( 1 >= count($login_errors) && !empty($login_errors)) {

        foreach ( $login_errors as $error ) {

            echo '<div class="alert alert-danger alert-dismissable">';
            //echo '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
            //echo '<strong>ERROR</strong>:';
            echo $error . '<br/>';
            echo '</div>';
            unset($_SESSION['login_error_msgs']);
        }
    }

    $success_msgs = $_SESSION['login_success_msgs'];
    if ( count($success_msgs) && !empty($success_msgs) > 0) {

        foreach ( $success_msgs as $success_msg ) {

            echo '<div class="alert alert-success alert-dismissable">';
            //echo '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
            //echo '<strong>ERROR</strong>:';
            echo $success_msg . '<br/>';
            echo '</div>';
            unset($_SESSION['login_success_msgs']);
        }
    }
    ?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <ul class="tabs_login">
        <li class="active_login"><a href="#tab1_login">Login</a></li>
    </ul>
    <div class="tab_container_login">
        <div id="tab1_login" class="tab_content_login">

            <?php $register = $_GET['register']; $reset = $_GET['reset']; if ($register == true) { ?>

            <h3>Success!</h3>
            <p>Check your email for the password and then return to log in.</p>

            <?php } elseif ($reset == true) { ?>

            <h3>Success!</h3>
            <p>Check your email to reset your password.</p>

            <?php } else { ?>

            <h3>Have an account?</h3>
            <p>Log in or sign up! It&rsquo;s fast &amp; <em>free!</em></p>

            <?php } ?>
            
            <form method="post" action="<?php echo site_url().'/wp-includes/custom-login-handler.php' ?>" class="wp-user-form"> <!-- <?php // bloginfo('url') ?>/wp-login.php -->
                <div class="username">
                    <label for="user_login"><?php _e('Username'); ?>: </label>
                    <input type="text" name="log" value="<?php echo esc_attr(stripslashes($user_login)); ?>" size="20" id="user_login" tabindex="11" />
                </div>
                <div class="password">
                    <label for="user_pass"><?php _e('Password'); ?>: </label>
                    <input type="password" name="pwd" value="" size="20" id="user_pass" tabindex="12" />
                </div>
                <div class="login_fields">
                    <div class="rememberme">
                        <label for="rememberme">
                            <input type="checkbox" name="rememberme" value="forever" checked="checked" id="rememberme" tabindex="13" /> Remember me
                        </label>
                    </div>
                    <?php do_action('login_form'); ?>
                    <input type="submit" name="user-submit" value="<?php _e('Login'); ?>" tabindex="14" class="user-submit" />
                    <input type="hidden" name="redirect_to" value="<?php echo site_url().'/profile'; ?>" />
                    <input type="hidden" name="user-cookie" value="1" />
                </div>
            </form>
        </div>
    </div>

    <?php } else { // is logged in ?>

    <div class="sidebox">
        <h3>Welcome, <?php echo $user_identity; ?></h3>
        <div class="usericon">
            <?php global $userdata; echo get_avatar($userdata->ID, 60); ?>

        </div>
        <div class="userinfo">
            <p>You&rsquo;re logged in as <strong><?php echo $user_identity; ?></strong></p>
            <p>
                <a href="<?php echo wp_logout_url('index.php'); ?>">Log out</a> | 
                <?php if (current_user_can('manage_options')) { 
                    echo '<a href="' . admin_url() . '">' . __('Admin') . '</a>'; } else { 
                    echo '<a href="' . site_url() . '/profile">' . __('Profile') . '</a>'; } ?>

            </p>
        </div>
    </div>

    <?php } ?>

</div>

<!-- jQuery -->

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8">
    jQuery(document).ready(function() {
        jQuery(".tab_content_login").hide();
        jQuery("ul.tabs_login li:first").addClass("active_login").show();
        jQuery(".tab_content_login:first").show();
        jQuery("ul.tabs_login li").click(function() {
            jQuery("ul.tabs_login li").removeClass("active_login");
            jQuery(this).addClass("active_login");
            jQuery(".tab_content_login").hide();
            var activeTab = jQuery(this).find("a").attr("href");
            if (jQuery.browser.msie) {jQuery(activeTab).show();}
            else {jQuery(activeTab).show();}
            return false;
        });
    });
</script>


<?php
}


function artist_lostpassword_html(){
?>
    <div id="login-register-password">

    <?php global $user_ID, $user_identity, $reg_errors; if (!$user_ID) { ?>

    <?php
    $login_errors = $_SESSION['login_error_msgs'];
    if ( count($login_errors) && !empty($login_errors) > 0) {

        foreach ( $login_errors as $error ) {

            echo '<div class="alert alert-danger alert-dismissable">';
            //echo '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
            //echo '<strong>ERROR</strong>:';
            echo $error . '<br/>';
            echo '</div>';
            unset($_SESSION['login_error_msgs']);
        }
    }
    ?>

    <?php
    $success_msgs = $_SESSION['login_success_msgs'];
    if ( count($success_msgs) && !empty($success_msgs) > 0) {

        foreach ( $success_msgs as $success_msg ) {

            echo '<div class="alert alert-success alert-dismissable">';
            //echo '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
            //echo '<strong>ERROR</strong>:';
            echo $success_msg . '<br/>';
            echo '</div>';
            unset($_SESSION['login_success_msgs']);
        }
    }
    ?>

    <div class="tab_container_login">
        <div id="tab3_login" class="tab_content_login" style="">
            <h3>Lose something?</h3>
            <p>Enter your username or email to reset your password.</p>
            <form method="post" action="<?php echo site_url('wp-includes/custom-lostpassword-handler.php') ?>" class="wp-user-form">
                <div class="username">
                    <label for="user_login" class="hide"><?php _e('Username or Email'); ?>: </label>
                    <input type="text" name="user_login" value="" size="20" id="user_login" tabindex="1001" />
                </div>
                <div class="login_fields">
                    <?php do_action('login_form', 'resetpass'); ?>
                    <input type="submit" name="user-submit" value="<?php _e('Reset my password'); ?>" class="user-submit" tabindex="1002" />
                    <?php $reset = $_GET['reset']; if($reset == true) { echo '<p>A message will be sent to your email address.</p>'; } ?>
                    <input type="hidden" name="redirect_to" value="<?php echo site_url().'/lostpassword'; ?>" />
                    <input type="hidden" name="user-cookie" value="1" />
                </div>
            </form>
        </div>
    </div>

    <?php } else { // is logged in ?>

    <div class="sidebox">
        <h3>Welcome, <?php echo $user_identity; ?></h3>
        <div class="usericon">
            <?php global $userdata; echo get_avatar($userdata->ID, 60); ?>

        </div>
        <div class="userinfo">
            <p>You&rsquo;re logged in as <strong><?php echo $user_identity; ?></strong></p>
            <p>
                <a href="<?php echo wp_logout_url('index.php'); ?>">Log out</a> | 
                <?php if (current_user_can('manage_options')) { 
                    echo '<a href="' . admin_url() . '">' . __('Admin') . '</a>'; } else { 
                    echo '<a href="' . site_url() . '/profile">' . __('Profile') . '</a>'; } ?>

            </p>
        </div>
    </div>

    <?php } ?>

</div>
<?php
}


function artist_resetpassword_html(){
    
    global $user_ID, $user_identity, $reg_errors; 

    if (!$user_ID) :

        $key = $_GET['key'];
        $login = $_GET['login'];

        $login_errors = $_SESSION['login_error_msgs'];
        if ( count($login_errors) && !empty($login_errors) > 0) {

            foreach ( $login_errors as $error ) {

                echo '<div class="alert alert-danger alert-dismissable">';
                //echo '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
                //echo '<strong>ERROR</strong>:';
                echo $error . '<br/>';
                echo '</div>';
                unset($_SESSION['login_error_msgs']);
            }
        }

        $success_msgs = $_SESSION['login_success_msgs'];
        if ( count($success_msgs) && !empty($success_msgs) > 0) {

            foreach ( $success_msgs as $success_msg ) {

                echo '<div class="alert alert-success alert-dismissable">';
                //echo '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>';
                //echo '<strong>ERROR</strong>:';
                echo $success_msg . '<br/>';
                echo '</div>';
                unset($_SESSION['login_success_msgs']);
            }
        }

        global $reg_errors;
        $reg_errors = new WP_ERROR;

        $user = check_password_reset_key($key, $login);
        
        if(is_wp_error($user)){

            $reset_errors = $user->errors;

            foreach ($reset_errors as $reset_error) {
                
                if(is_array($reset_error)){
                    
                    foreach ($reset_error as $single_error) {

                        $reg_errors->add('field', $single_error);
                        //$_SESSION['login_error_msgs'][] = $single_error;
                    
                    }

                } else {
                    $reg_errors->add('field', $reset_error);
                    //$_SESSION['login_error_msgs'][] = $login_error;
                }

            }

            foreach ( $reg_errors->get_error_messages() as $error ) {
             
                echo '<div class="alert alert-danger alert-dismissable">';
                echo $error . '<br/>';
                echo '</div>';
                 
            }
            
            //wp_redirect($redirect_to);
        } else{

            //var_dump($user->id);
            ?>
            <div id="login-register-password">

                <div class="tab_container_login">
                    <div id="tab3_login" class="tab_content_login" style="">
                        <h3>New Password</h3>
                        <p>Type a new password here</p>
                        <form method="post" action="<?php echo site_url('wp-includes/custom-resetpassword-handler.php') ?>" class="wp-user-form">
                            <div class="pass1">
                                <label for="pass1"><?php _e( 'New password', 'personalize-login' ) ?></label>
                                <input type="password" name="pass1" id="pass1" class="input" size="20" value="" autocomplete="off" />
                            </div>
                            <div class="pass2">
                                <label for="pass2"><?php _e( 'Repeat new password', 'personalize-login' ) ?></label>
                                <input type="password" name="pass2" id="pass2" class="input" size="20" value="" autocomplete="off" />
                            </div>
                             
                            <div class="description"><?php echo wp_get_password_hint(); ?></div>
                             
                            <div class="login_fields">
                                <input type="submit" name="user-submit" value="<?php _e('Reset my password'); ?>" class="user-submit" tabindex="1002" />
                                <input type="hidden" name="redirect_to" value="<?php echo site_url().'/login'; ?>" />
                                <input type="hidden" name="user_id" value="<?php echo $user->id; ?>">
                                <input type="hidden" name="page_from" value="<?php echo $_SERVER['REQUEST_URI']; ?>" />
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <?php
        }

    else:

        ?>
        <div id="login-register-password">
            <div class="sidebox">
                <h3>Welcome, <?php echo $user_identity; ?></h3>
                <div class="usericon">
                    <?php global $userdata; echo get_avatar($userdata->ID, 60); ?>

                </div>
                <div class="userinfo">
                    <p>You&rsquo;re logged in as <strong><?php echo $user_identity; ?></strong></p>
                    <p>
                        <a href="<?php echo wp_logout_url('index.php'); ?>">Log out</a> | 
                        <?php if (current_user_can('manage_options')) { 
                            echo '<a href="' . admin_url() . '">' . __('Admin') . '</a>'; } else { 
                            echo '<a href="' . site_url() . '/profile">' . __('Profile') . '</a>'; } ?>

                    </p>
                </div>
            </div>
        </div>
        <?php

    endif;
}
?>