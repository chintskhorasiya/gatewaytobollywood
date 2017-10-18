<?php
function upg_layout_page()
{
	$upload_dir = wp_upload_dir();
	$user_dirname = $upload_dir['basedir'].'/upg_media_personal.php';
	
	$filename=dirname(__FILE__)."/media/personal/content.php";
	
	if(isset($_POST['newcontent']))
	{
		echo "<h2>File Updated Successfully</h2>";
		if ( is_writeable($filename) ) 
		{
			//Save inside plugin path
		$file = fopen($filename,"w+");
		fwrite($file, wp_unslash($_POST['newcontent']));
		
		//save inside upload path
		$file = fopen($user_dirname,"w+");
		fwrite($file, wp_unslash($_POST['newcontent']));
		
		}
		else
		{
			echo "<h2>File is not writeable</h2>";
		}
	}
	
		
	//IF file not exist
    if( ! file_exists( $user_dirname ) )
	{
		
		$sample_filename=dirname(__FILE__)."/media/personal/sample.txt";
		$sample_content =  file_get_contents($sample_filename);
		
		$file = fopen($user_dirname,"w+");
		fwrite($file, $sample_content);
	}
	

	
	
	//$content =  file_get_contents($filename);
	$content =  file_get_contents($user_dirname);
	
		
	
	?>
<div class="wrap">
	<h2>[Personal Layout] Editor</h2>
	This is your personal Layout which is designed only for you. <br>
	The codes typed here will be directly saved into personal layout file. <br>
	<br>
		<script>
jQuery(document).ready(function($){
       $("#tabs").tabs();
});
  </script>
  	<div id="tabs">
	<ul>
		
        <li><a href="#tab-1"><?php echo __("UPG Post Preview Layout","wp-upg");?></a></li>
		
		<li><a href="#tab-2"><?php echo __("UPG Post Thumbnail Grid Layout","wp-upg");?></a></li>
		
		<li><a href="#tab-3">
		<img src="<?php echo upg_PLUGIN_URL.'/images/new.png'; ?>"> 
		<?php echo __("UPG Post Pick Layout","wp-upg");?></a></li>
		
       </ul>
	 <div id="tab-1">
	 
	 
	
	<br>
	<b>Image Preview Layout: </b> Personal Layout (\layout\media\personal\content.php)<br>
	

	<br>
	This layout is used when layout is set as [personal layout] for individual image.
	
	<br>
	<form class="pure-form" method="post" action="">
	<table border='1' width='99%'>
	<tr><td>
	<textarea cols="90" rows="20" name="newcontent" id="newcontent" style="background-color:#eeeeee ;"><?php echo $content; ?></textarea>
	<br>
	<a href="<?php echo plugins_url( '/wp-upg/layout/media/personal/sample.txt'); ?>" target="_blank">Get sample code</a>
	</td>
	<td valign='top'>
	<b>Below are the php variables/fields you can use between PHP tag.</b><hr>
	<b>$image</b> = URL of the large image<br>
	<b>$text </b>= Description of image <br>
	<br>
	<b>upg_get_value('upg_custom_field_2')</b> = <br>Get value saved for extra custom fields inside primary-image gallery.<br> 
	Syntax : echo upg_get_value('Internal field name');
	<br>
	<br>
	<b>$author->user_nicename</b> = Author's Nice name. $author is array.
	<b>upg_author($author)</b> = Author image icon/avatar <br>
	<br>
	<b>upg_isVideo($post)</b> = Check if media is video or image (true/false)<br>


	<b>upg_position1()</b> = Shortcode area for Position 1st<br>
	<b>upg_position2()</b> = Shortcode area for Position 2nd<br>
	
	<hr>
	<b>Tips</b>:
	<br>
	* You can copy paste css code for your own style between style tag.<br>
	* You can use UPG built in grid system https://purecss.io/ <br>
	* For better css style http://fontawesome.io/ is included by default. <br>
	* Even after plugin update, your changes will not be lost.
	
	
	
	</td></tr></table>
	<br>
	<input type="submit" name="submit" id="submit" class="button button-primary" value="Update Personal Post Preview File">
	</form>
	</div>
	
	<?php
	
	$upload_dir = wp_upload_dir();
	$user_dirname_up = $upload_dir['basedir'].'/upg_grid_personal_up.php';
	$user_dirname_down = $upload_dir['basedir'].'/upg_grid_personal_down.php';
	$user_dirname_main = $upload_dir['basedir'].'/upg_grid_personal_main.php';
	
	$file_personal_up=dirname(__FILE__)."/grid/personal/personal_up.php";
	$file_personal_down=dirname(__FILE__)."/grid/personal/personal_down.php";
	$file_personal_main=dirname(__FILE__)."/grid/personal/personal.php";
	
	if(isset($_POST['personal_up']))
	{
		echo "<h2>File Updated Successfully</h2>";
		
		if ( is_writeable($file_personal_up) ) 
		{
		$file = fopen($file_personal_up,"w+");
		fwrite($file, wp_unslash($_POST['personal_up']));
		
		//save inside upload path
		$file = fopen($user_dirname_up,"w+");
		fwrite($file, wp_unslash($_POST['personal_up']));
		
		}
		else
		{
			echo "<h2>personal_up.php is not writeable</h2>";
		}
		
		if ( is_writeable($file_personal_down) ) 
		{
		$file = fopen($file_personal_down,"w+");
		fwrite($file, wp_unslash($_POST['personal_down']));
		
		//save inside upload path
		$file = fopen($user_dirname_down,"w+");
		fwrite($file, wp_unslash($_POST['personal_down']));
		
		}
		else
		{
			echo "<h2>personal_down.php is not writeable</h2>";
		}
		
		if ( is_writeable($file_personal_main) ) 
		{
		$file = fopen($file_personal_main,"w+");
		fwrite($file, wp_unslash($_POST['personal_main']));
		
		//save inside upload path
		$file = fopen($user_dirname_main,"w+");
		fwrite($file, wp_unslash($_POST['personal_main']));
		
		}
		else
		{
			echo "<h2>personal.php is not writeable</h2>";
		}
	}
	
	//IF file not exist
    if( ! file_exists( $user_dirname_main ) )
	{
		
		$sample_filename=dirname(__FILE__)."/grid/personal/personal.txt";
		$sample_content =  file_get_contents($sample_filename);
		$file = fopen($user_dirname_main,"w+");
		fwrite($file, $sample_content);
		
		$sample_filename=dirname(__FILE__)."/grid/personal/personal_up.txt";
		$sample_content =  file_get_contents($sample_filename);
		$file = fopen($user_dirname_up,"w+");
		fwrite($file, $sample_content);
		
		$sample_filename=dirname(__FILE__)."/grid/personal/personal_down.txt";
		$sample_content =  file_get_contents($sample_filename);
		$file = fopen($user_dirname_down,"w+");
		fwrite($file, $sample_content);
	}
	
	
	$content_up =  file_get_contents($user_dirname_up);
	$content_down =  file_get_contents($user_dirname_down);
	$content_main =  file_get_contents($user_dirname_main);
	?>
	
	
	 <div id="tab-2">
	
	<br>
	<b>Gallery Grid Layout Name: Personal Layout </b> <br>
	Shortcode: [upg-list]
	
	<br>
	<form class="pure-form" method="post" action="">
	<table border='1' width='99%'>
	<tr><td>
	<b>Personal Layout Header</b>(\layout\grid\personal\personal_up.php)<br>
	It is used as a grid's container starting code. <br>
	Style tag can be included here.
	<textarea cols="90" rows="5" name="personal_up" id="personal_up" style="background-color:#ffefbf;"><?php echo $content_up; ?></textarea>
	<br>
	<a href="<?php echo plugins_url( '/wp-upg/layout/grid/personal/personal_up.txt'); ?>" target="_blank">Get sample code</a>
	<hr>
	<b>Personal Layout Main</b>(\layout\grid\personal\personal.php)<br>
	It is used as a thumbnail body which is repeated inside loop.
	<textarea cols="90" rows="10" name="personal_main" id="personal_main" style="background-color:#eeeeee ;"><?php echo $content_main; ?></textarea>
	<br>
	<a href="<?php echo plugins_url( '/wp-upg/layout/grid/personal/personal.txt'); ?>" target="_blank">Get sample code</a>
	<hr>
	<b>Personal Layout Footer </b>(\layout\grid\personal\personal_down.php)<br>
	It is used as a grid's container ending code. 
	<textarea cols="90" rows="5" name="personal_down" id="personal_down" style="background-color:#ffffbf;"><?php echo $content_down; ?></textarea>
	<br>
	<a href="<?php echo plugins_url( '/wp-upg/layout/grid/personal/personal_down.txt'); ?>" target="_blank">Get sample code</a>
	<hr>
	
	
	</td>
	<td valign='top'>
	<b>Below are the php variables/fields you can use between PHP tag.</b><hr>
	<b>$image</b> = URL of the thumbnail image<br>
	<b>$preview_large</b> = URL of the large image <br>
	<b>$permalink</b> = URL to the image post content <br>
	<b>$thetitle</b> = Title of the image <br>
	<br>
	<b>$popup </b>= Returns popup is on/off<br>
	<b>$preview_type</b> = Returns preview as image/youtube <br>
	<b>$perrow </b>= Returns number of row to display. Used in loops.<br>
	<b>$album </b>= Returns album slug name<br>
	<br>
	<b>upg_get_value('upg_custom_field_2')</b> = <br>Get value saved for extra custom fields inside primary-image gallery.<br> Syntax : upg_get_value('Internal field name');
	<br>
	
	
	<hr>
	<b>Tips</b>:
	<br>

	* You can use UPG built in grid system https://purecss.io/ <br>
	* For better css style http://fontawesome.io/ is included by default. <br>
	* Even after plugin update, your changes will not be lost.
	
	
	
	</td></tr></table>
	<br>
	<input type="submit" name="submit" id="submit" class="button button-primary" value="Update Personal Grid Layout File">
	</form>
	
	
	
	 </div>
	 
	 <?php
	$upload_dir = wp_upload_dir();
	$user_dirname_pick = $upload_dir['basedir'].'/upg_grid_personal_pick.php';
	
	$file_personal_pick=dirname(__FILE__)."/grid/personal/personal_pick.php";
	if(isset($_POST['personal_pick']))
	{
		echo "<h2>Personal Pick File Updated Successfully</h2>";
		
		
		if ( is_writeable($file_personal_pick) ) 
		{
		$file = fopen($file_personal_pick,"w+");
		fwrite($file, wp_unslash($_POST['personal_pick']));
		
		//save inside upload path
		$file = fopen($user_dirname_pick,"w+");
		fwrite($file, wp_unslash($_POST['personal_pick']));
		
		}
		else
		{
			echo "<h2>personal_pick.php is not writeable</h2>";
		}
		
		
	}
	//IF file not exist
    if( ! file_exists( $user_dirname_pick ) )
	{
		
		$sample_filename=dirname(__FILE__)."/grid/personal/personal_pick.txt";
		$sample_content =  file_get_contents($sample_filename);
		$file = fopen($user_dirname_pick,"w+");
		fwrite($file, $sample_content);
		
		
	}
	
	
	$content_pick =  file_get_contents($user_dirname_pick);
	 
	 ?>
	 
	 
	 
	 <div  id="tab-3" >
	  
	   
	<b>Pick Layout: </b> Personal Layout (\layout\media\personal\personal_pick.php)<br>
	
	<br>
	This layout is used if you want to display selected UPG Post into pages or WP-Posts.
	<br>
	<br>
	Shortcode: Eg.	[upg-pick id='xxx' notice='Your Choice' layout='personal']<br>
	id='xxx' should be replaced by ID of UPG Gallery. Eg. id='11'<br>
	notice='Your Choice' should be replced by a text of your wish. Eg. SALE<br>
	layout='personal' is the layout used.
	
	<br>
	<form class="pure-form" method="post" action="">
	<table border='1' width='99%'>
	<tr><td>
	<textarea cols="90" rows="20" name="personal_pick" id="personal_pick" style="background-color:#eeeeee ;"><?php echo $content_pick; ?></textarea>
	<br>
	<a href="<?php echo plugins_url( '/wp-upg/layout/grid/personal/personal_pick.txt'); ?>" target="_blank">Get sample code</a>
	</td>
	<td valign='top'>
	
	<b>Below are the php variables/fields you can use between PHP tag.</b><hr>
	
	<b>$image</b> = URL of the thumbnail image<br>
	<b>$preview_large</b> = URL of the large image <br>
	<b>$permalink</b> = URL to the image post content <br>
	<b>$thetitle</b> = Title of the image <br>
	<br>
	<b>$popup </b>= Returns popup is on/off<br>
	<b>$preview_type</b> = Returns preview as image/youtube <br>
	
	
	<br>
	
	
	
	<hr>
	<b>Tips</b>:
	<br>

	* You can use UPG built in grid system https://purecss.io/ <br>
	* For better css style http://fontawesome.io/ is included by default. <br>
	* Even after plugin update, your changes will not be lost.
	
	</td></tr></table>
	<br>
	<input type="submit" name="submit" id="submit" class="button button-primary" value="Update Personal Pick Layout File">
	</form>
	  
	  
	  
	  
	 </div>
	
	</div>
	 </div>
<?php
}
?>