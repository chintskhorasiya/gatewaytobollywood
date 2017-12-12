<?php /* Template Name: my applicants */ ?>

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

			$job_id = $_GET['jobId'];
			
			global $wpdb;

			$jobs_table_name = $wpdb->prefix . "gateway_bollywood_jobs";
			$job_applicants_table_name = $wpdb->prefix . "gateway_bollywood_jobs_applicants";

			if(!empty($job_id)){
				$job_author = $wpdb->get_var("SELECT user_id from $jobs_table_name where `id`='".$job_id."'");

				$correct_job_author = false;
				if($job_author == $user_ID){
					$correct_job_author = true;
				}
			} else {
				$correct_job_author = true;
			}

			if (in_array( 'recruiter', (array) $current_user->roles ) && $correct_job_author ) :
			
			if(!empty($job_id)){
				$job_where = " AND job.`id` = '".$job_id."'";
			} else {
				$job_where = "";
			}

			$total_applicants = $wpdb->get_var("SELECT count(*) FROM $job_applicants_table_name as ap INNER JOIN $jobs_table_name as job ON ap.`job_id` = job.`id` WHERE job.`user_id` = '".$current_user->id."' $job_where");
            //var_dump($total_applicants);

            $row_limit = 10;

			$currpage = (!empty($_GET['pg']) ? (int)$_GET['pg'] : 1 );
			
			$curr_limit = ($currpage-1) * $row_limit;
			$offset = $row_limit;

			//var_dump($curr_limit);
			//var_dump($offset);

			if(($curr_limit+$offset) >=  $total_applicants) {
				$nextpage = '#';
			} else {
				$nextpage = site_url().'/recruiter-jobs/?pg='.($currpage+1);				
			}

			if($currpage >= 2) {
				$prevpage = site_url().'/recruiter-jobs/?pg='.($currpage-1);
			} else {
				$prevpage = '#';
			}

			$applicants_data = $wpdb->get_results("SELECT ap.`artist_id`,job.* FROM $job_applicants_table_name as ap INNER JOIN $jobs_table_name as job ON ap.`job_id` = job.`id` WHERE job.`user_id` = '".$current_user->id."' $job_where order by id DESC limit $curr_limit,$offset");

            //$number_of_jobs_by_user =  $number_of_jobs_by_user_data->total;
            //echo '<pre>';
            //print_r($applicants_data);
            //echo '</pre>';
			?>

			<div class="row">
				<div class="col-md-3">
					<?php require_once('recruiter-sidebar.php'); ?>
				</div>
				<div class="col-md-9">
					
					<!-- Popular-Cities/Towns -->
			        <div class="section-header text-center">
			            <h2>My Applicants</h2>
			        </div>

			        <div class="row">
			        	<div class="job-list">
				        	<table class="table">
							  <thead class="thead-inverse">
							    <tr>
							      <th>#</th>
							      <th>Applicant Name</th>
							      <th>Job</th>
							      <th>Action</th>
							    </tr>
							  </thead>
							  <tbody>
							    <?php $sr_counter = $curr_limit; ?>
							    <?php foreach ($applicants_data as $jdkey => $applicant): ?>
							    <?php $sr_counter++; ?>
							    <tr>
							      <th scope="row"><?php echo $sr_counter; ?></th>
							      <td><?php echo get_user_meta($applicant->artist_id, 'first_name', true).' '.get_user_meta($applicant->artist_id, 'last_name', true); ?></td>
							      <td><?php echo $applicant->title; ?></td>
							      <td><a href="<?php echo site_url() ?>/talents/?userId=<?php echo $applicant->artist_id; ?>" class="btn btn-default">View Applicant </a>  <a href="<?php echo site_url() ?>/trnding-job/?jobId=<?php echo $applicant->id; ?>" class="btn btn-default">View Job</a></td>
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
			<?php echo '<h4>You are not authorized to view this page Please <a href="'.site_url().'/login'.'">login</a> as a correct user to view this page.</h4>'; ?>
			<?php endif; ?>

		<?php else: ?>
		<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as recruiter to view this page</h4>'; ?>
		<?php endif; ?>

		</div>

	</section>
	<!-- /Popular Cities/Towns -->

	<?php get_sidebar(); ?>
	<?php get_footer(); ?>