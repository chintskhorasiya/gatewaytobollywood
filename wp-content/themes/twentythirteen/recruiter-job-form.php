<?php /* Template Name: jobsform */ ?>

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

		$job_id = $_GET['id'];
		$action = $_GET['action'];

		global $wpdb;

		$jobs_table_name = $wpdb->prefix . "gateway_bollywood_jobs";

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

		if(!empty($job_id))
		{
			$job_data = $wpdb->get_row("SELECT * from $jobs_table_name where `id`='".$job_id."'");

			$title = $job_data->title;
			$description = $job_data->description;
			$expiry_date = $job_data->expiry_date;
			$job_start_date = $job_data->job_start_date;
			$job_end_date = $job_data->job_end_date;
			$gender = $job_data->gender;
			$age_from = $job_data->age_from;
			$age_to = $job_data->age_to;
			$job_category = $job_data->job_category;
			$job_type = $job_data->job_type;
			$job_image = $job_data->job_image;

			if(empty($action)) {
				$action = "edit";
				$page_title = "Edit Job";
			} else {
				$page_title = "Delete Job";
				$deleted = $wpdb->query( "DELETE FROM $jobs_table_name where `id`='".$job_id."'");

				if($deleted){
					?>
					<div class="goto-button">Job Deleted<br><a href="<?php echo site_url() ?>/recruiter-jobs">Go to listing</a></div>
					<?php
				}

			}
		}
		else
		{
			$page_title = "Add Job";
			$action = "";
		}

		if ( isset($_POST['submit'] ) ) {

			$title = $_POST['title'];
			$description = $_POST['description'];
			$expiry_date = (!empty($_POST['expiry_date']) ? $_POST['expiry_date'] : null );
			$job_start_date = (!empty($_POST['job_start_date']) ? $_POST['job_start_date'] : null );
			$job_end_date = (!empty($_POST['job_end_date']) ? $_POST['job_end_date'] : null );
			$gender = (int)(!empty($_POST['gender']) ? $_POST['gender'] : 0 );
			$age_from = $_POST['age_from'];
			$age_to = $_POST['age_to'];
			$job_category = $_POST['job_category'];
			$job_type = $_POST['job_type'];
			$job_image = $_FILES['job_image'];


			global $reg_errors;
			$reg_errors = new WP_Error;

			if(empty($title)) {
				$reg_errors->add('title_required', 'Job title is required.' );
			}

			if(empty($description)) {
				$reg_errors->add('description_required', 'Job description is required.' );
			}

			// user image validation
    
		    $photo_error = array();
		    $uploaddir = ABSPATH . 'wp-content/uploads/jobimages/';

		    $target = $uploaddir.$user_ID.'/';
		    wp_mkdir_p( $target );

		    // Allowed mimes    
		    $allowed_ext = "jpg, gif, png";  

		    // Default is 50kb 
		    $max_size = (1024*1024)*2; // 2MB  

		    // height in pixels, default is 175px 
		    $max_height = '800';  

		    // width in pixels, default is 450px 
		    $max_width = '850';

		    //var_dump($job_image);
		    //var_dump($max_size);

		    // Check mime types are allowed  
		    $extension = pathinfo($job_image['name']);  
		    $extension = $extension['extension'];  
		    $allowed_paths = explode(", ", $allowed_ext);  
		    for($i = 0; $i < count($allowed_paths); $i++) {  
		        if ($allowed_paths[$i] == $extension) {
		            $ok = "1";  
		        }
		    }

		    $final_image_name = "";
		    if ($ok == "1") {  
		        if($job_image['size'] > $max_size)  
		        {  
		            $reg_errors->add( 'user-image-size', 'Image size is too big!' );  
		            //$photo_error = true;
		            array_push($photo_error, 1);
		        }

		        // Check Height & Width  
		        if ($max_width && $max_height) {  
		            list($width, $height, $type, $w) = getimagesize($job_image['tmp_name']);  
		            if($width > $max_width || $height > $max_height)  
		            {  
		                $reg_errors->add( 'user-image-height-width', 'Image is too big! max allowable width is&nbsp;' . $max_width .'px and max allowable height is&nbsp;' . $max_height .'px' );  
		                array_push($photo_error, 2);
		            } 
		        } 

		        //var_dump($photo_error);

		        if(count($photo_error) <= 0) {
		            $image_name = time().'.'.$extension;
		            //ar_dump($image_name);exit;
		            // Rename file and move to folder
		            $newname=$target.$image_name;
		            //var_dump($newname);exit;  
		            if(is_uploaded_file($job_image['tmp_name']))  
		            { 
		                move_uploaded_file($job_image['tmp_name'], $newname);
		                //update_user_meta( $user_ID, 'job_image', $image_name); 
		                //echo 'Photo uploaded!<br>'; 
		                $final_image_name = $image_name;
		            }  
		        }
		    }  /*else {
		        if(!empty($_FILES['job_image']['name'])){
		            
		        } else {
		            $reg_errors->add( 'user-image-type', 'Image should be required and image type only (jpg, gif, png)!' );  
		            array_push($photo_error, 3);
		        }
		    }*/

		    /////////////

			if ( 1 > count( $reg_errors->get_error_messages() ) ) {
		        
		        if($_POST['action'] == "edit"){

		        	if(!empty($final_image_name)){
		        		$wpdb->update(
		                    $jobs_table_name, //table
		                    array('title'=>$title, 'description'=>$description, 'job_image'=>$final_image_name, 'user_id'=>$current_user->id , 'age_from'=>$age_from, 'age_to'=>$age_to, 'job_category'=>$job_category, 'job_type'=>$job_type, 'gender'=>$gender, 'job_start_date'=>$job_start_date, 'job_end_date'=>$job_end_date, 'expiry_date'=>$expiry_date), // data
		                    array('id' => $job_id), // where data
		                    array('%s', '%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%s', '%s', '%s'), // data format
		                    array('%d') // where data format
		                );
		        	} else {
		        		$wpdb->update(
		                    $jobs_table_name, //table
		                    array('title'=>$title, 'description'=>$description, 'user_id'=>$current_user->id , 'age_from'=>$age_from, 'age_to'=>$age_to, 'job_category'=>$job_category, 'job_type'=>$job_type, 'gender'=>$gender, 'job_start_date'=>$job_start_date, 'job_end_date'=>$job_end_date, 'expiry_date'=>$expiry_date), // data
		                    array('id' => $job_id), // where data
		                    array('%s', '%s', '%d', '%d', '%d', '%d', '%d', '%d', '%s', '%s', '%s'), // data format
		                    array('%d') // where data format
		                );
		        	}

		        } else {

		        	$today_date = date('Y-m-d');

		        	$wpdb->insert(
	                    $jobs_table_name, //table
	                    array('title'=>$title, 'description'=>$description, 'user_id'=>$current_user->id, 'age_from'=>$age_from, 'age_to'=>$age_to, 'job_category'=>$job_category, 'job_type'=>$job_type, 'gender'=>$gender, 'job_start_date'=>$job_start_date, 'job_end_date'=>$job_end_date, 'expiry_date'=>$expiry_date, 'date_added'=>$today_date), //data
	                    array('%s', '%s', '%d', '%d', '%d', '%d', '%s', '%s', '%s', '%s') //data format         
	                );

	                //var_dump($wpdb->last_query);exit;
		        }

		        //$options = get_option( 'gateway_bollywood_options' );
		        //$_SESSION['message'] = 'Profile Information Saved';
		        ?><div class="goto-button">Job Saved<br><a href="<?php echo site_url() ?>/recruiter-jobs">Go to listing</a></div><?php
		        //exit;
		    }

		}

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

				<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
				<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				
				<!-- Popular-Cities/Towns -->
		        <div class="section-header text-center">
		            <h2><?php echo $page_title; ?></h2>
		        </div>

		        <div class="row">
		        	<?php if($action != "delete"){ ?>
		        	<div class="job-form-main">
		        		<?php
		        		if ( is_wp_error( $reg_errors ) ) {
					     
					        foreach ( $reg_errors->get_error_messages() as $error ) {
					         
					            echo '<div class="error">';
					            echo '<strong>ERROR</strong>:';
					            echo $error . '<br/>';
					            echo '</div>';
					             
					        }
					     
					    }
		        		?>
			        	<form class="job-form" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="post" enctype="multipart/form-data">
		                <div>
		                    <label for="title">Job Title <strong>*</strong></label>
		                    <input type="text" name="title" value="<?php echo ( !empty($title) ? $title : null ) ?>">
		                </div>

		                <div>
		                    <label for="description">Job Description <strong>*</strong></label>
		                    <textarea name="description" id="description" maxlength="500"><?php echo ( !empty($description) ? $description : null ) ?></textarea>
		                </div>

		                <div>
		                    <label for="job_image">Job Image</label>
		                    <input type="file" name="job_image" id="job_image" accept="image/*" />
		                    <?php
		                    //$current_profile_photo = get_user_meta($user_id, 'user_meta_image', true);
		                    //var_dump($current_profile_photo);
		                    if(!empty($job_image)){
		                        
		                        $uploaddir = ABSPATH . 'wp-content/uploads/jobimages/';
		                        $target = $uploaddir.$job_data->user_id.'/';
		                        
		                        if(file_exists($target.$job_image))  
		                        { 
		                            ?>
		                            Current Profile Photo : <img src="<?php echo site_url().'/wp-content/uploads/jobimages/'.$job_data->user_id.'/'.$job_image ?>" alt="<?php echo $title; ?>" height="50" width="65" />
		                            <?php
		                        }
		                    }
		                    ?>
		                </div>

		                <div>
		                    <label for="expiry_date">Expiry Date</label>
		                    <input type="text" class="datepicker" name="expiry_date" id="expiry_date" value="<?php echo ( !empty($expiry_date) ? $expiry_date : null ) ?>" />
		                </div>

		                <div>
		                    <label for="expiry_date">Job Duration</label>
		                    <input type="text" class="datepicker" name="job_start_date" id="job_start_date" value="<?php echo ( !empty($job_start_date) ? $job_start_date : null ) ?>" />
		                    -to-
		                    <input type="text" class="datepicker" name="job_end_date" id="job_end_date" value="<?php echo ( !empty($job_end_date) ? $job_end_date : null ) ?>" />
		                </div>

		                <div>
		                    <label for="gender">Gender Specific</label>
		                    <input type="radio" value="0" class="" name="gender" id="gender_all"  /> All
		                    <input type="radio" value="1" class="" name="gender" id="gender_male" <?php if($gender == "1") { echo 'checked="checked"'; } ?> /> Male
		                    <input type="radio" value="2" class="" name="gender" id="gender_female" <?php if($gender == "2") { echo 'checked="checked"'; } ?> /> Female
		                </div>

		                <div>
		                    <label for="expiry_date">Required Age</label>
		                    <input type="number" class="" min="0" max="100" name="age_from" id="age_from" value="<?php echo ( !empty($age_from) ? $age_from : null ) ?>" />
		                    -to-
		                    <input type="number" class="" min="0" max="100" name="age_to" id="age_to" value="<?php echo ( !empty($age_to) ? $age_to : null ) ?>" />
		                </div>

		                <?php
		                $categories = get_user_meta($current_user->id, 'artist_category', true);
		                if(count($categories) > 0){
		                	?>
		                	<div>
			                    <label for="gender">Job Category</label>
			                    <select name="job_category" id="job_category">
			                    	<option value="">Select Job Category</option>
			                    	<?php
			                    	foreach ($categories as $cate => $category) {
			                    	?>
			                    	<option <?php if($job_category == $category){ echo 'selected="selected"'; } ?> value="<?php echo $category; ?>"><?php echo get_the_title($category); ?></option>
			                    	<?php
			                    	}
			                    	?>
			                    </select>
			                </div>
			                <?php
		                }
		                ?>

		                <?php
		                $interests = get_user_meta($current_user->id, 'artist_interest', true);
		                if(count($interests) > 0){
		                	?>
		                	<div>
			                    <label for="gender">Job Type</label>
			                    <select name="job_type" id="job_type">
			                    	<option value="">Select Job Type</option>
			                    	<?php
			                    	foreach ($interests as $inte => $interest) {
			                    	?>
			                    	<option <?php if($job_type == $interest){ echo 'selected="selected"'; } ?> value="<?php echo $interest; ?>"><?php echo get_the_title($interest); ?></option>
			                    	<?php
			                    	}
			                    	?>
			                    </select>
			                </div>
			                <?php
		                }
		                ?>
		                 
		                <div>
		                	<?php if(!empty($action)){
		                		echo '<input type="hidden" name="action" id="action" value="'.$action.'" />';
		                	} ?>
		                	<input type="submit" name="submit" value="Save"/>
		                </div>

					</div>

					<script>
				 	jQuery( function() {
						jQuery( ".datepicker" ).datepicker({"dateFormat":"yy-mm-dd", minDate: 0});
					} );
					</script>

					<?php } ?>
		        </div>
		        
			</div>
		</div>

		<?php else: ?>
		<?php echo '<h4>You are not authorized to view this page. Please <a href="'.site_url().'/login'.'">login</a> as correct user</h4>'; ?>
		<?php endif; ?>

	<?php else: ?>
	<?php echo '<h4>Please <a href="'.site_url().'/login'.'">login</a> as recruiter to view this page</h4>'; ?>
	<?php endif; ?>

	</div>

</section>
<!-- /Popular Cities/Towns -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>