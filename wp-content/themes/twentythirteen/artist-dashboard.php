<?php /* Template Name: artist dashboard */ ?>

	<?php include('header.php'); ?>

	<section id="banner">
		<img src="<?php echo get_template_directory_uri() ?>/images/bannermain-inner.jpg" alt="image">
	</section>
	
	<section id="popular_cities" class="section-padding">
		
		<div class="container">
		
		<?php if(is_user_logged_in()): ?>

			<?php
			global $user_ID;
			?>

			<?php
			$current_user = wp_get_current_user();
			if (in_array( 'artist', (array) $current_user->roles ) ) :
			

			global $wpdb;

			$jobs_table_name = $wpdb->prefix . "gateway_bollywood_jobs";
			$job_applicants_table_name = $wpdb->prefix . "gateway_bollywood_jobs_applicants";

			$number_of_applied_jobs = $wpdb->get_var("SELECT count(*) FROM $job_applicants_table_name as ap INNER JOIN $jobs_table_name as job ON ap.`job_id` = job.`id` WHERE ap.`artist_id` = '".$current_user->id."'");

			?>

			<div class="row">
				<div class="col-md-3">
					<?php require_once('artist-sidebar.php'); ?>
				</div>
				<div class="col-md-9">
					
					<!-- Popular-Cities/Towns -->
			        <div class="section-header text-center">
			            <h2>Dashboard</h2>
			        </div>

			        <div class="row">
			        	<div class="col-sm-6 col-md-4">
			                <div class="cities_list hvr-grow">
			                	<span class="fa fa-user"></span>
			                	<div class="city_listings_info">
			                		<p></p>
			                        <h4>PROFILE</h4>
			                    </div>
			                </div>
			                <div class="listing_number"><a href="<?php echo site_url().'/profile'; ?>"><span>Edit Profile</span></a></div>
			            </div>

			            <div class="col-sm-6 col-md-4">
			                <div class="cities_list hvr-grow">
			                	<span class="fa fa-briefcase"></span>
			                	<div class="city_listings_info">
			                		<p>You applied on</p>
			                        <h4><?php echo $number_of_applied_jobs ?></h4>
			                    </div>
			                </div>
			                <div class="listing_number"><a href="<?php echo site_url().'/artist-jobs'; ?>"><span>My Jobs</span></a></div>
			            </div>
			        </div>
			        
				</div>
			</div>

			<?php else: ?>
			<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as Talent to view this page</h4>'; ?>
			<?php endif; ?>

		<?php else: ?>
		<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as Talent to view this page</h4>'; ?>
		<?php endif; ?>

		</div>

	</section>
	<!-- /Popular Cities/Towns -->

	<?php get_sidebar(); ?>
	<?php get_footer(); ?>