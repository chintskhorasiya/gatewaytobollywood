<?php get_header(); ?>

<!--<h1>Custom Theme!</h1>

<?php
 
if ( have_posts() ) :
	while ( have_posts() ) : the_post(); ?>
 
        <article class="post">
        	<h2><a href="<?php the_permalink() ?>"><?php the_title() ?></a></h2>
			<?php the_content() ?>
		</article>
	
	<?php endwhile;
 
else :
	echo '<p>There are no posts!</p>';
 
endif;
?>

-->

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
<!-- Category-Slider -->
<section id="all_category" class="gray_bg">
	<div class="container">
    	<div id="category_slider">
			<h2> Talent Category</h2>
    		<div class="owl-carousel owl-theme">
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
            </div>
        </div>        
    </div>
</section>
<!-- /Category-Slider -->

<!-- Popular-Cities/Towns -->
<section id="popular_cities" class="section-padding">
	<div class="container">
		<div class="section-header text-center">
			<h2>Trending Jobs & Auditions</h2>
		</div>
        <div class="row">
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
        </div>
        <div class="text-center">
        	<a href="http://projects.seawindsolution.com/five/gatewaytobollywood/trending-jobs-auditions/" class="btn">View More </a>
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
            	<div class="item">
					<img src="<?php echo get_template_directory_uri() ?>/images/photo.jpg"/>
            		<div class="testimonial_header">
	            		<h5>"Life hits you hard.<br>But it takes you three seconds to decide<br>If you are a superhero or not. I am."</h5>
	            	</div> 
				</div>
                <div class="item">
					<img src="<?php echo get_template_directory_uri() ?>/images/photo.jpg"/>
                	<div class="testimonial_header">
                		<h5>"Life hits you hard.<br>But it takes you three seconds to decide<br>
If you are a superhero or not. I am."</h5>
                    </div>
				</div>
            </div>
        </div>
    </div>
	<div class="dark-overlay"></div>
</section>
<!-- /Testimonials -->

<!-- Latest-Blog -->
<section id="latest_blog" class="section-padding">
	<div class="container">
    	<div class="section-header text-center">
    		<h2>Success Stories</h2>
    	</div>
        <div class="row">
        	<div class="col-md-3">
            	<div class="post_wrap">
                	<div class="post_img">
                    	<a href="#"><img src="<?php echo get_template_directory_uri() ?>/images/s2.jpg" alt="image"></a>
                    </div>
                    <div class="post_info">
                    	<h4><a href="#">"Life hits you hard.<br>But it takes you three seconds to decide<br>
If you are a superhero or not. I am."</a></h4>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
            	<div class="post_wrap">
                	<div class="post_img">
                    	<a href="#"><img src="<?php echo get_template_directory_uri() ?>/images/s3.jpg" alt="image"></a>
                    </div>
                    <div class="post_info">
                    	<h4><a href="#">T"Life hits you hard.<br>
But it takes you three seconds to decide<br>
If you are a superhero or not. I am."</a></h4>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
            	<div class="post_wrap">
                	<div class="post_img">
                    	<a href="#"><img src="<?php echo get_template_directory_uri() ?>/images/s1.jpg" alt="image"></a>
                    </div>
                    <div class="post_info">
                    	<h4><a href="#">"Life hits you hard.<br>But it takes you three seconds to decide<br>If you are a superhero or not. I am."</a></h4>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
            	<div class="post_wrap">
                	<div class="post_img">
                    	<a href="#"><img src="<?php echo get_template_directory_uri() ?>/images/s4.jpg" alt="image"></a>
                    </div>
                    <div class="post_info">
                    	<h4><a href="#">"Life hits you hard.<br>But it takes you three seconds to decide<br>If you are a superhero or not. I am."</a></h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center">
        	<a href="#" class="btn">Read More </a>
        </div>
    </div>
</section>
<!-- /Latest-Blog -->


<?php get_footer(); ?>
