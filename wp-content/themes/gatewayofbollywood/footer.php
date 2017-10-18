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
		<div class="logo1"><img src="<?php echo get_template_directory_uri() ?>/images/logo.png"/></div>
		<div class="footer_nav">
			<?php echo wp_nav_menu( array( 'theme_location' => 'footer-menu', 'menu_class' => '', 'fallback_cb' => false ) ); ?>
			<ul style="display: none;">
            	<li><a href="#">About Us</a> </li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">T&C</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Help</a></li>
				<li><a href="#" style="border-right: 0px;">Contact Us</a></li>
			</ul>
		</div>
		<div class="follow_us">
        	<ul>
            	<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="footer_bottom">
    	<div class="container">
        	<p>Copyright &copy; 2017 Gateway to Bollywood. All Rights Reserved | Design & Developed By<a href="http://www.seawindsolution.com/"> Seawind Solution Pvt. Ltd.</a></p>
        </div>
    </div>
</footer>
<!-- /Footer -->

<?php wp_footer() ?>
</body>
</html>