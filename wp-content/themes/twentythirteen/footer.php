<?php
/**
 * The template for displaying the footer
 *
 * Contains footer content and the closing of the #main and #page div elements.
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?>

		</div><!-- #main -->
		<footer id="footer" class="secondary-bg">
			<div class="fy-border-pattern cubist-2">
				<svg class="border" width="2560" height="30" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2560 30">
					<defs>
						<pattern id="pattern-cubist-551421518" x="0" y="0" width="1280" height="30" patternUnits="userSpaceOnUse">
							<polygon class="shape" points="1139,8 1059,20 645,0 478,19 267,11 0,21 0,30 1280,30 1280,21"></polygon>
						</pattern>
					</defs>
					<rect x="0" y="0" width="100%" height="30" fill="url(#pattern-cubist-551421518)"></rect>
				</svg>
			</div>
			<div class="container">
				<div class="logo1">
				<?php dynamic_sidebar( 'footer-logo' ); ?>
				</div>
				<div class="footer_nav">
					<?php echo wp_nav_menu( array( 'theme_location' => 'footer-menu', 'menu_class' => '', 'fallback_cb' => false ) ); ?> 
				</div>
 
				   <?php dynamic_sidebar( 'social' ); ?>
					
			</div>

			<div class="footer_bottom">
				<div class="container">
				    <?php dynamic_sidebar( 'copy' ); ?> 
				</div>
			</div>
		</footer>
	</div><!-- #page -->

	<?php wp_footer(); ?>
</body>
</html>