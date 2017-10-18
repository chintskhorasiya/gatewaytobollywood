<?php /* Template Name: trending jobs */ ?>
<?php
if($_POST['action'] == "job-apply"){
	
	$apply_job_id = (int)$_POST['job_id'];
	$apply_artist_id = (int)$_POST['artist_id'];

	if(!empty($apply_job_id) && !empty($apply_artist_id)){
		
		global $wpdb;

		$job_applicants_table_name = $wpdb->prefix . "gateway_bollywood_jobs_applicants";

		$already_applied = $wpdb->get_var("SELECT count(*) from $job_applicants_table_name where `job_id`='".$apply_job_id."' AND `artist_id` = '".$apply_artist_id."'");

		if($already_applied == 0){

			$applied_result = $wpdb->insert(
	            $job_applicants_table_name, //table
	            array('job_id' => $apply_job_id, 'artist_id' => $apply_artist_id), //data
	            array('%d', '%d') //data format         
	        );

	        if($applied_result){
	        	exit("true");
	        } else {
	        	exit("false");
	        }

		} else {
			exit("already_applied");
		}
    } else {
		exit("false");
    }
}
?>

<?php include('header.php'); ?><section id="banner">		 <img src="<?php echo get_template_directory_uri() ?>/images/bannermain-inner.jpg" alt="image"></section>
<section id="popular_cities" class="section-padding">
<div class="container">
<?php
global $user_ID;

//var_dump($_GET);
//var_dump($_POST);
//var_dump(get_query_var('talents'));

if(!empty($_GET['jobId']) && is_numeric($_GET['jobId'])){

$jobId = $_GET['jobId'];

global $wpdb;

$table_name = $wpdb->prefix . "gateway_bollywood_jobs";

$job_detail = $wpdb->get_row("SELECT * from $table_name where id=$jobId");

$title = $job_detail->title;
$description = $job_detail->description;
$job_image = $job_detail->job_image;
$job_image = $job_detail->job_image;
$job_user_id = $job_detail->user_id;
$gender = $job_detail->gender;
$age_from = $job_detail->age_from;
$age_to = $job_detail->age_to;
$job_category = $job_detail->job_category;
$job_type = $job_detail->job_type;
$job_start_date = $job_detail->job_start_date;
$job_end_date = $job_detail->job_end_date;
$expiry_date = $job_detail->expiry_date;
$date_added = $job_detail->date_added;

$active = $job_detail->active;
$featured = $job_detail->featured;
?>
	<div class="row">
		<div class="col-md-12">
			<div class="profile-head">
	        	<div class="col-md-2"> 
	        		<div class="job-photo">
	        			<?php
	                    	if(empty($job_image)){
	                    		?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/no-job-image.png'; ?>" height="70" width="100" alt="No-Image" title="No-Image" /><?php
	                    	} else {
	                    		?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/'.$job_user_id.'/'.$job_image ?>" height="70" width="100" alt="<?php echo $title; ?>" title="<?php echo $title; ?>" /><?php
	                    	}
	                    ?>
	        		</div>
	        	</div>
	        	<div class="col-md-10 right-profile">
	        		<h2><?php echo $title; ?></h2>
	        		<div class="info-line-2">
	            		<?php if(empty($gender)) { echo "Male/Female"; } elseif($gender == "1") { echo "Male"; } elseif($gender == "2"){ echo 'Female'; } ?>
	        		</div>
	        		<div class="info-line-3">
	        			<?php if(!empty($job_category)) { echo get_the_title($job_category); } ?>
	        		</div>
			    </div>
			</div>
			<div class="profile-bottom">
				<div class="container"><h2><?php echo get_user_meta($artistId, 'description', true); ?></h2></div>
					<div class="msg-container" id="msg_container">
					</div>
					<div id="exTab2" class="job-detail">	
						
						<ul class="nav nav-tabs">
							<li class="active"><a  href="#1" data-toggle="tab">Job Detail</a></li>
					    </ul>

					    <div class="tab-content ">
					    	<div class="tab-pane active" id="1">
					    		<div class="row">
					    			<div class="col-md-6">
					    				<div class="single-info">
					    					<div class="info-label">Job Title</div>
					    					<div class="info-value"><?php echo $title; ?></div>
					    				</div>
					    				<div class="single-info">
					    					<div class="info-label">Job Description</div>
					    					<div class="info-value"><?php echo wpautop($description); ?></div>
					    				</div>
					    				<div class="single-info">
					    					<div class="info-label">Job Recruiter</div>
					    					<div class="info-value"><?php $usersData = get_userdata($job_user_id); ?><?php echo $usersData->display_name; ?></div>
					    				</div>
					    				<!--<div class="single-info">
					    					<div class="info-label">Job Image</div>
					    					<div class="info-value">
					    						<?php
							                    	if(empty($job_image)){
							                    		?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/no-job-image.png'; ?>" height="70" width="100" alt="No-Image" title="No-Image" /><?php
							                    	} else {
							                    		?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/'.$job_user_id.'/'.$job_image ?>" height="70" width="100" alt="<?php echo $title; ?>" title="<?php echo $title; ?>" /><?php
							                    	}
							                    ?>
					    					</div>
					    				</div>-->
					    				<div class="job-actions">
					    					<?php $gateway_options = get_option( 'gateway_bollywood_options' ); ?>
										    <?php if (in_array( 'artist', (array) $current_user->roles ) ) : ?>
												
												<?php
												global $wpdb;
												
												$job_applicants_table_name = $wpdb->prefix . "gateway_bollywood_jobs_applicants";

												$already_applied = $wpdb->get_var("SELECT count(*) from $job_applicants_table_name where `job_id`='".$jobId."' AND `artist_id` = '".$user_ID."'");

												if($already_applied > 0){
												?>
													<button class="btn butn butnGreen">Applied</button>
												<?php
												} else {
												?>

												<button class="btn butn butnOrange" id="jobApply">Apply</button>
											    <input type="hidden" id="apply_job_id" value="<?php echo $jobId; ?>">
											    <input type="hidden" id="apply_artist_id" value="<?php echo $user_ID; ?>">
											    <script type="text/javascript">
											    	jQuery(document).ready(function(){
											    		jQuery('#jobApply').click(function(){
											    			//alert('Job Apply started!');
											    			var applyJobId = jQuery('#apply_job_id').val();
											    			var applyArtistId = jQuery('#apply_artist_id').val();

											    			if(applyJobId != '' && applyArtistId != ''){
											    				jQuery.ajax({ url: "<?php echo site_url() ?>/trending-jobs",
																     data: {"action": "job-apply", "job_id" : applyJobId, "artist_id" : applyArtistId },
																     type: 'post',
																     success: function(output) {
																        console.log(output);
																        if(output == "true"){
																        	//alert('You have successfully applied.');
																        	jQuery('#msg_container').html('<div class="alert alert-success alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>Applied!</strong> you have successfully applied for this Job.</div>');
																        	jQuery('#jobApply').replaceWith('<button class="btn butn butnGreen">Applied</button>');
																        } else if(output == "already_applied"){
																        	//alert('You have already applied.');
																        	jQuery('#msg_container').html('<div class="alert alert-warning alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>Applied!</strong> you have already applied for this Job.</div>');
																        	jQuery('#jobApply').replaceWith('<button class="btn butn butnGreen">Applied</button>');
																        } else {
																        	//alert('Something went wrong please try again.');
																        	jQuery('#msg_container').html('<div class="alert alert-danger alert-dismissable"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>Error!</strong> Something went wrong please try again.</div>');
																        }
																     }
																});
											    			}
											    		});
											    	});
											    </script>
											    <?php } ?>
											<?php else: ?>
												<a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_login_page']); ?>"><button class="btn butn butnOrange">Login as Talent to apply</button></a>
											<?php endif; ?>

											<a href="<?php echo site_url().'/trending-jobs/'; ?>"><button class="btn butn butnOrange">Back to Jobs</button></a>
					    				</div>
					    			</div>
					    			<div class="col-md-6">
					    				<div class="single-info">
					    					<div class="info-label">Job Criterias</div>
					    					<div class="info-value">
					    						<div class="info-sub-label">Gender</div>
					    						<div class="info-sub-value"><?php if(empty($gender)) { echo "Male/Female"; } elseif($gender == "1") { echo "Male"; } elseif($gender == "2"){ echo 'Female'; } ?></div>

					    						<div class="info-sub-label">Age Limit</div>
					    						<div class="info-sub-value">
					    							<?php if(!empty($age_from) || !empty($age_from)): ?>
											        	<?php if(!empty($age_from) && !empty($age_from)): ?>
													          <span class="age"><?php echo $age_from; ?> to <?php echo $age_to; ?> Years</span>
												    	<?php else: ?>
												    		<?php if(!empty($age_from)): ?>
														          <span class="age"><?php echo $age_from; ?> Years</span>
													    	<?php else: ?>
														          <span class="age"><?php echo $age_to; ?> Years</span>
													    	<?php endif; ?>
												    	<?php endif; ?>
												    <?php else: ?>
												    	<span class="age">No age limit</span>
											        <?php endif; ?>
					    						</div>

					    						<div class="info-sub-label">Job Category</div>
					    						<div class="info-sub-value"><?php if(!empty($job_category)) { echo get_the_title($job_category); } ?></div>

					    						<div class="info-sub-label">Job Type</div>
					    						<div class="info-sub-value"><?php if(!empty($job_type)) { echo get_the_title($job_type); } ?></div>

					    						<div class="info-sub-label">Shooting Duration</div>
					    						<div class="info-sub-value"><?php echo $job_start_date; ?> - <?php echo $job_end_date; ?></div>

					    						<div class="info-sub-label">Expires On</div>
					    						<div class="info-sub-value"><?php echo $expiry_date; ?></div>

					    						<div class="info-sub-label">Added On</div>
					    						<div class="info-sub-value"><?php echo $date_added; ?></div>
					    					</div>
					    				</div>
					    			</div>
					    		</div>
					    	</div>
					    </div>

					</div>
				</div>
			</div>
		</div>
	</div>
<?php
} else {
	?>
	<?php

	//print_r($_POST);
	/*$search_gender = (!empty($_POST['search_gender']) ? $_POST['search_gender'] : null );
	$search_premium = (!empty($_POST['search_premium']) ? $_POST['search_premium'] : null );
	$search_age = (!empty($_POST['search_age']) ? $_POST['search_age'] : null );
	$search_artist_category = (!empty($_POST['search_artist_category']) ? $_POST['search_artist_category'] : null );
	$search_location = (!empty($_POST['search_location']) ? $_POST['search_location'] : null );

	$args = array('role'=>'artist');
	$args['meta_query'] = array('relation'=>'AND');*/
	
	/*if(!empty($search_gender)){
		//array( 'meta_key' => 'age', 'meta_value' => '30', 'meta_compare' => '<' )
		$search_gender_arr = array(
			'key' => 'gender',
			'value' => $search_gender
		);
		array_push($args['meta_query'], $search_gender_arr);
	}

	if(!empty($search_age)){
		$search_age_arr = array(
			'key' => 'age',
			'value' => array(0, $search_age),
			'type'    => 'numeric',
			'compare' => 'BETWEEN'
		);
		array_push($args['meta_query'], $search_age_arr);
	}*/

	/*if(!empty($search_artist_category)){
		$search_category_arr = array(
			'key' => 'artist_category',
			'value' => array('41'),
			'type'    => 'CHAR',
			'compare' => 'IN'
		);
		array_push($args['meta_query'], $search_category_arr);
	}*/

	/*if(!empty($search_location)){
		
		$search_location_arr = array(
			'key' => 'location',
			'value' => $search_location,
			'compare' => 'LIKE'
		);
		array_push($args['meta_query'], $search_location_arr);
	}*/

	//echo '<pre>';print_r($args);echo '</pre>';

	$search_job = (!empty($_GET['search_job']) ? $_GET['search_job'] : null );
	$search_artist_category = (!empty($_GET['search_artist_category']) ? $_GET['search_artist_category'] : null );
	$search_interest = (!empty($_GET['search_interest']) ? $_GET['search_interest'] : null );
	$search_gender = (!empty($_GET['search_gender']) ? $_GET['search_gender'] : null );
	$search_age = (!empty($_GET['search_age']) ? $_GET['search_age'] : null );
	$sort_by = (!empty($_GET['sort_by']) ? $_GET['sort_by'] : null );

	global $wpdb;

	$jobs_table_name = $wpdb->prefix . "gateway_bollywood_jobs";

	$current_user = wp_get_current_user();

	if(!empty($search_job)){
		$search_job_where = " AND title LIKE '%".$search_job."%' OR description LIKE '%".$search_job."%'";
		$search_job_pagination = "&search_job=".urlencode($search_job);
	} else {
		$search_job_where = "";
		$search_job_pagination = "";
	}

	if(!empty($search_artist_category) && count($search_artist_category) > 0)
	{
		$imploded_categories = implode(",", $search_artist_category);
		$search_artist_category_where = " AND job_category IN ($imploded_categories)";

		$search_artist_category_pagination = "";
		foreach ($search_artist_category as $search_cate)
		{
			$search_artist_category_pagination .= '&';
			$search_artist_category_pagination .= urlencode("search_artist_category[]")."=".$search_cate;
		}

	} else {
		$search_artist_category_pagination = "";
		$search_artist_category_where = "";
	}

	if(!empty($search_interest) && count($search_interest) > 0)
	{
		$imploded_types = implode(",", $search_interest);
		$search_type_where = " AND job_type IN ($imploded_types)";

		$search_type_pagination = "";
		foreach ($search_interest as $search_inte)
		{
			$search_type_pagination .= '&';
			$search_type_pagination .= urlencode("search_interest[]")."=".$search_inte;
		}

	} else {
		$search_type_pagination = "";
		$search_type_where = "";
	}

	if(!empty($search_gender)){
		$search_gender_where = " AND gender = '".$search_gender."'";
		$search_gender_pagination = "&search_gender=".urlencode($search_gender);
	} else {
		$search_gender_where = "";
		$search_gender_pagination = "";
	}

	if(!empty($search_age)){
		$search_age_where = " AND `age_from` BETWEEN 1 AND $search_age OR `age_to` BETWEEN 1 AND $search_age";
		$search_age_pagination = "&search_age=".urlencode($search_age);
	} else {
		$search_age_where = "";
		$search_age_pagination = "";
	}

	if(!empty($sort_by)){
		if($sort_by == "expiring-soon"){
			$sort_by_order = " ORDER BY case when `expiry_date` is null then 1 else 0 end, `expiry_date` ASC";
		}	else {
			$sort_by_order = " order by id DESC";
		}
		$sort_by_pagination = "&sort_by=".urlencode($sort_by);
	} else {
		$sort_by_order = " order by id DESC";
		$sort_by_pagination = "";
	}

	$total_jobs = $wpdb->get_var("SELECT count(*) from $jobs_table_name where `active` = 1 $search_job_where $search_artist_category_where $search_type_where $search_gender_where $search_age_where");

	$row_limit = 10;

	$currpage = (!empty($_GET['pg']) ? (int)$_GET['pg'] : 1 );
	
	$curr_limit = ($currpage-1) * $row_limit;
	$offset = $row_limit;

	//var_dump($curr_limit);
	//var_dump($offset);
	//var_dump($total_jobs);

	if(($curr_limit+$offset) >=  $total_jobs) {
		$nextpage = '#';
	} else {
		$nextpage = site_url().'/trending-jobs/?pg='.($currpage+1).$search_job_pagination.$search_artist_category_pagination.$search_gender_pagination.$search_age_pagination.$search_type_pagination.$sort_by_pagination;				
	}

	if($currpage >= 2) {
		$prevpage = site_url().'/trending-jobs/?pg='.($currpage-1).$search_job_pagination.$search_artist_category_pagination.$search_gender_pagination.$search_age_pagination.$search_type_pagination.$sort_by_pagination;
	} else {
		$prevpage = '#';
	}

	$jobs_data = $wpdb->get_results("SELECT * from $jobs_table_name where `active` = 1 $search_job_where $search_artist_category_where $search_type_where $search_gender_where $search_age_where $sort_by_order limit $curr_limit,$offset");

	//echo $wpdb->last_query;
	?>

	<div class="row">
		<div class="col-md-3">
			<div class="search-bar">
				<h4>Search</h4>
				<form id="search-form" name="search-form" class="search-form" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="get">
	                <div class="filter job-filter">
	                    <label for="search_job">Search Job</label>
	                    <input type="text" placeholder="Type name or description of Job" name="search_job" id="search_job" value="<?php echo ( !empty($search_job) ? $search_job : null ) ?>">
	                </div>
	                <div class="filter gender-filter">
	                    <label for="search_gender">Gender</label> 
	                    <input type="radio" name="search_gender" id="search_gender_male" value="1" <?php if($search_gender == "1") { echo 'checked="checked"' ; } ?>> Male
	                    <input type="radio" name="search_gender" id="search_gender_female" value="2" <?php if($search_gender == "2") { echo 'checked="checked"' ; } ?>> Female
	                </div>
	                <div class="filter range-filter">
	                	<label for="search_age">Age</label> 
	                	<input name="search_age" id="search_age" class="range-slider__range" type="range" value="<?php if(!empty($search_age)){ echo $search_age; } else { echo '0'; } ?>" min="0" max="100" onchange="showMyValue(this.value);">
  						0 - <span id="search_age_value" class="range-slider__value"><?php if(!empty($search_age)){ echo $search_age; } else { echo '100'; } ?></span>
	                </div>
	                <?php
	                if(empty($_GET['cate'])){
	                	$all_categories = get_posts(array('post_type'=>'category','numberposts' => 50, 'orderby' => 'menu_order', 'order' => 'ASC'));
		                //echo '<pre>';print_r($all_categories);echo '</pre>';
		                if(count($all_categories) > 0){
		                    ?>
		                    <div class="filter category-filter">
		                    <label for="search_artist_category">Skill Category</label>
		                    <?php
		                    $search_artist_category_counter = 1;
		                    foreach ($all_categories as $cate_key => $category) {
		                        if(!empty($_GET['search_artist_category']) && in_array($category->ID, $_GET['search_artist_category']))
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

		                        echo '<div class="check-box"><input type="checkbox" '.$selectedStr.' name="search_artist_category[]" id="search_artist_category" value="'.$category->ID.'"> '.$category->post_title.'</div>';
		                        $search_artist_category_counter++;
		                    }
		                    ?></div><?php
		                }
	                }
	                ?>
	                <?php
                	$all_interests = get_posts(array('post_type'=>'interest','numberposts' => 50));
	                //echo '<pre>';print_r($all_categories);echo '</pre>';
	                if(count($all_interests) > 0){
	                    ?>
	                    <div class="filter category-filter">
	                    <label for="search_interest">Job Category</label>
	                    <?php
	                    $search_interest_counter = 1;
	                    foreach ($all_interests as $cate_key => $interest) {
	                        if(!empty($_GET['search_interest']) && in_array($interest->ID, $_GET['search_interest']))
	                        {
	                            $selectedStr = 'checked="checked"';
	                        }
	                        else {
	                            $selectedStr = '';
	                        }

	                        echo '<div class="check-box"><input type="checkbox" '.$selectedStr.' name="search_interest[]" id="search_interest" value="'.$interest->ID.'"> '.$interest->post_title.'</div>';
	                        $search_interest_counter++;
	                    }
	                    ?></div><?php
	                }
	                ?>
	                <div class="filter-submit">
	                	<input type="hidden" name="sort_by" value="<?php echo $sort_by; ?>" />
	                	<input type="submit" name="submit" value="Search"/>
	                	<input type="button" class="btn" name="reset" value="Reset" onclick="window.location.href='<?php echo site_url().'/trending-jobs' ?>';" />
	                </div>
	            </form>
	            <script type="text/javascript">
	            	function showMyValue(myVal){
					    document.getElementById("search_age_value").innerHTML = myVal;
					}
	            </script>
			</div>
		</div>
		<div class="col-md-9">
			<!-- Popular-Cities/Towns -->
	        <div class="section-header text-center">
	            <h2>Jobs</h2>
	        </div>
	        <form id="sort-form" name="search-form" class="search-form" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="get">
                <div class="filter job-filter">
                    <label for="search_job">Sort by</label>
                    <select name="sort_by">
                    	<option value="latest" <?php if(!empty($sort_by) && $sort_by == "latest") { echo 'selected="selected"'; } ?>>Latest</option>
                    	<option value="expiring-soon" <?php if(!empty($sort_by) && $sort_by == "expiring-soon") { echo 'selected="selected"'; } ?>>Expiring soon</option>
                    </select>
                </div>
                <div class="filter-submit">
                	<input type="hidden" name="search_job" value="<?php echo $search_job; ?>" />
                	<input type="submit" name="submit" value="Sort"/>
                </div>
            </form>
	        <div class="row jobs-listing">
	        <?php
	        if(count($jobs_data) > 0){
	        	$job_counter = 1;
	        	foreach ($jobs_data as $jobkey => $job) {
	        	//if($job_counter%3 == 1){ echo '<div class="row">'; }
	        	?>
	        	<div class="col-sm-12 col-md-12">
	                <div class="job-main-info row">
	                    <div class="job-photo col-sm-2">
		                    <?php
		                    $job_image = $job->job_image;
		                    if(!empty($job_image)) {
		                    	?>
		                    	<img class="job-image" width="150" height="100" src="<?php echo site_url().'/wp-content/uploads/jobimages/'.$job->user_id.'/'.$job_image ?>"/>
		                    	<?php
		                    } else { ?>
		                    	<img class="job-image" width="150" height="100" src="<?php echo site_url().'/wp-content/uploads/jobimages/no-job-image.png' ?>"/>
		                    <?php
		                	}
		                    ?>
	                    </div>
	                    <div class="job-informations col-sm-7">
	                    	<div id="artist_job_title" class="col-sm-12">
	                    		<h2 class="jobtitle">
	                    			<a href="/view/job/3417" target="_blank">
	                    				<span class="title"><?php echo ucwords($job->title); ?></span>
	                    			</a>
	                    		</h2>
					        </div>
					        <div class="col-sm-12 cartline">
					        	<?php
					        	if(strlen($job->description) > 50){
					        		?>
					        		<div class="content job-description">
						        		<p><?php echo substr($job->description, 0, 50); ?></p>
						        	</div>
						        	<div class="show-more">
						            	<a href="<?php echo add_query_arg( 'jobId', $job->id, site_url().'/trending-jobs/' ); ?>" class="content-action"">Read more</a>
						          	</div>
					          		<?php
					        	} else {
					        		?>
					        		<div class="content job-description">
						        		<p><?php echo $job->description; ?></p>
						        	</div>
					        		<?php
					        	}
					        	?>
					        </div>
					        <?php if(!empty($job->job_start_date) && !empty($job->job_end_date) && $job->job_start_date != "0000-00-00" && $job->job_end_date != "0000-00-00"): ?>
					        <div class="col-sm-12 cartline">
					          <span>Shoot Dates : </span>
					          <span class="shoot-date start-date"><?php echo $job->job_start_date; ?></span>
					          <span> To: </span>
					          <span class="shoot-date end-date"><?php echo $job->job_end_date; ?></span>
					        </div>
					    	<?php endif; ?>
	                    </div>
	                    <div class="job-criteria col-sm-3">
	                    	<?php if(!empty($job->job_type)): ?>
	                    	<div class="col-sm-12 cartline job-type">
	                    		<i class="fa fa-briefcase"></i><span class="type"><?php echo get_the_title($job->job_type); ?></span>
	                    	</div>
	                    	<?php endif; ?>
	                    	<div class="col-sm-12 cartline job-gender-category">
					          <i class="fa fa-venus-mars"></i>
					          <span class="gender"><?php if(empty($job->gender)) { echo "Male/Female"; } elseif($job->gender == "1") { echo "Male"; } elseif($job->gender == "2"){ echo 'Female'; } ?></span>
					          <?php if(!empty($job->job_category)): ?>
					          <span class="category"><?php echo ' - '.get_the_title($job->job_category); ?></span>
					      	  <?php endif; ?>
					        </div>
					        <?php if(!empty($job->age_from) || !empty($job->age_from)): ?>
					        	<?php if(!empty($job->age_from) && !empty($job->age_from)): ?>
							        <div class="col-sm-12 cartline job-age">
							          <i class="fa fa-user"></i>
							          <span class="age"><?php echo $job->age_from; ?> to <?php echo $job->age_to; ?> Years</span>
							        </div>
						    	<?php else: ?>
						    		<?php if(!empty($job->age_from)): ?>
							    		<div class="col-sm-12 cartline job-age">
								          <i class="fa fa-user"></i>
								          <span class="age"><?php echo $job->age_from; ?> Years</span>
								        </div>
							    	<?php else: ?>
							    		<div class="col-sm-12 cartline job-age">
								          <i class="fa fa-user"></i>
								          <span class="age"><?php echo $job->age_to; ?> Years</span>
								        </div>
							    	<?php endif; ?>
						    	<?php endif; ?>
					        <?php endif; ?>
	                        <?php
                            $usersData = get_userdata($job->user_id);
                            //echo $usersData->display_name;
                            ?>
	                    </div>
	                </div>
	                <div class="row stampFooter">
	                	<div id="tour_job_date" class="col-sm-6 col-xs-12 text-left">
	                		<?php if(!empty($job->expiry_date) && $job->expiry_date != "0000-00-00"): ?>
	                			<label>Last date to apply : <span class="lastDate"><?php echo $job->expiry_date; ?></span></label>
	                		<?php else: ?>
	                			<label>No Expiry Date</label>
	                		<?php endif; ?>
					    </div>
					    <?php $gateway_options = get_option( 'gateway_bollywood_options' ); ?>
					    <?php if (in_array( 'artist', (array) $current_user->roles ) ) : ?>
							<div id="tour_job_btn_action_join_now" class="col-sm-6 col-xs-12 text-right ng-scope">
						    	<a href="<?php echo add_query_arg( 'jobId', $job->id, site_url().'/trending-jobs/' ); ?>"><button class="btn butn butnOrange">View more to apply</button></a>
						    </div>
						<?php else: ?>
							<div id="tour_job_btn_action_join_now" class="col-sm-6 col-xs-12 text-right ng-scope">
						    	<a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_login_page']); ?>"><button class="btn butn butnOrange">Login as Talent to apply</button></a>
						    </div>
						<?php endif; ?>
					</div>
	            </div>
	            <?php
	        	//if($job_counter%3 == 0 || $job_counter == count($jobs_data)){ echo '</div>'; }
	        	$job_counter++;
	        	}

	        	?>
				</div>
				<nav aria-label="Page navigation example">
				  <?php if($prevpage != "#"): ?>
				    	<a class="page-link prev-link" href="<?php echo $prevpage; ?>">Previous</a>
				    <?php endif; ?>
				    <?php if($nextpage != "#"): ?>
				    	<a class="page-link next-link pull-right" href="<?php echo $nextpage; ?>">Next</a>
				  	<?php endif; ?>
				</nav>
				<?php
	    	} else {
	    		echo '<div class="no-results-found">No Jobs Found.</div>';
	    	}
	        ?> 
		</div>
	</div>
<?php
}
?>

</div>
</section>
<!-- /Popular Cities/Towns -->


<?php get_sidebar(); ?>
<?php get_footer(); ?>