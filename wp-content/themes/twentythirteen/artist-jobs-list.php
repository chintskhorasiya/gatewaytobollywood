<?php /* Template Name: artist my jobs */ ?>

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
			if (in_array( 'artist', (array) $current_user->roles ) ) :
			

			global $wpdb;

			$jobs_table_name = $wpdb->prefix . "gateway_bollywood_jobs";
			$job_applicants_table_name = $wpdb->prefix . "gateway_bollywood_jobs_applicants";

			//SELECT ap.artist_id, job.* FROM `wp_gateway_bollywood_jobs_applicants` as ap INNER JOIN `wp_gateway_bollywood_jobs` as job ON ap.`job_id` = job.id WHERE ap.artist_id = 2

			$total_jobs = $wpdb->get_var("SELECT count(*) FROM $job_applicants_table_name as ap INNER JOIN $jobs_table_name as job ON ap.`job_id` = job.`id` WHERE ap.`artist_id` = '".$current_user->id."'");
            //var_dump($total_jobs);

            $row_limit = 10;

			$currpage = (!empty($_GET['pg']) ? (int)$_GET['pg'] : 1 );
			
			$curr_limit = ($currpage-1) * $row_limit;
			$offset = $row_limit;

			//var_dump($curr_limit);
			//var_dump($offset);

			if(($curr_limit+$offset) >=  $total_jobs) {
				$nextpage = '#';
			} else {
				$nextpage = site_url().'/artist-jobs/?pg='.($currpage+1);				
			}

			if($currpage >= 2) {
				$prevpage = site_url().'/artist-jobs/?pg='.($currpage-1);
			} else {
				$prevpage = '#';
			}

			$jobs_data = $wpdb->get_results("SELECT ap.artist_id, job.* FROM $job_applicants_table_name as ap INNER JOIN $jobs_table_name as job ON ap.`job_id` = job.`id` WHERE ap.`artist_id` = '".$current_user->id."' order by id DESC limit $curr_limit,$offset");

            //$number_of_jobs_by_user =  $number_of_jobs_by_user_data->total;
            //echo '<pre>';
            //print_r($jobs_data);
            //echo '</pre>';
			?>

			<div class="row">
				<div class="col-md-3">
					<?php require_once('artist-sidebar.php'); ?>
				</div>
				<div class="col-md-9">
					
					<!-- Popular-Cities/Towns -->
			        <div class="section-header text-center">
			            <h2>My Jobs</h2>
			        </div>

			        <div class="row">
			        	<div class="job-list">
				        	<table class="table">
							  <thead class="thead-inverse">
							    <tr>
							      <th>#</th>
							      <th>Title</th>
							      <th>Status</th>
							      <th>Date</th>
							      <th>Action</th>
							    </tr>
							  </thead>
							  <tbody>
							    <?php $sr_counter = $curr_limit; ?>
							    <?php foreach ($jobs_data as $jdkey => $job): ?>
							    <?php $sr_counter++; ?>
							    <tr>
							      <th scope="row"><?php echo $sr_counter; ?></th>
							      <td><?php echo $job->title; ?></td>
							      <td><?php echo (!empty($job->active) ? 'Active' : 'Disabled' ); ?></td>
							      <td><?php echo $job->date_added; ?></td>
							      <td><a href="<?php echo site_url() ?>/trending-job?jobId=<?php echo $job->id; ?>" class="btn btn-default">View Job</a></td>
							    </tr>
								<?php endforeach; ?>
							  </tbody>
							</table>

							<nav aria-label="Page navigation example">
							  <?php if($prevpage != "#"): ?>
							    	<a class="page-link prev-link" href="<?php echo $prevpage; ?>">Previous</a>
							    <?php endif; ?>
							    <?php if($nextpage != "#"): ?>
							    	<a class="page-link next-link pull-right" href="<?php echo $nextpage; ?>">Next</a>
							  	<?php endif; ?>
							</nav>
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