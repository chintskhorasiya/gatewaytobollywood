<?php
 
function custom_theme_assets() {

	if ( ! current_user_can( 'manage_options' ) ) {
	    show_admin_bar( false );
	}

	wp_enqueue_style( 'bootstrap', get_template_directory_uri() . '/css/bootstrap.min.css');
	wp_enqueue_style( 'blue', get_template_directory_uri() . '/css/blue.css' );
	wp_enqueue_style( 'style', get_stylesheet_uri() );
	//wp_enqueue_style( 'style', get_template_directory_uri() . '/css/style.css' );
	wp_enqueue_style( 'owl', get_template_directory_uri() . '/css/owl.carousel.css' );
	wp_enqueue_style( 'font', get_template_directory_uri() . '/css/font-awesome.min.css' );
	wp_enqueue_style( 'switcher', get_template_directory_uri() . '/css/switcher.css' );
	wp_enqueue_style( 'pink', get_template_directory_uri() . '/css/pink.css' );
	wp_enqueue_style( 'orange', get_template_directory_uri() . '/css/orange.css' );
	wp_enqueue_style( 'green', get_template_directory_uri() . '/css/green.css' );
	wp_enqueue_style( 'red', get_template_directory_uri() . '/css/red.css' );
	wp_enqueue_style( 'purple', get_template_directory_uri() . '/css/purple.css' );

	wp_enqueue_script('jquery', get_template_directory_uri() . '/js/jquery.min.js','','', true);
	wp_enqueue_script('bootstrap', get_template_directory_uri() . '/js/bootstrap.min.js','','', true);
	wp_enqueue_script('interface', get_template_directory_uri() . '/js/interface.js','','', true);
	wp_enqueue_script('owl', get_template_directory_uri() . '/js/owl.carousel.min.js','','', true);
	wp_enqueue_script('switcher', get_template_directory_uri() . '/js/switcher.js','','', true);
}
 
add_action( 'wp_enqueue_scripts', 'custom_theme_assets' );

function gob_theme_setup(){
	register_nav_menus(
		array( 
    	'main-menu' => 'Main menu',
    	'footer-menu' => 'Footer Menu'
  		)
  	);
}
add_action('init', 'gob_theme_setup');