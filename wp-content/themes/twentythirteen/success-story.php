<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages and that other
 * 'pages' on your WordPress site will use a different template.
 * Template name: Success Story
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */

get_header(); ?>
<section class="inner-page inner-story">
   <header class="entry-header inner-title"> 
						<?php if ( has_post_thumbnail() && ! post_password_required() ) : ?>
						<div class="entry-thumbnail">
							<?php the_post_thumbnail(); ?>
						</div>
						<?php endif; ?>

						<h1 class="entry-title"><?php the_title(); ?></h1>
	</header><!-- .entry-header -->
	
<section id="banner">
     <img src="<?php echo get_template_directory_uri() ?>/images/bannermain-inner.jpg" alt="image">
</section>
	  <div id="primary" class="content-area">
		<div id="content" class="site-content" role="main">
          <div class="container">
			<?php /* The loop */ ?>
			<?php while ( have_posts() ) : the_post(); ?>

				<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>  
						      <div class="row">
		                      <?php  
								 global $post;  
								 $args = array( 'numberposts' =>4, 'offset'=> 0, 'category_name'=> 'success-story' );  
								 $myposts = get_posts( $args );  
								 foreach( $myposts as $post ) :    setup_postdata($post); ?>	
								<div class="col-md-3"> 
									   <div class="post_wrap">
											<div class="post_img">
												<?php the_post_thumbnail( $size, $attr ); ?>
											</div>
											<div class="actor-name"><h2><?php the_title(); ?></h2></div>
											<div class="actor-location"><?php echo get_post_meta($post->ID, 'Location', true); ?></div>
											<div class="post_info">
												<h4><?php the_content(); ?></h4>
											</div>
										</div>
								 </div>  
                                  <?php endforeach; ?>   								 
								 <div class="clearfix"> </div>	
        	 
                              </div>    
				</article><!-- #post -->
 
			<?php endwhile; ?>

		</div><!-- #content -->
	</div><!-- #primary -->
</div>	

</section>
<?php get_sidebar(); ?>
<?php get_footer(); ?>