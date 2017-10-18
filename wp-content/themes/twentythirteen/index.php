<?php
/**
 * The main template file
 *
 * This is the most generic template file in a WordPress theme and one of the
 * two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * For example, it puts together the home page when no home.php file exists.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */

include('main-header.php'); ?>
 
<div class="fy-border-pattern cubist-2">
	<svg class="border" width="2560" height="30" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2560 30">
		<defs>
			<pattern id="pattern-cubist-1006805930" x="0" y="0" width="1280" height="30" patternUnits="userSpaceOnUse">
				<polygon class="shape" points="1139,8 1059,20 645,0 478,19 267,11 0,21 0,30 1280,30 1280,21"></polygon>
			</pattern>
		</defs>
		<rect x="0" y="0" width="100%" height="30" fill="url(#pattern-cubist-1006805930)"></rect>
	</svg>
</div>
<?php
$all_categories = get_posts(array('post_type'=>'category','numberposts' => 50, 'orderby' => 'menu_order', 'order' => 'ASC'));
//echo '<pre>';print_r($all_categories);echo '</pre>';
?>
<!-- Category-Slider -->
<section id="all_category" class="gray_bg">
	<div class="container">
    	<div id="category_slider">
			<h2> Talent Category</h2>
    		<div class="owl-carousel owl-theme">
        		<?php if(count($all_categories) > 0){ ?>
            		<?php foreach($all_categories as $category){ ?>
            		<div class="item">
                		<a href="<?php echo site_url(); ?>/talent/?cate=<?php echo $category->ID; ?>">
                			<div class="category_icon">
                				<?php $featured_img_url = get_the_post_thumbnail_url($category->ID,'full'); ?>
                				<img src="<?php echo $featured_img_url; ?>" alt="image">
                			</div>
                		</a>
                		<p><?php echo $category->post_title; ?></p>
                	</div>
                	<?php } ?>
        		<?php } else { ?>
        		<div class="item">
            		<a href="#">
            			<div class="category_icon">
            				<img src="<?php echo get_template_directory_uri() ?>/images/icons/10.png" alt="image">
            			</div>
            		</a>
            		<p>Actor</p>
            	</div>
                <div class="item">
                	<a href="#">
    	            	<div class="category_icon">
                            <img src="<?php echo get_template_directory_uri() ?>/images/icons/5.png" alt="image">
                        </div>
                    </a>
                    <p>Director</p>
                </div>
                <div class="item">
                	<a href="#">
    	            	<div class="category_icon">
                            <img src="<?php echo get_template_directory_uri() ?>/images/icons/11.png" alt="image">
                        </div> 
                    </a>
					<p>Assistant Director</p>
                </div>
              	<div class="item">
                	<a href="#">
    	            	<div class="category_icon">
                            <img src="<?php echo get_template_directory_uri() ?>/images/icons/8.png" alt="image">
                        </div>
                    </a>
					<p>Art Director</p>
                </div>
                <div class="item">
                	<a href="#">
    	            	<div class="category_icon">
                            <img src="<?php echo get_template_directory_uri() ?>/images/icons/2.png" alt="image">
                        </div>
                    </a>
                    <p>Composer</p>
                </div>
                <div class="item">
                	<a href="#">
    	            	<div class="category_icon">
                            <img src="<?php echo get_template_directory_uri() ?>/images/icons/6.png" alt="image">
                        </div>
                    </a>
                    <p>Dancer</p>
                </div>
                <div class="item">
                	<a href="#">
    	            	<div class="category_icon">
                            <img src="<?php echo get_template_directory_uri() ?>/images/icons/3.png" alt="image">
                        </div>
                    </a>
                    <p>Model</p>
                </div>
                <?php } ?>
            </div>
			 <div class="text-center">
            	<a href="<?php bloginfo( 'template_url' ); ?>/talents/" class="btn">More </a>
             </div>
        </div>        
    </div>
</section>
<!-- /Category-Slider -->

<?php
global $wpdb;

$job_table_name = $wpdb->prefix . "gateway_bollywood_jobs";

$featured_jobs = $wpdb->get_results("SELECT * from $job_table_name WHERE `featured` = '1' order by `id` DESC"); // `featured` = '1'
?>

<!-- Popular-Cities/Towns -->
<section id="popular_cities" class="home-trendings section-padding">
	<div class="container">
		<div class="section-header text-center">
			<h2>Trending Jobs & Auditions</h2>
		</div>
        <div class="row">
            <?php if(count($featured_jobs) > 0){
                $featured_job_counter = 0;
                foreach($featured_jobs as $featured_job){
                
                $featured_job_counter++;
                ?>
                <div class="col-sm-6 col-md-3">
                    <div class="cities_list hvr-grow">
                        <?php
                        if(empty($featured_job->job_image)){
                            ?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/no-job-image.png'; ?>" height="70" width="100" alt="No-Image" title="No-Image" /><?php
                        } else {
                            ?><img src="<?php echo site_url().'/wp-content/uploads/jobimages/'.$featured_job->user_id.'/'.$featured_job->job_image ?>" height="70" width="100" alt="<?php echo substr($featured_job->title, 0, 35); ?>" title="<?php echo substr($featured_job->title, 0, 35); ?>" /><?php
                        }
                        ?>
                        <div class="city_listings_info">
                            <p><?php echo substr($featured_job->title, 0, 35); ?></p>
                            <h4><?php if(!empty($featured_job->job_category)) { echo get_the_title($featured_job->job_category); } ?></h4>
                        </div> 
                       <div class="listing_number"><a href="<?php echo site_url().'/trending-jobs/?jobId='.$featured_job->id; ?>"><span>Apply</span></a></div>
                     </div>
			   </div>
                <?php
                if($featured_job_counter >= 8) break;
                }
                ?>
            <?php } else { ?>
        	<div class="col-sm-6 col-md-3">
            	<div class="cities_list hvr-grow">
            		<img src="<?php echo get_template_directory_uri() ?>/images/icons/cities_1.png"/>
            		<div class="city_listings_info">
            			<p> Female  Actor For Web Series</p>
            			<h4>Actor</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list chicago hvr-grow">
            		<img src="<?php echo get_template_directory_uri() ?>/images/icons/5.png"/>
            		<div class="city_listings_info">
            			<p>Director For Web Series</p>
                     	<h4>Director</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list angeles hvr-grow">
            		<img src="<?php echo get_template_directory_uri() ?>/images/icons/11.png"/>
                    <div class="city_listings_info">
                    	<p> Assistant Director For Web Series</p>
                     	<h4>Assistant Director</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list francisco hvr-grow">
					<img src="<?php echo get_template_directory_uri() ?>/images/icons/8.png"/>
                    <div class="city_listings_info">
                    	<p> Art Director For Web Series</p>
                    	<h4>Art Director</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list seattle hvr-grow">
					<img src="<?php echo get_template_directory_uri() ?>/images/icons/1.png"/>
                    <div class="city_listings_info">
                    	<p>Composer For Film</p>
                    	<h4>Composer</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list washington hvr-grow">
					<img src="<?php echo get_template_directory_uri() ?>/images/icons/6.png"/>
                    <div class="city_listings_info">
                    	<p> Male Dancer For Film</p>
                    	<h4>Dancer</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list orlando hvr-grow">
					<img src="<?php echo get_template_directory_uri() ?>/images/icons/3.png"/>
                    <div class="city_listings_info">
                    	<p> Male & Female Models For Film</p>
                    	<h4>Model</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <div class="col-sm-6 col-md-3">
            	<div class="cities_list miami hvr-grow">
					<img src="<?php echo get_template_directory_uri() ?>/images/icons/4.png"/>
                    <div class="city_listings_info">
                    	<p> Voice Artist female For Film</p>
                      	<h4>Voice over Artist</h4>
                    </div>
                </div>
                <div class="listing_number"><a href=""><span>Apply</span></a></div>
            </div>
            <?php } ?>
        </div>
        <div class="text-center">
        	<a href="<?php bloginfo( 'template_url' ); ?>/trending-jobs-auditions/" class="btn">More </a>
        </div>
    </div>
</section>
<!-- /Popular Cities/Towns -->

<?php echo do_shortcode( '[testimonial_rotator id="45"]' ); ?>

<!-- Testimonials -->
<section id="testimonials" class="section-padding parallex-bg">
	<div class="container">
    	<div class="section-header text-center white-text div_zindex">
        	<h2>Testimonials</h2>
        </div>
        <div id="testimonial_slider" class="div_zindex text-center">
        	<div class="owl-carousel owl-theme owl-loaded owl-drag">
                               <?php  
								 global $post;  
								 $args = array( 'numberposts' =>100, 'offset'=> 0, 'category_name'=> 'testimonial' );  
								 $myposts = get_posts( $args );  
								 foreach( $myposts as $post ) :    setup_postdata($post); ?>	   
								 <div class="item">
									<?php the_post_thumbnail( $size, $attr ); ?>
									<div class="testimonial_header">
										<h5><?php the_content(); ?></h5>
									</div> 
								 </div>
                                  <?php endforeach; ?>   		    
			  
            </div>
        </div>
    </div>
	<div class="dark-overlay"></div>
</section>
<!-- /Testimonials -->

<!-- Latest-Blog -->
<section id="latest_blog" class="success-story-home section-padding">
	<div class="container">
    	<div class="section-header text-center">
    		<h2>Success Stories</h2>
    	</div>
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
											<div class="post_info">
												<h4><?php the_content(); ?></h4>
											</div>
										</div>
								 </div>  
                                  <?php endforeach; ?>   								 
								 <div class="clearfix"> </div>	
        	 
        </div>
        <div class="text-center">
        	<a href="<?php bloginfo( 'template_url' ); ?>/success-story/" class="btn">More </a>
        </div>
    </div>
</section>
<!-- /Latest-Blog -->
 
	
<?php get_sidebar(); ?>
<?php get_footer(); ?>
