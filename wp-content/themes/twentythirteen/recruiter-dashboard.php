<?php /* Template Name: recruiter */ ?>

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
			if (in_array( 'recruiter', (array) $current_user->roles ) ) :
			

			global $wpdb;

			$jobs_table_name = $wpdb->prefix . "gateway_bollywood_jobs";
			$job_applicants_table_name = $wpdb->prefix . "gateway_bollywood_jobs_applicants";

            $number_of_jobs_by_user_data = $wpdb->get_row("SELECT count(*) as total from $jobs_table_name where `user_id`='".$current_user->id."'");

            $number_of_jobs_by_user =  $number_of_jobs_by_user_data->total;

            $total_applicants = $wpdb->get_var("SELECT count(*) FROM $job_applicants_table_name as ap INNER JOIN $jobs_table_name as job ON ap.`job_id` = job.`id` WHERE job.`user_id` = '".$current_user->id."' $job_where");

			?>

			<div class="row">
				<div class="col-md-3">
					<?php require_once('recruiter-sidebar.php'); ?>
				</div>
				<div class="col-md-9">
					
					<!-- Popular-Cities/Towns -->
			        <div class="section-header text-center">
			            <h2>Dashboard</h2>
			        </div>

			        <div class="row">
			        	<div class="col-sm-6 col-md-4">
			                <div class="cities_list hvr-grow">
			                	<span class="fa fa-briefcase"></span>
			                	<div class="city_listings_info">
			                		<p>Jobs added by you</p>
			                        <h4><?php echo $number_of_jobs_by_user ?></h4>
			                    </div>
			                </div>
			                <div class="listing_number"><a href="<?php echo site_url().'/recruiter-jobs'; ?>"><span>View List</span></a></div>
			            </div>

			            <div class="col-sm-6 col-md-4">
			                <div class="cities_list hvr-grow">
			                	<span class="fa fa-user"></span>
			                	<div class="city_listings_info">
			                		<p>Applicants on your Jobs</p>
			                        <h4><?php echo $total_applicants ?></h4>
			                    </div>
			                </div>
			                <div class="listing_number"><a href="<?php echo site_url().'/my-applicants'; ?>"><span>View List</span></a></div>
			            </div>
			        </div>
			        
				</div>
			</div>

			<?php else: ?>
			<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as recruiter to view this page</h4>'; ?>
			<?php endif; ?>

		<?php else: ?>
		<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as recruiter to view this page</h4>'; ?>
		<?php endif; ?>

		</div>

	</section>
	<!-- /Popular Cities/Towns -->

	<?php get_sidebar(); ?>
	<?php get_footer(); ?>