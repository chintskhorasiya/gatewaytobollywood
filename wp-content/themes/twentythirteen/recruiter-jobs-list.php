<?php /* Template Name: jobslist */ ?>

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

			$total_jobs = $wpdb->get_var("SELECT count(*) from $jobs_table_name where `user_id`='".$current_user->id."'");
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
				$nextpage = site_url().'/recruiter-jobs/?pg='.($currpage+1);				
			}

			if($currpage >= 2) {
				$prevpage = site_url().'/recruiter-jobs/?pg='.($currpage-1);
			} else {
				$prevpage = '#';
			}

			$jobs_data = $wpdb->get_results("SELECT * from $jobs_table_name where `user_id`='".$current_user->id."' order by id DESC limit $curr_limit,$offset");

            //$number_of_jobs_by_user =  $number_of_jobs_by_user_data->total;
            //echo '<pre>';
            //print_r($jobs_data);
            //echo '</pre>';
			?>

			<div class="row">
				<div class="col-md-3">
					<?php require_once('recruiter-sidebar.php'); ?>
				</div>
				<div class="col-md-9">
					
					<!-- Popular-Cities/Towns -->
			        <div class="section-header text-center">
			            <h2>My Jobs</h2>
			        </div>

			        <div class="row">
			        	<div class="add-job">
			        		<a href="<?php echo site_url() ?>/job-form" class="btn btn-default">Add Job</a>
			        	</div>
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
							      <td><a href="<?php echo site_url() ?>/job-form?id=<?php echo $job->id; ?>" class="btn btn-default">Edit Job</a>  <a href="<?php echo site_url() ?>/job-form?id=<?php echo $job->id; ?>&action=delete" class="btn btn-default">Delete Job</a> <a href="<?php echo site_url() ?>/my-applicants?jobId=<?php echo $job->id; ?>" class="btn btn-default">View Applicants</a></td>
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