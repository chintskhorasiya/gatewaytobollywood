<?php /* Template Name: change password */ ?>

	<?php include('header.php'); ?>

	<section id="banner">
		<img src="<?php echo get_template_directory_uri() ?>/images/bannermain-inner.jpg" alt="image">
	</section>
	
	<section id="popular_cities" class="section-padding">
		
		<div class="container">
		
		<?php
		global $user_ID;
		?>

		<?php if(is_user_logged_in()): ?>

			<?php
			$current_user = wp_get_current_user();
			if (in_array( 'recruiter', (array) $current_user->roles ) ||  in_array( 'artist', (array) $current_user->roles )) :
			

			global $wpdb;

			if ( isset($_POST['submit'] ) ) {
				
				global $reg_errors;
				$reg_errors = new WP_Error;

				$pass1 = $_POST['pass1'];
				$pass2 = $_POST['pass2'];

				if ( empty( $pass1 ) || empty($pass2) ) {
			        $reg_errors->add('field', 'Please enter both password');
			    }

			    if ( $pass1 != $pass2 ) {
			        $reg_errors->add('field', 'Both password should be same');
			    }

			    if ( empty($user_ID) ) {
			        $reg_errors->add('field', 'Something went wrong');
			    }

			    if ( 1 > count( $reg_errors->get_error_messages() ) ) {

			        wp_set_password($pass1, $user_ID);

			        echo '<div class="alert alert-success alert-dismissable">';
	                echo 'New password set successfully. Now you have to login with new password.';
	                echo '</div>';
			    
			    }
			    else
			    {
			        foreach ( $reg_errors->get_error_messages() as $error ) {
				        echo '<div class="alert alert-danger alert-dismissable">';
		                echo $error . '<br/>';
		                echo '</div>';
		            }
			    }
			}

			?>

			<div class="row">
				<div class="col-md-12">
					
					<!-- Popular-Cities/Towns -->
			        <div class="section-header text-center">
			            <h2>Change Password</h2>
			        </div>

			        <div id="login-register-password">

	                <div class="tab_container_login">
	                    <div id="tab3_login" class="tab_content_login" style=""> 
	                        <p style="margin: 0 0 5px;">Type a new password here</p>
	                        <form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>" class="wp-user-form">
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
	                                <input type="submit" name="submit" value="<?php _e('Reset my password'); ?>" class="user-submit" tabindex="1002" />
	                            </div>
	                        </form>
	                    </div>
	                </div>

	            </div>

			        
			        
				</div>
			</div>

			<?php else: ?>
			<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as recruiter/talent to view this page</h4>'; ?>
			<?php endif; ?>

		<?php else: ?>
		<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as recruiter/talent to view this page</h4>'; ?>
		<?php endif; ?>

		</div>

	</section>
	<!-- /Popular Cities/Towns -->

	<?php get_sidebar(); ?>
	<?php get_footer(); ?>