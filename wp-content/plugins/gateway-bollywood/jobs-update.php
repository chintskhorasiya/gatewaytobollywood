<?php

function gateway_jobs_update() {
    global $wpdb;
    $table_name = $wpdb->prefix . "gateway_bollywood_jobs";
    $id = $_GET["id"];
    $active = (int)( $_POST["active"] ? $_POST["active"] : 0 );
    $featured = (int)( $_POST["featured"] ? $_POST["featured"] : 0 );
//update
    if (isset($_POST['update'])) {
        
		$wpdb->update(
			$table_name, //table
			array('active' => $active, 'featured' => $featured), //data
			array('ID' => $id), //where
			array('%d', '%d'), //data format
			array('%d') //where format
		);
    }
//delete
    else if (isset($_POST['delete'])) {
        $wpdb->query($wpdb->prepare("DELETE FROM $table_name WHERE id = %s", $id));
    } else {//selecting value to update	
        $fields = $wpdb->get_results($wpdb->prepare("SELECT * from $table_name where id=%s", $id));
        foreach ($fields as $s) {
        	//var_dump($s);
            $title = $s->title;
			$description = $s->description;
			$job_image = $s->job_image;
			$job_image = $s->job_image;
			$user_id = $s->user_id;
			$gender = $s->gender;
			$age_from = $s->age_from;
			$age_to = $s->age_to;
			$job_category = $s->job_category;
			$job_type = $s->job_type;
			$job_start_date = $s->job_start_date;
			$job_end_date = $s->job_end_date;
			$expiry_date = $s->expiry_date;
			$date_added = $s->date_added;

			$active = $s->active;
			$featured = $s->featured;

        }
    }
    ?>
    <link type="text/css" href="<?php echo WP_PLUGIN_URL; ?>/gateway-bollywood/style-admin.css" rel="stylesheet" />
    <div class="wrap">
        <h2>Edit Job</h2>
		
		<?php if ($_POST['delete'] && !isset($error)) { ?>
            <div class="updated"><p>Job deleted</p></div>
            <a href="<?php echo admin_url('admin.php?page=gateway_jobs_list') ?>">&laquo; Back to jobs list</a>

        <?php } else if ($_POST['update'] && !isset($error)) { ?>
            <div class="updated"><p>Job updated</p></div>
            <a href="<?php echo admin_url('admin.php?page=gateway_jobs_list') ?>">&laquo; Back to jobs list</a>

        <?php } else { ?>
		
			<?php if (isset($error)): ?><div class="error"><p><?php echo $error; ?></p></div><?php endif; ?>
			
            <form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
                <table class='wp-list-table widefat fixed'>
	                <!--<tr>
	                    <th class="ss-th-width">ID</th>
	                    <td><input type="text" name="id" value="<?php echo $id; ?>" class="required ss-field-width" /></td>
	                </tr>-->
	                <tr>
	                    <th class="ss-th-width">Title</th>
	                    <td><?php echo $title; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Description</th>
	                    <td><?php echo $description; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Image</th>
	                    <td>
	                    <?php
	                    	if(empty($job_image)){
	                    		?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/no-job-image.png'; ?>" height="70" width="100" alt="No-Image" title="No-Image" /><?php
	                    	} else {
	                    		?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/'.$user_id.'/'.$job_image ?>" height="70" width="100" alt="<?php echo $title; ?>" title="<?php echo $title; ?>" /><?php
	                    	}
	                    ?>
	                    </td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Recruiter</th>
	                    <td><?php $usersData = get_userdata($user_id); ?><?php echo $usersData->display_name; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Gender</th>
	                    <td><?php if(!empty($gender)){ if($gender == "1") { echo "Male"; } if($gender == "2") { echo "Female"; } } ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Age limit</th>
	                    <td><?php echo $age_from; ?> - <?php echo $age_to; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Job Category</th>
	                    <td><?php if(!empty($job_category)) { echo get_the_title($job_category); } ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Job Type</th>
	                    <td><?php if(!empty($job_type)) { echo get_the_title($job_type); } ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Duration</th>
	                    <td><?php echo $job_start_date; ?> - <?php echo $job_end_date; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Expires On</th>
	                    <td><?php echo $expiry_date; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Job Added On</th>
	                    <td><?php echo $date_added; ?></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Active</th>
	                    <td><input type="radio" name="active" <?php if($active=="1") { echo 'checked="checked"'; } ?> value="1" class="required ss-field-width" />Yes <input type="radio" <?php if($active=="0") { echo 'checked="checked"'; } ?> name="active" value="0" class="required ss-field-width" />No</td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Featured</th>
	                    <td><input type="radio" name="featured" <?php if($featured=="1") { echo 'checked="checked"'; } ?> value="1" class="required ss-field-width" />Yes <input type="radio" <?php if($featured=="0") { echo 'checked="checked"'; } ?> name="featured" value="0" class="required ss-field-width" />No</td>
	                </tr>
	            </table>
                <input type='submit' name="update" value='Save' class='button'> &nbsp;&nbsp;
                <input type='submit' name="delete" value='Delete' class='button' onclick="return confirm('Are you sure want to delete this field?')">
            </form>
        <?php } ?>

    </div>
    <?php
}
?>