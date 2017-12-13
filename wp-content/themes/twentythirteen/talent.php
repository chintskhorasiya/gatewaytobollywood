<?php /* Template Name: talents */ ?>

<?php include('header.php'); ?><section id="banner">		 <img src="<?php echo get_template_directory_uri() ?>/images/bannermain-inner.jpg" alt="image"></section>
<section id="popular_cities" class="section-padding">
<div class="container">
<?php
global $user_ID;

//var_dump($_GET);
//var_dump($_POST);
//var_dump(get_query_var('talents'));

if(!empty($_GET['userId']) && is_numeric($_GET['userId'])){

$artistId = $_GET['userId'];
$artistFirstData = get_user_by('id', $artistId);
?>
	<div class="row">
		<div class="col-md-12">
			<div class="profile-head">
	        	<?php $current_profile_photo = get_user_meta($artistId, 'user_meta_image', true); ?>
	        	<div class="col-md-2"> 
	        		<div class="profile-photo">
	        			<img  src="<?php echo site_url().'/wp-content/uploads/profilephotos/'.$artistId.'/'.$current_profile_photo ?>"/>
	        		</div>
	        	</div>
	        	<div class="col-md-10 right-profile">
	        		<h2><?php echo $artistFirstData->display_name ?></h2>
	        		<div class="info-line-2">
	            		<?php echo (get_user_meta($artistId, 'age', true) ? get_user_meta($artistId, 'age', true).',' : ''  ) ?>
                		<?php echo (get_user_meta($artistId, 'gender', true) == "1" ? 'Male' : 'Female') ?>
	        		</div>
	        		<div class="info-line-3">
	        			<?php
                    	$artist_categories = get_user_meta($artistId, 'artist_category', true);
                    	if(!empty($artist_categories) && count($artist_categories) > 0){
                    		$artist_categories_counter = 1;
                    		foreach ($artist_categories as $artcatkey => $artist_cat) {
                        		echo get_the_title($artist_cat);
                        		if($artist_categories_counter < count($artist_categories)) echo ',';
                        		$artist_categories_counter++;
                        	}
                    	}
                    	?>
	        		</div>
	        		<?php $profile_location = get_user_meta($artistId, 'location', true); ?>
	        		<?php if(!empty($profile_location)): ?>
			        <div class="info-line-4">
			             <img src="<?php bloginfo( 'template_url' ); ?>/images/map-icon.png" style="width: 10px;"/>  <?php echo get_user_meta($artistId, 'location', true); ?>
			        </div>
			        <?php endif; ?>
			        <?php if($artistId == $user_ID): ?>
			        	<a class="btn" href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_profile_page']); ?>">Edit Profile</a>
			        	<a class="btn" href="<?php echo site_url() ?>/artist-dashboard">Dashboard</a>
			        	<?php
			        	global $wpdb;
		                $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
		                $profile_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_ID."'");
		                if(!empty($profile_status_data)){
		                    $profile_status_data_status = (int)$profile_status_data->status;
		                    if($profile_status_data_status < 4){
                        	?>
			        			<a class="btn" href="<?php echo site_url() ?>/profile-payment">Upgrade to Prime</a><?php
			        		} else {
			        			?>
			        			<a class="btn" href="#">Prime Member</a>
			        			<?php
			        		}
			        	} else {
		        			?>
		        			<a class="btn" href="<?php echo site_url() ?>/profile-payment">Upgrade to Prime</a>
		        			<?php
		        		}
			        	?>

			        <?php endif; ?>
			    </div>
			</div>
			<div class="profile-bottom">
				<div class="container"><h2><?php echo get_user_meta($artistId, 'description', true); ?></h2></div>
				<div id="exTab2" class="">	
					<ul class="nav nav-tabs">
						<li class="active"><a  href="#1" data-toggle="tab">Profile</a></li>
				        <li><a href="#2" data-toggle="tab">Images(<?php echo '<span>'.do_shortcode('[upg-list layout="personal" user="'.$artistId.'" gtype="image" onlynumber="true" ]').'</span>'; ?>)</a></li>
				        <li><a href="#3" data-toggle="tab">Videos(<?php echo '<span>'.do_shortcode('[upg-list layout="personal" user="'.$artistId.'" gtype="video" onlynumber="true" ]').'</span>'; ?>)</a></li>
				        <?php if($artistId != $user_ID): ?>
				        <li><a href="#4" data-toggle="tab">Write Ups</a></li>
				       	<?php endif; ?>
				    </ul>
			    	<div class="tab-content ">
				    	<div class="tab-pane active" id="1">
				    		<div class="row">
				    			<div class="col-md-6">
				    				<div class="single-info">
				    					<div class="info-label">Work Experience</div>
				    					<div class="info-value"><?php echo wpautop(get_user_meta($artistId, 'work_description', true)); ?></div>
				    				</div>
				    				<div class="single-info">
				    					<div class="info-label">Category Set</div>
				    					<div class="info-value">
				    						<?php
				                        	$artist_categories = get_user_meta($artistId, 'artist_category', true);
				                        	if(count($artist_categories) > 0 && !empty($artist_categories)){
				                        		$artist_categories_counter = 1;
				                        		foreach ($artist_categories as $artcatkey => $artist_cat) {
					                        		echo '<div class="btn btn-default">'.get_the_title($artist_cat).'</div> ';
					                        		//if($artist_categories_counter < count($artist_categories)) echo ',';
					                        		$artist_categories_counter++;
					                        	}
				                        	}
				                        	?>
				    					</div>
				    				</div>
				    				<div class="single-info">
				    					<div class="info-label">Work Areas</div>
				    					<div class="info-value">
				    						<?php
				                        	$artist_interests = get_user_meta($artistId, 'artist_interest', true);
				                        	if(count($artist_interests) > 0 && !empty($artist_interests)){
				                        		$artist_interests_counter = 1;
				                        		foreach ($artist_interests as $artintkey => $artist_int) {
					                        		echo '<div class="btn btn-default">'.get_the_title($artist_int).'</div> ';
					                        		//if($artist_interests_counter < count($artist_interests)) echo ',';
					                        		$artist_interests_counter++;
					                        	}
				                        	}
				                        	?>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-6">
				    				<div class="single-info">
				    					<div class="info-label">Personal Profile</div>
				    					<div class="info-value">
				    						<?php
				    						$userMetaDatas = get_user_meta ($artistId);
				    						//echo '<pre>';print_r(get_user_meta ($artistId));echo '</pre>';
				    						foreach ($userMetaDatas as $umdkey => $umdvalue) {
				    							
				    						}
				    						
				    						global $wpdb;
									        $fields_table_name = $wpdb->prefix . "gateway_bollywood_fields";
									        $fields_rows = $wpdb->get_results("SELECT id,fid,label,type,options,required,tab,validation,active from $fields_table_name WHERE active = '1'");
									        //echo '<pre>';print_r($fields_rows);echo '</pre>';
									        foreach ($fields_rows as $fieldkey => $fields_row) {
									        	echo '<div class="info-sub-label">'.$fields_row->label.'</div>';
									        	$field_meta_value = get_user_meta($artistId, $fields_row->fid, true);
									        	if(!empty($field_meta_value) && !is_array($field_meta_value)) {
									        		if($fields_row->fid == "gender") {
									        			$field_value_str = ($field_meta_value == "1") ? "Male" : "Female";
									        		} else {
									        			$field_value_str = $field_meta_value;
									        		}
									        	} elseif (!empty($field_meta_value) && is_array($field_meta_value)) {
									        		$field_meta_options = json_decode($fields_row->options, true);
									        		$field_value_str = '';
									        		foreach ($field_meta_value as $fmvkey => $fmvvalue) {
									        			$field_value_str .= '<div class="btn btn-default">'.$field_meta_options[$fmvvalue-1].'</div> ';
									        		}
									        	} else {
									        		$field_value_str = "-";
									        	}
									        	echo '<div class="info-sub-value">'.$field_value_str.'</div>';
									        }
				    						
				    						?>
				    					</div>
				    				</div>
				    			</div>
				    		</div>
				    	</div>
				    	<div class="tab-pane" id="2">
				    		<?php echo do_shortcode('[upg-list perrow="3" perpage="30" orderby="date" page="off" popup="on" layout="personal" user="'.$artistId.'" gtype="image" ]'); ?>
				    		<?php if($artistId == $user_ID){ ?>
				    		<?php echo do_shortcode('[upg-post type="image"]'); ?>
				    		<?php } ?>
				    	</div>
				        <div class="tab-pane" id="3">
				        	<?php echo do_shortcode('[upg-list perrow="3" perpage="30" orderby="date" page="off" popup="on" layout="personal" user="'.$artistId.'" gtype="video" ]'); ?>
				    		<?php if($artistId == $user_ID){ ?>
				    		<?php echo do_shortcode('[upg-post type="youtube"]'); ?>
				    		<?php } ?>
				        </div>
				        <?php if($artistId != $user_ID): ?>
				        <div class="tab-pane" id="4">
				        	<?php //echo do_shortcode('[contact-form-7 id="105" title="Contact Me" my-filter user_id="'.$artistId.'"]'); ?>
				        	<?php echo do_shortcode('[contact-form-7 id="122" title="Contact form 1_copy"]'); ?>
							<div class="script">
				            <input type="hidden" name="user_email" id="user_email" value="<?php echo $artistFirstData->user_email; ?>" />
	    		            <script type="text/javascript">
	    			        jQuery(document).ready(function(){
	    			           var userEmail = jQuery('#user_email').val();
	    			           console.log(userEmail);
	    			           if(userEmail !== ""){
	    			            jQuery('input[name="email-author"]').val(userEmail);
	    			           }
	    			        });
	    			        </script>
				            </div>
				        </div>
				    	<?php endif; ?>
			    </div>
			</div>
			<hr></hr>
		</div>
	</div>
<?php
} else {
	$all_categories = get_posts(array('post_type'=>'category','numberposts' => 50));
	//echo '<pre>';print_r($all_categories);echo '</pre>';
	?>
	<?php
	//var_dump($_GET['search_artist_category']);
	//print_r($_POST);
	$search_talent = (!empty($_GET['search_talent']) ? $_GET['search_talent'] : null );
	$search_gender = (!empty($_GET['search_gender']) ? $_GET['search_gender'] : null );
	$search_premium = (!empty($_GET['search_premium']) ? $_GET['search_premium'] : null );
	$search_age = (!empty($_GET['search_age']) ? $_GET['search_age'] : null );
	$search_artist_category = (!empty($_GET['search_artist_category']) ? $_GET['search_artist_category'] : null );
	$search_location = (!empty($_GET['search_location']) ? $_GET['search_location'] : null );

	$args = array('role'=>'artist');
	$args['meta_query'] = array('relation'=>'AND');
	
	if(!empty($search_talent)){
		$args['search'] =  '*'.esc_attr( $search_talent ).'*';
		$args['search_columns'] = array('display_name');
		$search_talent_pagination = "&search_talent=".urlencode($search_talent);
	} else {
		$search_talent_pagination = "";
	}

	if(!empty($search_gender)){
		//array( 'meta_key' => 'age', 'meta_value' => '30', 'meta_compare' => '<' )
		$search_gender_arr = array(
			'key' => 'gender',
			'value' => $search_gender
		);
		array_push($args['meta_query'], $search_gender_arr);

		$search_gender_pagination = "&search_gender=".urlencode($search_gender);
	} else {
		$search_gender_pagination = "";		
	}

	if(!empty($search_age)){
		$search_age_arr = array(
			'key' => 'age',
			'value' => array(0, $search_age),
			'type'    => 'numeric',
			'compare' => 'BETWEEN'
		);
		array_push($args['meta_query'], $search_age_arr);

		$search_age_pagination = "&search_age=".urlencode($search_age);
	} else {
		$search_age_pagination = "";
	}

	if(!empty($search_artist_category) && count($search_artist_category) > 0)
	{
		$search_artist_category_pagination = "";
		foreach ($search_artist_category as $search_cate)
		{
			$search_artist_category_pagination .= '&';
			$search_artist_category_pagination .= urlencode("search_artist_category[]")."=".$search_cate;
		}

	} else {
		$search_artist_category_pagination = "";
	}

	if(!empty($search_location)){
		
		$search_location_arr = array(
			'key' => 'location',
			'value' => $search_location,
			'compare' => 'LIKE'
		);
		array_push($args['meta_query'], $search_location_arr);

		$search_location_pagination = "&search_location=".urlencode($search_location);
	} else {
		$search_location_pagination = "";
	}

	if(!empty($_GET['cate'])){
		$search_cate_pagination = "&cate=".urlencode($_GET['cate']);
	} else {
		$search_cate_pagination = "";
	}

	//echo '<pre>';print_r($args);echo '</pre>';

	$artists = get_users($args);
	//echo '<pre>';print_r($artists);echo '</pre>';

	$table_name = $wpdb->prefix . "users";
	$table2_name = $wpdb->prefix . "usermeta";
	
	$find_in_set_where = "";
	
	$row_limit = 9;
	$currpage = (!empty($_GET['pg']) ? (int)$_GET['pg'] : 1 );
	$curr_limit = ($currpage-1) * $row_limit;
	$offset = $row_limit;

	//var_dump($curr_limit);
	//var_dump($offset);
	
	if(!empty($search_artist_category) && is_array($search_artist_category) && count($search_artist_category)){
		$find_in_set_where = " AND ( meta_key='artist_category_str' AND (";
		$find_in_set_where_counter = 0;
		foreach ($search_artist_category as $art) {
			$find_in_set_where_counter++;
			$find_in_set_where .= " FIND_IN_SET ($art, `meta_value`)";
			if($find_in_set_where_counter == count($search_artist_category)){ } else { $find_in_set_where .= "  OR"; }
		}

		$find_in_set_where .= " ) )";

		$usersQuery = "SELECT `ID` FROM $table_name WHERE user_status='0' AND ID IN( SELECT user_id FROM `wp_usermeta` WHERE 1 $find_in_set_where ) ORDER BY display_name ASC";

		//var_dump($usersQuery);

	    $usersData = $wpdb->get_results("$usersQuery");

	    //echo '<pre>';
	    //print_r($usersData);
	    //echo '</pre>';

	    $artistsArr = array();
	    foreach ($artists as $sartkey => $sartvalue) {
	    	array_push($artistsArr, (int)$sartvalue->ID);
	    }

	    $artistsCatArr = array();
	    foreach ($usersData as $susdkey => $susdvalue) {
	    	array_push($artistsCatArr, (int)$susdvalue->ID);
	    }

	    //var_dump($artistsArr);
	    //var_dump($artistsCatArr);
	    $finalUsersArr = array_intersect($artistsArr, $artistsCatArr);

	    $finalusersQuery = "SELECT *,`ID` as `id` FROM $table_name WHERE user_status='0' AND ID IN( ".implode(',', $finalUsersArr)." ) ORDER BY display_name ASC limit $curr_limit,$offset";

	    $total_records = $wpdb->get_var("SELECT count(*) FROM $table_name WHERE user_status='0' AND ID IN( ".implode(',', $finalUsersArr)." )");

		//var_dump($finalusersQuery);

	    $finalusersData = $wpdb->get_results("$finalusersQuery");

	    //echo '<pre>';
	    //print_r($finalusersData);
	    //echo '</pre>';
		
		$artists = $finalusersData;
	} elseif(!empty($_GET['cate'])){ //&& is_numeric($_GET['cate'])

		$getcate = $_GET['cate'];
		$find_in_set_where = " AND ( meta_key='artist_category_str' AND (";
		$find_in_set_where .= " FIND_IN_SET ('$getcate', `meta_value`)";
		$find_in_set_where .= " ) )";

		$usersQuery = "SELECT `ID` FROM $table_name WHERE user_status='0' AND ID IN( SELECT user_id FROM `wp_usermeta` WHERE 1 $find_in_set_where ) ORDER BY display_name ASC";

		//var_dump($usersQuery);

	    $usersData = $wpdb->get_results("$usersQuery");

	    //echo '<pre>';
	    //print_r($usersData);
	    //echo '</pre>';

	    $artistsArr = array();
	    foreach ($artists as $sartkey => $sartvalue) {
	    	array_push($artistsArr, (int)$sartvalue->ID);
	    }

	    $artistsCatArr = array();
	    foreach ($usersData as $susdkey => $susdvalue) {
	    	array_push($artistsCatArr, (int)$susdvalue->ID);
	    }

	    //var_dump($artistsArr);
	    //var_dump($artistsCatArr);
	    $finalUsersArr = array_intersect($artistsArr, $artistsCatArr);

	    $finalusersQuery = "SELECT *,`ID` as `id` FROM $table_name WHERE user_status='0' AND ID IN( ".implode(',', $finalUsersArr)." ) ORDER BY display_name ASC limit $curr_limit,$offset";

	    $total_records = $wpdb->get_var("SELECT count(*) FROM $table_name WHERE user_status='0' AND ID IN( ".implode(',', $finalUsersArr)." )");

		//var_dump($finalusersQuery);

	    $finalusersData = $wpdb->get_results("$finalusersQuery");

	    //echo '<pre>';
	    //print_r($finalusersData);
	    //echo '</pre>';
		
		$artists = $finalusersData;

	} else {

		$artistsArr = array();
	    foreach ($artists as $sartkey => $sartvalue) {
	    	array_push($artistsArr, (int)$sartvalue->ID);
	    }

	    $finalUsersArr = $artistsArr;

	    $finalusersQuery = "SELECT *,`ID` as `id` FROM $table_name WHERE user_status='0' AND ID IN( ".implode(',', $finalUsersArr)." ) ORDER BY display_name ASC limit $curr_limit,$offset";

	    $total_records = $wpdb->get_var("SELECT count(*) FROM $table_name WHERE user_status='0' AND ID IN( ".implode(',', $finalUsersArr)." )");

		$finalusersData = $wpdb->get_results("$finalusersQuery");

	    $artists = $finalusersData;

	}

	//var_dump($total_records);

	if(($curr_limit+$offset) >=  $total_records) {
		$nextpage = '#';
	} else {
		$nextpage = site_url().'/talents/?pg='.($currpage+1).$search_talent_pagination.$search_gender_pagination.$search_age_pagination.$search_location_pagination.$search_artist_category_pagination.$search_cate_pagination;				
	}

	if($currpage >= 2) {
		$prevpage = site_url().'/talents/?pg='.($currpage-1).$search_talent_pagination.$search_gender_pagination.$search_age_pagination.$search_location_pagination.$search_artist_category_pagination.$search_cate_pagination;
	} else {
		$prevpage = '#';
	}
	?>

	<div class="row">
		<div class="col-md-3">
			<div class="search-bar">
				<h4>Search</h4>
				<form id="search-form" name="search-form" class="search-form" action="<?php echo $_SERVER['REQUEST_URI'] ?>" method="get">
	                <div class="filter talent-filter">
	                    <label for="search_talent">Search Talent</label>
	                    <input type="text" placeholder="Type name of Talent" name="search_talent" id="search_talent" value="<?php echo ( !empty($search_talent) ? $search_talent : null ) ?>">
	                </div>
	                <div class="filter premium-filter">
	                    <label for="search_gender">Premium</label> 
	                    <input type="radio" name="search_premium" id="search_premium_only" value="1" <?php if($search_premium == "1") { echo 'checked="checked"' ; } ?>> Premium
	                    <input type="radio" name="search_premium" id="search_premium_all" value="2" <?php if($search_premium == "2") { echo 'checked="checked"' ; } ?>> All
	                </div>
	                <div class="filter gender-filter">
	                    <label for="search_gender">Gender</label> 
	                    <input type="radio" name="search_gender" id="search_gender_male" value="1" <?php if($search_gender == "1") { echo 'checked="checked"' ; } ?>> Male
	                    <input type="radio" name="search_gender" id="search_gender_female" value="2" <?php if($search_gender == "2") { echo 'checked="checked"' ; } ?>> Female
	                </div>
	                <div class="filter range-filter">
	                	<label for="search_age">Age</label> 
	                	<input name="search_age" id="search_age" class="range-slider__range" type="range" value="<?php if(!empty($search_age)){ echo $search_age; } else { echo '100'; } ?>" min="0" max="100" onchange="showMyValue(this.value);">
  						0 - <span id="search_age_value" class="range-slider__value"><?php if(!empty($search_age)){ echo $search_age; } else { echo '100'; } ?></span>
	                </div>
	                <?php
	                if(empty($_GET['cate'])){
	                	$all_categories = get_posts(array('post_type'=>'category','numberposts' => 50 ,'orderby' => 'menu_order', 'order' => 'ASC'));
		                //echo '<pre>';print_r($all_categories);echo '</pre>';
		                if(count($all_categories) > 0){
		                    ?>
		                    <div class="filter category-filter">
		                    <label for="search_artist_category">Category*</label>
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
	                <div class="filter location-filter">
	                    <label for="search_location">Location</label>
	                    <input type="text" placeholder="Type name of Location" name="search_location" id="search_location" value="<?php echo ( !empty($search_location) ? $search_location : null ) ?>">
	                </div>
	                <div class="filter-submit">
	                	<input type="submit" name="submit" value="Search"/>
	                	<input type="button" class="btn" name="reset" value="Reset" onclick="window.location.href='<?php echo site_url().'/talents' ?>';" />
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
	            <h2>Talents</h2>
	        </div>
	        <?php
	        if(count($artists) > 0){
	        	$artist_counter = 1;
	        	foreach ($artists as $artkey => $artist) {
	        	if($artist_counter%3 == 1){ echo '<div class="row">'; }
	        	?>
	        	<div class="col-sm-6 col-md-4">
	                <div class="cities_list hvr-grow">
	                    <?php
	                    $current_profile_photo = get_user_meta($artist->id, 'user_meta_image', true);
	                    if(!empty($current_profile_photo)) {
	                    	?>
	                    	<img src="<?php echo site_url().'/wp-content/uploads/profilephotos/'.$artist->ID.'/'.$current_profile_photo ?>"/>
	                    	<?php
	                    } else { ?>
	                    	<?php if(get_user_meta($artist->id, 'gender', true) == "1"): ?>
	                    		<img src="<?php echo site_url().'/wp-content/uploads/profilephotos/no-image-male.jpg' ?>"/>
	                    	<?php else: ?>
	                    		<img src="<?php echo site_url().'/wp-content/uploads/profilephotos/no-image-female.png' ?>"/>
	                    	<?php endif; ?>
	                    <?php
	                	}
	                    ?>
	                    <div class="city_listings_info">
	                        <p>
	                            <?php echo (get_user_meta($artist->id, 'age', true) ? get_user_meta($artist->id, 'age', true).',' : ''  ) ?>
	                            <?php //echo ','; ?>
	                            <?php echo (get_user_meta($artist->id, 'gender', true) == "1" ? 'Male' : 'Female') ?>
	                        </p>
	                        <h4>
	                        	<?php
	                        	$artist_categories = get_user_meta($artist->id, 'artist_category', true);
	                        	if(!empty($artist_categories) && count($artist_categories) > 0){
	                        		$artist_categories_counter = 1;
	                        		$artist_cate_title = "";
	                        		foreach ($artist_categories as $artcatkey => $artist_cat) {
		                        		$artist_cate_title .= get_the_title($artist_cat);
		                        		if($artist_categories_counter < count($artist_categories)) $artist_cate_title .= ',';
		                        		$artist_categories_counter++;
		                        	}
		                        	echo substr($artist_cate_title, 0, 15);
	                        	}
	                        	?>
	                        </h4>
	                    </div>
	                </div>
	                <div class="listing_number"><a href="<?php echo add_query_arg( 'userId', $artist->id, get_permalink() ); ?>"><span><?php echo $artist->display_name; ?></span></a></div>
	            </div>
	        	<?php
	        	if($artist_counter%3 == 0 || $artist_counter == count($artists)){ echo '</div>'; }
	        	$artist_counter++;
	        	}

	        	?>
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
	    		echo '<div class="no-results-found">No Results Found.</div>';
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