<?php

global $post;
$id = get_the_ID();


$options = get_option('upg_settings');


if(isset($options['editor']) && $options['editor']=='1' )
	$editor=true;
else
	$editor=false;	


$title='';

$abc="";
ob_start ();
if (isset($_POST['user-submitted-title'], $_POST['upg-nonce']) && !empty($_POST['user-submitted-title']) && wp_verify_nonce($_POST['upg-nonce'], 'upg-nonce')) 
$title=sanitize_text_field($_POST['user-submitted-title']);

	if($title=='')
{

// Form not submitted yet
}
else
{
		$author = ''; $url = ''; $email = ''; $tags = ''; $captcha = ''; $verify = ''; $content = ''; $category = '';
	
		$files = array();
		if (isset($_FILES['user-submitted-image']))
		{
			$files = $_FILES['user-submitted-image'];
		
		}
		
		
		
		if (isset($_POST['user-submitted-content']))  $content  = upg_sanitize_content($_POST['user-submitted-content']);
		if (isset($_POST['cat'])) $category = intval($_POST['cat']);
		
		
		
		$result = upg_submit_subimage($title, $files, $content, $category);
		
		$post_id = false; 
		if (isset($result['id'])) $post_id = $result['id'];
		
		$error = false;
		if (isset($result['error'])) $error = array_filter(array_unique($result['error']));
		
		 if ($post_id) 
		{
			$post   = get_post( $post_id );
			
			
			do_action( "upg_submit_complete");
			
						
			if(isset($options['publish_sub']) && $options['publish_sub']=='1' )
			{
				echo "<div class='odude_success'>";
				echo __('Image Posted Successfully','wp-upg');
				echo "</div>";
				
			}
			else
			{
				echo "<div class='odude_warning'>";
				echo __('Image Posted but under review. Administrator will review your image before it is displayed.','wp-upg');
				echo "</div>";
			}
		}
		else
		{
			if ($error) 
			{
				$e = implode(',', $error);
				$e = trim($e, ',');
			} 
			else 
			{
				$e = 'error';
			}
			
			echo "<h1>$e</h1>";
		} 
		

}
?>
<form class="pure-form pure-form-stacked" method="post" enctype="multipart/form-data" action="">
<fieldset>
        <div class="pure-control-group">
            <label for="name"><?php _e('Picture Title', 'wp-upg'); ?></label>
            <input class="pure-input-1 pure-input-rounded" id="name" name="user-submitted-title" type="text" value="" placeholder="<?php _e('Post Title', 'wp-upg'); ?>" required>
        </div>

           
           
		   
		   <?php 
		   if($options['sub_show_formshow_desp']=='1')
			{
		   
		   if ($editor) 
		   { ?>
				<div class="pure-controls">
					<div class="usp_text-editor">
			<?php $settings = array(
				    'wpautop'          => true,  // enable rich text editor
				    'media_buttons'    => false,  // enable add media button
				    'textarea_name'    => 'user-submitted-content', // name
				    'textarea_rows'    => '10',  // number of textarea rows
				    'tabindex'         => '',    // tabindex
				    'editor_css'       => '',    // extra CSS
				    'editor_class'     => 'usp-rich-textarea', // class
				    'teeny'            => false, // output minimal editor config
				    'dfw'              => false, // replace fullscreen with DFW
				    'tinymce'          => true,  // enable TinyMCE
				    'quicktags'        => true,  // enable quicktags
				    'drag_drop_upload' => true, // enable drag-drop
				);
				wp_editor('', 'upgcontent', apply_filters('upg_editor_settings', $settings)); ?>
				
				</div>
			</div>
			<?php 
			} 
			else 
			{ 
		?>
		  <div class="pure-control-group">
				 <label for="desp"><?php _e('Picture Description', 'wp-upg'); ?></label>
			
			<textarea class="pure-input-1 pure-input-rounded" id="desp"  name="user-submitted-content" rows="5" placeholder="<?php _e('Post Content', 'usp'); ?>" required></textarea>
			  </div>
			<?php 
			} 
			}
			else
			{
				echo "<input type='hidden' name='user-submitted-content' value='No Information'> ";
			}
			
			?>
		   
		   
      
		
		<div class="pure-control-group">
            <label for="file"><?php _e('Select Image', 'wp-upg'); ?></label>
          <input class="pure-input-1 pure-input-rounded" id="file" name="user-submitted-image[]" type="file" size="25" required>
		  <ul>
		  <li>Only Images are allowed.</li>
		  <li>Maximum upload file size limit to <b><?php //echo ini_get('post_max_size'); ?> <?php echo size_format( wp_max_upload_size() ); ?></b></li>
		  </ul>
        </div>
		
		<input type="hidden" name="cat" value="<?php echo $id; ?>">
			<?php
		do_action( "upg_youtube_submit_form");
		?>
		
		 <div class="pure-controls">
			<button type="submit" name="SN" class="pure-button pure-button-primary"><i class="fa fa-upload fa-lg"></i> <?php esc_html_e( 'Post Image', 'odude-card' ); ?></button>
			<?php wp_nonce_field('upg-nonce', 'upg-nonce', false); ?>
		</div>
</fieldset>
</form>	

<?php
$abc=ob_get_clean (); 
return $abc;

?>