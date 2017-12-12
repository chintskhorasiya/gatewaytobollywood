<?php
/**
 * The Header template for our theme
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?><!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 7) & !(IE 8)]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<!--<meta name="viewport" content="width=device-width">-->
	<title><?php wp_title( '|', true, 'right' ); ?></title>
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<link href="<?php bloginfo( 'template_url' ); ?>/style1.css" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js"></script>
	<![endif]-->
	
<!-- Fav and touch icons -->

<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/favicon-icon/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/favicon-icon/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="images/favicon-icon/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="<?php bloginfo( 'template_url' ); ?>/images/favicon.png" type="image/x-icon">

<!-- Google-Font-->

<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Karla:400,400i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700,800" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
	<div id="page" class="hfeed site">
		<header id="header" class="site-header" role="banner"> 
			<div class="logo"> 
			<a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home">
			<img src="<?php echo get_template_directory_uri() ?>/images/logo.png" alt="image"/>
			</a>
			</div>

			<div id="navbar" class="navbar navbar-default">
			  <div class="container">
				<nav id="site-navigation navigation" class="navigation main-navigation" role="navigation">
					<button class="menu-toggle"><?php _e( 'Menu', 'twentythirteen' ); ?></button>
					<a class="screen-reader-text skip-link" href="#content" title="<?php esc_attr_e( 'Skip to content', 'twentythirteen' ); ?>"><?php _e( 'Skip to content', 'twentythirteen' ); ?></a>
					<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'nav-menu', 'menu_id' => 'primary-menu' ) ); ?>
					 
				</nav><!-- #site-navigation -->
				
				<?php $gateway_options = get_option( 'gateway_bollywood_options' ); ?>

          	<?php if($gateway_options): ?>
          		<?php if(!is_user_logged_in()): ?>

		          	<div class="left-m">
				   		<li class="menu-item-has-children"><a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_login_page']); ?>">Login</a></li>
				  		<div class="submit_listing">
			            	<a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_registration_page']); ?>" class="btn outline-btn"> Sign Up</a>
		            	</div>
					</div>

				<?php else: ?>

					<?php
					$current_user = wp_get_current_user();

					?>

					<div class="left-m">
				   		<li class="menu-item-has-children"><a href="<?php echo add_query_arg( 'userId', $user_ID, site_url().'/talents/'); ?>">Hi, <?php echo $current_user->display_name; ?></a>
		              		<ul class="sub-menu">
		              			<?php
		              			if ( in_array( 'recruiter', (array) $current_user->roles ) ) {
								    ?>
								<li><a href="<?php echo site_url() ?>/recruiter-dashboard">Dashboard</a></li>
								    <?php
								}
								if ( in_array( 'artist', (array) $current_user->roles ) ) {
								    ?>
								<li><a href="<?php echo site_url() ?>/artist-dashboard">Dashboard</a></li>
								    <?php
								}?>
								<li><a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_profile_page']); ?>">Edit Profile</a></li>
								<li><a href="<?php echo site_url() ?>/change-password">Change Password</a></li>
			                </ul>
		              	</li>
				  		<div class="submit_listing">
			            	<a href="<?php echo wp_logout_url('index.php'); ?>" class="btn outline-btn">Logout</a>
		            	</div>
					</div>
				<?php endif; ?>

			<?php endif; ?>
			  </div>
		    </div><!-- #navbar -->	
		</header><!-- #masthead -->

<!-- Banner -->

		<div id="main" class="site-main">
