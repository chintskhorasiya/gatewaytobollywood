<?php
/*
Plugin Name: Gateway Bollywood Talent Management
Description: It is the talent management plugin by Gateway Bollywood, Different types of artists can register here to show their talent
Version: 1.0.0
Author: Seawind Solution
Author URI: http://www.seawindsolution.com/
*/
// function to create the DB / Options / Defaults					
function gb_options_install() {
    
    add_role( 'artist', __( 'Artist' ), array( 'read' => true, 'level_0' => true ) ); // ADD CUSTOM ROLE AS ARTIST

    add_role( 'recruiter', __( 'Recruiter' ), array( 'read' => true, 'level_0' => true ) ); // ADD CUSTOM ROLE AS Recruiter

    global $wpdb;

    $table_name = $wpdb->prefix . "gateway_bollywood_fields";
    $charset_collate = $wpdb->get_charset_collate();
    
    $sql = "CREATE TABLE $table_name (
    		`id` INT(11) NOT NULL AUTO_INCREMENT ,
    		`fid` VARCHAR(200) NOT NULL , 
    		`label` VARCHAR(200) NOT NULL , 
    		`type` INT(10) NOT NULL , 
    		`options` TEXT NULL , 
    		`required` INT(3) NOT NULL DEFAULT '0' , 
    		`tab` INT(10) NOT NULL , 
    		`validation` INT(3) NOT NULL DEFAULT '0',
    		`active` INT(3) NOT NULL DEFAULT '0' , 
    		PRIMARY KEY (`id`)
    		) ENGINE = InnoDB;";

    require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
    dbDelta($sql);

    /*$table_name2 = $wpdb->prefix . "gateway_bollywood_categories";
    $sql2 = "CREATE TABLE $table_name2 (
    		`id` INT(11) NOT NULL AUTO_INCREMENT ,
    		`parent` INT(11) NOT NULL DEFAULT '0', 
    		`category` VARCHAR(200) NOT NULL , 
    		`category_image` VARCHAR(255) NULL , 
    		`active` INT(3) NOT NULL DEFAULT '0' , 
    		PRIMARY KEY (`id`)
    		) ENGINE = InnoDB;";*/

    dbDelta($sql2);

    $table_name3 = $wpdb->prefix . "gateway_bollywood_profile_status";
    $sql3 = "CREATE TABLE $table_name3 (
    		`user_id` INT(11) NOT NULL ,
    		`status` INT(11) NOT NULL
    		) ENGINE = InnoDB;";

    dbDelta($sql3);

    $table_name4 = $wpdb->prefix ."gateway_bollywood_jobs";

    $sql4 = "CREATE TABLE $table_name4 ( 
    		`id` INT(11) NOT NULL AUTO_INCREMENT , 
    		`title` VARCHAR(255) NOT NULL , 
    		`description` TEXT NOT NULL ,
    		`job_image` VARCHAR(255) NULL DEFAULT NULL,
    		`user_id` INT(11) NOT NULL,
    		`gender` INT(2) NOT NULL DEFAULT '0',
    		`age_from` INT(3) NULL DEFAULT NULL,
    		`age_to` INT(3) NULL DEFAULT NULL,
    		`job_category` INT(11) NULL DEFAULT NULL,
    		`job_type` INT(11) NULL DEFAULT NULL,
    		`job_start_date` DATE NULL DEFAULT NULL,
    		`job_end_date` DATE NULL DEFAULT NULL,
    		`expiry_date` DATE NULL DEFAULT NULL, 
    		`active` INT(2) NOT NULL DEFAULT '0' , 
    		`featured` INT(2) NOT NULL DEFAULT '0',
    		`date_added` DATE NOT NULL,
    		PRIMARY KEY (`id`)
    		) ENGINE = InnoDB;";

    dbDelta($sql4);

    $table_name5 = $wpdb->prefix . "gateway_bollywood_jobs_applicants";
    $sql5 = "CREATE TABLE $table_name5 (
    		`job_id` INT(11) NOT NULL ,
    		`artist_id` INT(11) NOT NULL
    		) ENGINE = InnoDB;";

    dbDelta($sql5);

}

// run the install scripts upon plugin activation
register_activation_hook(__FILE__, 'gb_options_install');

add_filter( 'lostpassword_url',  'wdm_lostpassword_url', 10, 0 );
function wdm_lostpassword_url() {
    return site_url('/lostpassword/');
}


//menu items
add_action('admin_menu','gateway_bollywood_modifymenu');
function gateway_bollywood_modifymenu() {
	
	//this is the main item for the menu
	add_menu_page('Gateway Bollywood', //page title
	'Gateway Bollywood', //menu title
	'manage_options', //capabilities
	'gateway_artists_list', //menu slug
	'gateway_artists_list' //function
	);

	//this is the main item for the menu
	add_submenu_page('gateway_artists_list',
	'Gateway Bollywood User Fields', //page title
	'User Fields', //menu title
	'manage_options', //capabilities
	'gateway_fields_list', //menu slug
	'gateway_fields_list' //function
	);
	
	//this is a submenu
	add_submenu_page('gateway_fields_list', //parent slug
	'Add New Field', //page title
	'Add New', //menu title
	'manage_options', //capability
	'gateway_fields_create', //menu slug
	'gateway_fields_create'); //function
	
	//this submenu is HIDDEN, however, we need to add it anyways
	add_submenu_page(null, //parent slug
	'Update Field', //page title
	'Update', //menu title
	'manage_options', //capability
	'gateway_fields_update', //menu slug
	'gateway_fields_update'); //function

	//this is the main item for the menu
	add_submenu_page('gateway_artists_list',
	'Gateway Bollywood Jobs', //page title
	'Jobs', //menu title
	'manage_options', //capabilities
	'gateway_jobs_list', //menu slug
	'gateway_jobs_list' //function
	);
	
	//this submenu is HIDDEN, however, we need to add it anyways
	add_submenu_page(null, //parent slug
	'Update Job', //page title
	'Update', //menu title
	'manage_options', //capability
	'gateway_jobs_update', //menu slug
	'gateway_jobs_update'); //function

	add_submenu_page('gateway_artists_list',
	 'Gateway Bollywood Settings',
	 'Settings',
	 'manage_options',
	 'gateway_bollywood_options_page_html',
	 'gateway_bollywood_options_page_html'
	 );
}

// Hijack the option, the role will follow!
add_filter('pre_option_default_role', function($default_role){
    // You can also add conditional tags here and return whatever
    return 'artist'; // This is changed
    return $default_role; // This allows default
});

function artist_login_redirect( $redirect_to, $request, $user ) {
	$options = get_option( 'gateway_bollywood_options' );

	//is there a user to check?
	if ( isset( $user->roles ) && is_array( $user->roles ) ) {
		//check for admins
		if ( in_array( 'artist', $user->roles ) ) {
			// redirect them to the custom place
			//return get_site_url().'/artist-profile'; // home_url();
			return get_page_link($options['gateway_bollywood_field_profile_page']);
		} else {
			return $redirect_to;
		}
	} else {
		return $redirect_to;
	}
}

add_filter( 'login_redirect', 'artist_login_redirect', 10, 3 );

add_shortcode('artist_login_register_password', 'artist_login_register_password_html');
add_shortcode('artist_login', 'artist_login_html');

add_shortcode('artist_lostpassword', 'artist_lostpassword_html');
add_shortcode('artist_resetpassword', 'artist_resetpassword_html');

add_shortcode('artist_profile', 'artist_profile_html');
add_shortcode('artist_profile_interests', 'artist_profile_interests_html');
add_shortcode('artist_profile_experience', 'artist_profile_experience_html');

/**
 * @internal never define functions inside callbacks.
 * these functions could be run multiple times; this would result in a fatal error.
 */
 
/**
 * custom option and settings
 */
function gateway_bollywood_settings_init() {

 // register a new setting for "gateway_bollywood" page
 register_setting( 'gateway_bollywood', 'gateway_bollywood_options' );
 
 // register a new section in the "gateway_bollywood" page
 add_settings_section(
 'gateway_bollywood_section_developers',
 __( 'Below are some shortcodes, you must need it!.', 'gateway_bollywood' ),
 'gateway_bollywood_section_developers_cb',
 'gateway_bollywood'
 );
 
 // register a new field in the "gateway_bollywood_section_developers" section, inside the "gateway_bollywood" page
 /*add_settings_field(
 'gateway_bollywood_field_pill', // as of WP 4.6 this value is used only internally
 // use $args' label_for to populate the id inside the callback
 __( 'Pill', 'gateway_bollywood' ),
 'gateway_bollywood_field_pill_cb',
 'gateway_bollywood',
 'gateway_bollywood_section_developers',
 [
 'label_for' => 'gateway_bollywood_field_pill',
 'class' => 'gateway_bollywood_row',
 'gateway_bollywood_custom_data' => 'custom',
 ]
 );*/

 add_settings_field(
 'gateway_bollywood_field_registration_page', // as of WP 4.6 this value is used only internally
 // use $args' label_for to populate the id inside the callback
 __( 'Registration Page for Artist', 'gateway_bollywood' ),
 'gateway_bollywood_field_page',
 'gateway_bollywood',
 'gateway_bollywood_section_developers',
 [
 'label_for' => 'gateway_bollywood_field_registration_page',
 'class' => 'gateway_bollywood_row',
 'gateway_bollywood_custom_data' => 'custom',
 ]
 );

 add_settings_field(
 'gateway_bollywood_field_login_page', // as of WP 4.6 this value is used only internally
 // use $args' label_for to populate the id inside the callback
 __( 'Login Page for Artist', 'gateway_bollywood' ),
 'gateway_bollywood_field_page',
 'gateway_bollywood',
 'gateway_bollywood_section_developers',
 [
 'label_for' => 'gateway_bollywood_field_login_page',
 'class' => 'gateway_bollywood_row',
 'gateway_bollywood_custom_data' => 'custom',
 ]
 );

 add_settings_field(
 'gateway_bollywood_field_profile_page', // as of WP 4.6 this value is used only internally
 // use $args' label_for to populate the id inside the callback
 __( 'Profile Page for Artist', 'gateway_bollywood' ),
 'gateway_bollywood_field_page',
 'gateway_bollywood',
 'gateway_bollywood_section_developers',
 [
 'label_for' => 'gateway_bollywood_field_profile_page',
 'class' => 'gateway_bollywood_row',
 'gateway_bollywood_custom_data' => 'custom',
 ]
 );

 add_settings_field(
 'gateway_bollywood_field_profileinterest_page', // as of WP 4.6 this value is used only internally
 // use $args' label_for to populate the id inside the callback
 __( 'Profile Interest Page for Artist', 'gateway_bollywood' ),
 'gateway_bollywood_field_page',
 'gateway_bollywood',
 'gateway_bollywood_section_developers',
 [
 'label_for' => 'gateway_bollywood_field_profileinterest_page',
 'class' => 'gateway_bollywood_row',
 'gateway_bollywood_custom_data' => 'custom',
 ]
 );

 add_settings_field(
 'gateway_bollywood_field_profileexperience_page', // as of WP 4.6 this value is used only internally
 // use $args' label_for to populate the id inside the callback
 __( 'Profile Experience Page for Artist', 'gateway_bollywood' ),
 'gateway_bollywood_field_page',
 'gateway_bollywood',
 'gateway_bollywood_section_developers',
 [
 'label_for' => 'gateway_bollywood_field_profileexperience_page',
 'class' => 'gateway_bollywood_row',
 'gateway_bollywood_custom_data' => 'custom',
 ]
 );

}
 
/**
 * register our gateway_bollywood_settings_init to the admin_init action hook
 */
add_action( 'admin_init', 'gateway_bollywood_settings_init' );
 
/**
 * custom option and settings:
 * callback functions
 */
 
// developers section cb
 
// section callbacks can accept an $args parameter, which is an array.
// $args have the following keys defined: title, id, callback.
// the values are defined at the add_settings_section() function.
function gateway_bollywood_section_developers_cb( $args ) {
 ?>
 <p id="<?php echo esc_attr( $args['id'] ); ?>"><?php esc_html_e( '', 'gateway_bollywood' ); ?></p>
 <ul>
 	<li><b>[artist_login_register_password]</b> : For displaying registration page for artist on frontend</li>
 	<li><b>[artist_login]</b> : For displaying login page for artist on frontend</li>
 	<li><b>[artist_profile]</b> : For displaying profile page for artist on frontend</li>
 	<li><b>[artist_profile_interests]</b> : For displaying profile interests page for artist on frontend</li>
 	<li><b>[artist_profile_experience]</b> : For displaying profile experience page for artist on frontend</li>
 </ul>
 <?php
}
 
// pill field cb
 
// field callbacks can accept an $args parameter, which is an array.
// $args is defined at the add_settings_field() function.
// wordpress has magic interaction with the following keys: label_for, class.
// the "label_for" key value is used for the "for" attribute of the <label>.
// the "class" key value is used for the "class" attribute of the <tr> containing the field.
// you can add custom key value pairs to be used inside your callbacks.
function gateway_bollywood_field_pill_cb( $args ) {
 // get the value of the setting we've registered with register_setting()
 $options = get_option( 'gateway_bollywood_options' );
 // output the field
 ?>
 <select id="<?php echo esc_attr( $args['label_for'] ); ?>"
 data-custom="<?php echo esc_attr( $args['gateway_bollywood_custom_data'] ); ?>"
 name="gateway_bollywood_options[<?php echo esc_attr( $args['label_for'] ); ?>]"
 >
 <option value="red" <?php echo isset( $options[ $args['label_for'] ] ) ? ( selected( $options[ $args['label_for'] ], 'red', false ) ) : ( '' ); ?>>
 <?php esc_html_e( 'red pill', 'gateway_bollywood' ); ?>
 </option>
 <option value="blue" <?php echo isset( $options[ $args['label_for'] ] ) ? ( selected( $options[ $args['label_for'] ], 'blue', false ) ) : ( '' ); ?>>
 <?php esc_html_e( 'blue pill', 'gateway_bollywood' ); ?>
 </option>
 </select>
 <p class="description">
 <?php esc_html_e( 'You take the blue pill and the story ends. You wake in your bed and you believe whatever you want to believe.', 'gateway_bollywood' ); ?>
 </p>
 <p class="description">
 <?php esc_html_e( 'You take the red pill and you stay in Wonderland and I show you how deep the rabbit-hole goes.', 'gateway_bollywood' ); ?>
 </p>
 <?php
}

// page field cb
 
function gateway_bollywood_field_page( $args ) {
 // get the value of the setting we've registered with register_setting()
 $options = get_option( 'gateway_bollywood_options' );
 // output the field
 //echo '<pre>';print_r($options);echo '</pre>';
 //echo '<pre>';print_r($args);echo '</pre>';
 //var_dump(selected( $options[ $args['label_for'] ], '', false ));
 ?>
 <?php wp_dropdown_pages(array('name'=>'gateway_bollywood_options['.esc_attr($args['label_for']).']','selected' => $options[ $args['label_for']])); ?> 
 <?php
}
 
/**
 * top level menu
 */

/**
 * top level menu:
 * callback functions
 */
function gateway_bollywood_options_page_html() {
 // check user capabilities
 if ( ! current_user_can( 'manage_options' ) ) {
 return;
 }
 
 // add error/update messages
 
 // check if the user have submitted the settings
 // wordpress will add the "settings-updated" $_GET parameter to the url
 if ( isset( $_GET['settings-updated'] ) ) {
 // add settings saved message with the class of "updated"
 add_settings_error( 'gateway_bollywood_messages', 'gateway_bollywood_message', __( 'Settings Saved', 'gateway_bollywood' ), 'updated' );
 }
 
 // show error/update messages
 settings_errors( 'gateway_bollywood_messages' );
 ?>
 <div class="wrap">
 <h1><?php echo esc_html( get_admin_page_title() ); ?></h1>
 <form action="options.php" method="post">
 <?php
 // output security fields for the registered setting "gateway_bollywood"
 settings_fields( 'gateway_bollywood' );
 // output setting sections and their fields
 // (sections are registered for "gateway_bollywood", each field is registered to a specific section)
 do_settings_sections( 'gateway_bollywood' );
 // output save settings button
 submit_button( 'Save Settings' );
 ?>
 </form>
 </div>
<?php
}

define('GATEWAYBOLLYWOOD_ROOTDIR', plugin_dir_path(__FILE__));
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artists-list.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artist-login-register-password.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artist-login.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artist-profile.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artist-profile-timeline.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artist-profile-interests.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'artist-profile-experience.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'fields-list.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'fields-create.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'fields-update.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'jobs-list.php');
require_once(GATEWAYBOLLYWOOD_ROOTDIR . 'jobs-update.php');

// Register Custom Post Type
function category_post_type() {

	$labels = array(
		'name'                  => _x( 'Categories', 'Post Type General Name', 'text_domain' ),
		'singular_name'         => _x( 'Category', 'Post Type Singular Name', 'text_domain' ),
		'menu_name'             => __( 'Categories', 'text_domain' ),
		'name_admin_bar'        => __( 'Category', 'text_domain' ),
		'archives'              => __( 'Category Archives', 'text_domain' ),
		'attributes'            => __( 'Category Attributes', 'text_domain' ),
		'parent_item_colon'     => __( 'Parent Category:', 'text_domain' ),
		'all_items'             => __( 'All Categories', 'text_domain' ),
		'add_new_item'          => __( 'Add New Category', 'text_domain' ),
		'add_new'               => __( 'Add New', 'text_domain' ),
		'new_item'              => __( 'New Category', 'text_domain' ),
		'edit_item'             => __( 'Edit Category', 'text_domain' ),
		'update_item'           => __( 'Update Category', 'text_domain' ),
		'view_item'             => __( 'View Category', 'text_domain' ),
		'view_items'            => __( 'View Categories', 'text_domain' ),
		'search_items'          => __( 'Search Category', 'text_domain' ),
		'not_found'             => __( 'Not found', 'text_domain' ),
		'not_found_in_trash'    => __( 'Not found in Trash', 'text_domain' ),
		'featured_image'        => __( 'Featured Image', 'text_domain' ),
		'set_featured_image'    => __( 'Set featured image', 'text_domain' ),
		'remove_featured_image' => __( 'Remove featured image', 'text_domain' ),
		'use_featured_image'    => __( 'Use as featured image', 'text_domain' ),
		'insert_into_item'      => __( 'Insert into category', 'text_domain' ),
		'uploaded_to_this_item' => __( 'Uploaded to this category', 'text_domain' ),
		'items_list'            => __( 'Categories list', 'text_domain' ),
		'items_list_navigation' => __( 'Categories list navigation', 'text_domain' ),
		'filter_items_list'     => __( 'Filter Categories list', 'text_domain' ),
	);
	$args = array(
		'label'                 => __( 'Category', 'text_domain' ),
		'description'           => __( 'Categories information page.', 'text_domain' ),
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'thumbnail', 'revisions', 'custom-fields', 'page-attributes', ),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 80,
		'menu_icon'             => 'dashicons-image-filter',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,		
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'category', $args );

}
add_action( 'init', 'category_post_type', 0 );

// Register Custom Post Type
function interest_post_type() {

	$labels = array(
		'name'                  => _x( 'Interests', 'Post Type General Name', 'text_domain' ),
		'singular_name'         => _x( 'Interest', 'Post Type Singular Name', 'text_domain' ),
		'menu_name'             => __( 'Interests', 'text_domain' ),
		'name_admin_bar'        => __( 'Interest', 'text_domain' ),
		'archives'              => __( 'Item Archives', 'text_domain' ),
		'attributes'            => __( 'Item Attributes', 'text_domain' ),
		'parent_item_colon'     => __( 'Parent Item:', 'text_domain' ),
		'all_items'             => __( 'All Items', 'text_domain' ),
		'add_new_item'          => __( 'Add New Item', 'text_domain' ),
		'add_new'               => __( 'Add New', 'text_domain' ),
		'new_item'              => __( 'New Item', 'text_domain' ),
		'edit_item'             => __( 'Edit Item', 'text_domain' ),
		'update_item'           => __( 'Update Item', 'text_domain' ),
		'view_item'             => __( 'View Item', 'text_domain' ),
		'view_items'            => __( 'View Items', 'text_domain' ),
		'search_items'          => __( 'Search Item', 'text_domain' ),
		'not_found'             => __( 'Not found', 'text_domain' ),
		'not_found_in_trash'    => __( 'Not found in Trash', 'text_domain' ),
		'featured_image'        => __( 'Featured Image', 'text_domain' ),
		'set_featured_image'    => __( 'Set featured image', 'text_domain' ),
		'remove_featured_image' => __( 'Remove featured image', 'text_domain' ),
		'use_featured_image'    => __( 'Use as featured image', 'text_domain' ),
		'insert_into_item'      => __( 'Insert into item', 'text_domain' ),
		'uploaded_to_this_item' => __( 'Uploaded to this item', 'text_domain' ),
		'items_list'            => __( 'Items list', 'text_domain' ),
		'items_list_navigation' => __( 'Items list navigation', 'text_domain' ),
		'filter_items_list'     => __( 'Filter items list', 'text_domain' ),
	);
	$args = array(
		'label'                 => __( 'Interest', 'text_domain' ),
		'description'           => __( 'Interest information page.', 'text_domain' ),
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'excerpt', 'author', 'thumbnail', 'comments', 'revisions', 'page-attributes', ),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 80,
		'menu_icon'             => 'dashicons-nametag',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,		
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'interest', $args );

}
add_action( 'init', 'interest_post_type', 0 );