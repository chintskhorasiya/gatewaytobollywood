<?php get_header(); ?>

<!-- Latest-Blog -->
<section id="latest_blog" class="section-padding">
	<div class="container">
	<?php
	 
	if ( have_posts() ) :
		while ( have_posts() ) : the_post(); ?>
	 
	        <article class="post">
	        	<div class="section-header text-center">
		    		<h2><a href="<?php the_permalink() ?>"><?php the_title() ?></a></h2>
		    	</div>
	        	<div class="row"><?php the_content() ?></div>
			</article>
		
		<?php endwhile;
	 
	else :
		echo '<p>There are no content!</p>';
	 
	endif;
	?>
	</div>
</section>

<?php get_footer(); ?>