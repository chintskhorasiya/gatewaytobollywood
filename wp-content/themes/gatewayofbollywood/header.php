<!DOCTYPE html>
<html <?php language_attributes(); ?>>
 
<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>">
    <title><?php bloginfo( 'name' ); ?></title>
	<?php wp_head() ?>

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/favicon-icon/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/favicon-icon/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="images/favicon-icon/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="images/favicon-icon/favicon.png">
<!-- Google-Font-->
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Karla:400,400i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700,800" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->  
</head>
 
<body <?php body_class(); ?>>

<header id="header">
	<div class="logo"> <a href="index.html"><img src="<?php echo get_template_directory_uri() ?>/images/logo.png" alt="image"/></a> </div>
    <!--<h1><?php bloginfo( 'name' ); ?></h1>
    <h4><?php bloginfo( 'description' ); ?></h4>-->

    <nav class="navbar navbar-default " >
        <div class="container">
          	<div class="navbar-header">
	            <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> 
	                <span class="sr-only">Toggle navigation</span> 
	                <span class="icon-bar"></span> 
	                <span class="icon-bar"></span> 
	                <span class="icon-bar"></span> 
	            </button>
          	</div>
          	<div class="collapse navbar-collapse" id="navigation">
			  	<nav class="fy-navigation">
	            	<?php echo wp_nav_menu( array( 'theme_location' => 'main-menu', 'menu_class' => 'nav navbar-nav', 'fallback_cb' => false ) ); ?>
	            	<ul class="nav navbar-nav" style="display: none;">
	              		<li class="menu-item-has-children"><a href="#">Home</a> 
	              			<!--<ul class="sub-menu">
	                			<li><a href="index.html">Home 1</a></li>
	                    		<li><a href="index-2.html">Home 2</a></li>
	                 		</ul>-->
	              		</li>
	              		<li class="menu-item-has-children"><a href="#">About</a> 
	              		</li>
	              		<li class="menu-item-has-children"><a href="#">Talent</a> 
	              		</li>
	              		<li class="menu-item-has-children"><a href="#">Trending Audition & job</a>	
	              		</li>
	              		<li class="menu-item-has-children"><a href="#">FAQ</a>
	              		</li>
	            	</ul>
	       		</nav>
          	</div>
          	<?php $gateway_options = get_option( 'gateway_bollywood_options' ); ?>
          	<?php if($gateway_options): ?>
          		<?php if(!is_user_logged_in()): ?>
		          	<div class="left-m">
				   		<li class="menu-item-has-children"><a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_login_page']); ?>">Login</a>
		              	</li>
				  		<div class="submit_listing">
			            	<a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_registration_page']); ?>" class="btn outline-btn"> Sign Up</a>
		            	</div>
					</div>
				<?php else: ?>
					<?php
					$current_user = wp_get_current_user();
					?>
					<div class="left-m">
				   		<li class="menu-item-has-children"><a href="<?php echo get_page_link($gateway_options['gateway_bollywood_field_login_page']); ?>">Hi, <?php echo $current_user->display_name; ?></a>
		              	</li>
				  		<div class="submit_listing">
			            	<a href="<?php echo wp_logout_url('index.php'); ?>" class="btn outline-btn">Logout</a>
		            	</div>
					</div>
				<?php endif; ?>
			<?php endif; ?>
        </div>
    </nav>
</header>

<!-- Banner -->
<section id="banner" >
<img src="<?php echo get_template_directory_uri() ?>/images/bannermain.jpg"/>
	<div class="container">
    	<div class="intro_text white-text div_zindex">
       <div class="search_form">
	   <p> Actors, Models, Musicians, Dancers, Singers, Script Writers, Choreographers and more...</p>
            <h3>Welcome to Gateway to Bollywood
			</h3>
			<strong> Apply Now</strong>
				
            </div>
        </div>
    </div>
   <!-- <div class="dark-overlay"></div>-->
<!--<div class="fy-pattern dots-2-iso"></div>-->
</section>
<!-- /Banner -->