<?php
function upg_addon_page()
{
	?>
	<div class="wrap">
	<h2>UPG (User Post Gallery) Free & Premium Extensions</h2>
	
<style>
.module {
  background: #eee;
}
.module h2 {
  line-height: 2;
  padding: 0 0 0 10px;
  background: #ccc;
  font-size: 16px;
}
.module h2 a {
  float: right;
  position: relative;
  text-decoration: none;
  color: #333;
  padding: 0 10px;
  border-left: 5px solid white;
  transition: padding 0.1s linear;
}
.module h2 a:hover, .module h2 a:focus {
  padding: 0 21px 0 14px;
}
.module h2 a:active {
  padding: 0 16px;
}
.module h2 a:before, .module h2 a:after {
  content: "";
  position: absolute;
  top: 50%;
  width: 0;
  height: 0;
}
.module h2 a:before {
  left: -12px;
  border-top: 8px solid transparent;
  border-bottom: 8px solid transparent;
  border-right: 8px solid white;
  margin-top: -8px;
}

.blue h2 a {
  background: #a2d6eb;
}
.blue h2 a:hover {
  background: #c5f0ff;
}
.blue h2 a:after {
  left: -5px;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
  border-right: 6px solid #a2d6eb;
  margin-top: -6px;
}
.blue h2 a:hover:after, .blue h2 a:focus:after {
  border-right-color: #c5f0ff;
}

.red h2 a {
  background: #f0a5b5;
}
.red h2 a:hover {
  background: #ffc7d2;
}
.red h2 a:after {
  left: -5px;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
  border-right: 6px solid #f0a5b5;
  margin-top: -6px;
}
.red h2 a:hover:after, .red h2 a:focus:after {
  border-right-color: #ffc7d2;
}

.green h2 a {
  background: #9cf1a4;
}
.green h2 a:hover {
  background: #bbffcf;
}
.green h2 a:after {
  left: -5px;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
  border-right: 6px solid #9cf1a4;
  margin-top: -6px;
}
.green h2 a:hover:after, .green h2 a:focus:after {
  border-right-color: #bbffcf;
}

.module {
  width: 600px;
  margin: 0 0 20px 0;
}
.module .cnt {
  padding: 0 10px 10px 10px;
}
.module ul {
  margin-left: 10px;
  padding-left: 10px;
}

</style>

<div class="module blue">
  <h2>WP-PageNavi <a href="<?php echo admin_url("plugin-install.php?tab=plugin-information&plugin=wp-pagenavi"); ?>">FREE</a></h2>
  <div class="cnt">
    <p>Page navigation for Image or Youtube Gallery. It is displayed if the number of images per-page is exceeded. 
	<br> <br>
	<img src="https://ps.w.org/wp-pagenavi/assets/screenshot-1.png?rev=1206758" width="500">
	<br><br>
	<a href="<?php echo admin_url("plugin-install.php?tab=plugin-information&plugin=wp-pagenavi"); ?>" target="_blank" class="install-now button">View Details</a></p>
  </div>
</div>
<hr>
<div class="module red">
  <h2>Captcha security <a href="http://odude.com/product/wp-upg-pro/">Commercial</a></h2>
  <div class="cnt">
  <p>
  
    Captcha: <b>Google reCaptcha V2 </b> so that spammers need to pass security check before posting images & Videos to wp-upg plugins. 
	<br> <br>
	<img src="http://odude.com/wp-content/uploads/2017/04/wp-upg-pro-captcha-300x274.png" width="300">
	
	<br><br>
	<a href="http://odude.com/product/wp-upg-pro/" target="_blank" class="install-now button">View Details</a></p>
  </div>
</div>
<hr>
<div class="module red">
  <h2>Email notification <a href="http://odude.com/product/wp-upg-pro/">Commercial</a></h2>
  <div class="cnt">
  <p>
  Enables Email notification when image/youtube video is uploaded
 
<br>
		<img src="http://odude.com/wp-content/uploads/2017/04/email_notify.png" width="400">
	<br><br>
	<a href="http://odude.com/product/wp-upg-pro/" target="_blank" class="install-now button">View Details</a></p>
  </div>
</div>
<hr>
<div class="module green">
  <h2>Page Restrict <a href="<?php echo admin_url("plugin-install.php?tab=plugin-information&plugin=pagerestrict"); ?>">FREE</a></h2>
  <div class="cnt">
    <p><b>Restrict certain pages or posts to logged in users.</b>
	<br><ul>
	<li>
	* Stop unknown, unregistered users from posting images from your frontend.</li>
	<li>* Restrict your gallery page to be shown only for logged-in users.</li>
	</ul>
	<br>
	
	<br><br>
	<a href="<?php echo admin_url("plugin-install.php?tab=plugin-information&plugin=pagerestrict"); ?>" target="_blank" class="install-now button">View Details</a></p>
  </div>
</div>

	
	
	
	
	
	</div>
	
	<?php
}
?>