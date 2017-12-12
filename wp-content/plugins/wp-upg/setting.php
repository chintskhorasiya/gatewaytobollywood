<?php
function upg_add_admin_menu(  ) 
{ 

	add_submenu_page( 'edit.php?post_type=upg', 'User Post Gallery Settings', 'UPG Settings', 'manage_options', 'wp_upg', 'upg_options_page' );
	add_submenu_page( 'edit.php?post_type=upg', 'Edit UPG Layouts', 'Layout Editor', 'manage_options', 'wp_upg_layout', 'upg_layout_page' );
	add_submenu_page( 'edit.php?post_type=upg', 'User Post Gallery Help', 'Help / Feedback', 'manage_options', 'wp_upg_help', 'upg_help_page' );
	add_submenu_page( 'edit.php?post_type=upg', 'FREE and Premium plugins', 'UPG Addon', 'manage_options', 'wp_upg_addon', 'upg_addon_page' );
}


function upg_settings_init(  ) 
{ 
	
	
	//Basic Setting
	register_setting( 'ImageSettingPage', 'upg_settings' );
	

	add_settings_section(
		'upg_ImageSettingPage_section', 
		__( 'Settings', 'wp-upg' ), 
		'upg_settings_section_callback', 
		'ImageSettingPage'
	);
	add_settings_field( 
		'upg_select_pickup_field', 
		__( 'IMP Settings', 'wp-upg' ), 
		'upg_free_settings', 
		'ImageSettingPage', 
		'upg_ImageSettingPage_section' 
	);

	
	
	//End Basic Setting
	

	
	//Add Primary Images Settings
	register_setting( 'primary_images_setting_page', 'upg_settings' );
	add_settings_section(
		'upg_primary_image_section', 
		__( 'Primary Images', 'wp-upg' ), 
		'upg_primary_image_section_callback', 
		'primary_images_setting_page'
	);

		add_settings_field( 
		'upg_primary_quick_field', 
		__( 'Quick Settings', 'wp-upg' ), 
		'upg_primary_free_settings', 
		'primary_images_setting_page', 
		'upg_primary_image_section' 
	);
	
	add_settings_field( 
		'upg_primary_extra_field', 
		__( 'Custom Extra Fields', 'wp-upg' ), 
		'upg_primary_custom_field_settings', 
		'primary_images_setting_page', 
		'upg_primary_image_section' 
	);
	
	add_settings_field( 
		'upg_primary_global_field', 
		__( 'Global Settings', 'wp-upg' ), 
		'upg_primary_global_settings', 
		'primary_images_setting_page', 
		'upg_primary_image_section' 
	);
	
		
	
	
	

	
	//3rd Party Shortcode
	register_setting( 'ImageSetting_shortcode_Page', 'upg_settings' );
	
		add_settings_section(
		'upg_ImageSettingPage_shortcode_section', 
		__( '3rd Party Shortcode', 'wp-upg' ), 
		'upg_settings_section_shortcode_callback', 
		'ImageSetting_shortcode_Page'
	);
	
	 add_settings_field( 
		'upg_textarea_shortcode_1', 
		__( 'Shortcode for Position 1st', 'wp-upg' ), 
		'upg_textarea_shortcode_1_render', 
		'ImageSetting_shortcode_Page', 
		'upg_ImageSettingPage_shortcode_section' 
	); 
	 add_settings_field( 
		'upg_textarea_shortcode_2', 
		__( 'Shortcode for Position 2nd', 'wp-upg' ), 
		'upg_textarea_shortcode_2_render', 
		'ImageSetting_shortcode_Page', 
		'upg_ImageSettingPage_shortcode_section' 
	); 
	/* add_settings_field( 
		'upg_select_pick_layout', 
		__( 'Select Layout', 'wp-upg' ), 
		'upg_select_pick_layout_render', 
		'ImageSettingPage', 
		'upg_ImageSettingPage_section' 
	); */
	


}



 function upg_textarea_shortcode_1_render(  ) 
{ 

	$options = get_option( 'upg_settings' );
	if(isset($options['upg_textarea_shortcode_1']))
		$output=$options['upg_textarea_shortcode_1'];
		else
		$output="";
	?>
	<textarea cols='60' rows='3' name='upg_settings[upg_textarea_shortcode_1]'><?php echo $output; ?></textarea>
	<?php

} 
 function upg_textarea_shortcode_2_render(  ) 
{ 

	$options = get_option( 'upg_settings' );
	if(isset($options['upg_textarea_shortcode_2']))
		$output=$options['upg_textarea_shortcode_2'];
		else
		$output="";
	?>
	<textarea cols='60' rows='3' name='upg_settings[upg_textarea_shortcode_2]'><?php echo $output; ?></textarea>
	<?php

} 
function upg_settings_section_shortcode_callback(  ) 
{ 

	echo __( 'You can include any other plugin shortcode or message. Eg. social share, buttons, notices<br><br><b>Position 1st</b> = Just above the image preview<br><b>Position 2nd</b>=Just below the image preview.<br>', 'wp-upg' );
	
	
}



 function upg_primary_free_settings()
 {
	 $options = get_option('upg_settings');
		if(!isset($options['publish']))
		$options['publish']="0";
	
	?>
	<b>Publish [Primary Image] as soon as user upload/post:</b> <input type="checkbox" name='upg_settings[publish]' value='1' <?php if($options['publish']=='1') echo 'checked="checked"'; ?> >
	<br><br>
	
	
	
	<b>Display Picture Description input field at post form of Primary-Image Gallery :</b> <input type="checkbox" name='upg_settings[primary_show_formshow_desp]' value='1' <?php if($options['primary_show_formshow_desp']=='1') echo 'checked="checked"'; ?> >
	<br><br>
	<?php
	 
 }
 
 function upg_free_settings() 
 {
$options = get_option('upg_settings');


	if(!isset($options['guest_user']))
		$options['guest_user']="";
	
	if(!isset($options['editor']))
		$options['editor']="0";
	
	
	if(!isset($options['archive']))
		$options['archive']="0";
	
	
	?>
	
	<b>Assign user for unregistered or not logged in users: </b><?php upg_droplist_user($options['guest_user']); ?> <br>It's better to <a href="<?php echo admin_url( 'user-new.php' );?>">create GUEST USER</a> with minimum access.
	<br><br>
	
	<b>Enable GUI Editor (Bold,Italic,color) for Visitor:</b> <input type="checkbox" name='upg_settings[editor]' value='1' <?php if($options['editor']=='1') echo 'checked="checked"'; ?> >
	<br><br>
	
	<img src="<?php echo upg_PLUGIN_URL.'/images/new.png'; ?>"> <b>Include UPG post into archive page:</b> <input type="checkbox" name='upg_settings[archive]' value='1' <?php if($options['archive']=='1') echo 'checked="checked"'; ?> >
	<br>
	<br>
	
	
	<?php
	if(!isset($options['main_page']))
		$options['main_page']="";

	echo "<b>Select USER PHOTO GALLERY main <a href='".admin_url( 'edit.php?post_type=page' )."'>page</a>. It is used for SEO.</b>: ";
    wp_dropdown_pages(
        array(
             'name' => 'upg_settings[main_page]',
             'echo' => 1,
             //'show_option_none' => __( '&mdash; Select &mdash;' ),
             //'option_none_value' => '0',
             'selected' => $options['main_page']
			 
        )
    );
	echo "<br>Page cannot be static front page.";
	
	
	

	
	
}
function upg_primary_custom_field_settings()
{
	$options = get_option('upg_settings');
	?>
	Note: Custom Extra Fields values are not displayed at frontend. To display at frontend use [personal layout] and add fields from [UPG layout] file editor. 
	<table class="pure-table pure-table-horizontal">
    <thead>
        <tr>
            <th>Type</th>
            <th>Internal Field Name</th>
            <th>Label Field Name</th>
            <th>Display Back end</th>
			<th>Display Front end</th>
        </tr>
    </thead>

    <tbody>
	<?php
	for ($x = 1; $x <= 5; $x++) 
	{
	?>
        <tr>
            <td>
			<select name='upg_settings[upg_custom_field_type_<?php echo $x; ?>]'>
			  <option value="222" <?php if($options['upg_custom_field_type_'.$x]=='text') echo 'selected'; ?>>Text</option>
			  <option value="checkbox" <?php if($options['upg_custom_field_type_'.$x]=='checkbox') echo 'selected'; ?>>Checkbox</option>
			</select>
			
					
			</td>
            <td>upg_custom_field_<?php echo $x; ?></td>
            
			<td><input type="text" name='upg_settings[upg_custom_field_<?php echo $x; ?>]' value='<?php echo $options['upg_custom_field_'.$x]; ?>' maxlength="20" size="20" ></td>
            
			<td><input type="checkbox" name='upg_settings[upg_custom_field_<?php echo $x; ?>_show]' value='on' <?php if($options['upg_custom_field_'.$x.'_show']=='on') echo 'checked="checked"'; ?> ></td>
			
			 <td><input type="checkbox" name='upg_settings[upg_custom_field_<?php echo $x; ?>_show_front]' value='on' <?php if($options['upg_custom_field_'.$x.'_show_front']=='on') echo 'checked="checked"'; ?> ></td>
        </tr>
	<?php
	}
?> 
    </tbody>
</table>
	<?php
	
	
}


 function upg_primary_global_settings() 
 {
	$options = get_option('upg_settings');
	
		
	?><hr>
	<b>Number of images per row :</b> <input type="text" name='upg_settings[global_perrow]' value='<?php echo $options['global_perrow']; ?>' maxlength="2" size="5" ><br><br>
	
	<b>Number of images per page :</b> <input type="text" name='upg_settings[global_perpage]' value='<?php echo $options['global_perpage']; ?>' maxlength="3" size="5" ><br><br>
	
	<b>Order/Sort By :</b>
	
	<select name="upg_settings[global_order]" id="upg_settings[global_order]">
	<option value="date" <?php if($options['global_order']=="date") echo 'selected="selected"'; ?>>Posted Date</option>
	<option value="modified" <?php if($options['global_order']=="modified") echo 'selected="selected"'; ?>>Modified Date</option>
	<option value="title" <?php if($options['global_order']=="title") echo 'selected="selected"'; ?>>Title</option>
	<option value="rand" <?php if($options['global_order']=="rand") echo 'selected="selected"'; ?>>Random</option>
	<option value="ID" <?php if($options['global_order']=="ID") echo 'selected="selected"'; ?>>Post ID</option>
</select><br><br>
	
	<b>Enable Page Navigation :</b> <input type="checkbox" name='upg_settings[global_page]' value='on' <?php if($options['global_page']=='on') echo 'checked="checked"'; ?> ><br><br>
	
		<b>Enable Lightbox Popup :</b> <input type="checkbox" name='upg_settings[global_popup]' value='on' <?php if($options['global_popup']=='on') echo 'checked="checked"'; ?> ><br><br>
	
	<b>Gallery Grid Layout Name :</b><br>

<?php echo upg_grid_layout_list($options['global_layout'],"upg_settings[global_layout]"); ?>
<br>

<b>Show images from Album Names: </b> 
<?php 
wp_dropdown_categories( 'show_count=1&hierarchical=1&taxonomy=upg_cate&value_field=slug&name=upg_settings[global_album]&selected='.$options['global_album'].'&hide_empty=0&show_option_none=All Categories&option_none_value=' );
 ?>

	<hr>
	<u><b>Shortcode generated with above configuration to display Primary-Image Gallery</b></u><br><br>
	[upg-list 
	perrow="<?php echo $options['global_perrow']; ?>" 
	perpage="<?php echo $options['global_perpage']; ?>" 
	orderby="<?php echo $options['global_order']; ?>" 
	page="<?php echo $options['global_page']; ?>" 
	layout="<?php echo $options['global_layout']; ?>" 
	popup="<?php echo $options['global_popup']; ?>"
	album="<?php echo $options['global_album']; ?>" ]
	
	<br><br><b>OR</b><br><br>
	Global settings will only be applied to below shortcode with only missing parameters.<br>
	<br>
	[upg-list]<br>
	[upg-list album="<?php echo $options['global_album']; ?>"]<br>
	[upg-list popup="on"]<br>
	<hr>
	<img src="<?php echo upg_PLUGIN_URL.'/images/new.png'; ?>"> <b>To display signle UPG post by ID</b><br>
	[upg-pick id='00' notice='SALE']<br>
	layout & popup parameters are supported for upg-pick
	
	
	<?php
	
}


function upg_settings_section_callback(  ) 
{ 

	//echo __( 'Update or modify required settings.', 'upg' );
	/**
 * Detect plugin. For use on Front End only.
 */
 //include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
	
	
}

function upg_primary_image_section_callback(  ) 
{ 

echo __( 'Primary Images are listed as post at UPG.', 'wp-upg' );

	
	
}





function upg_options_page(  ) 
{ 

/**
 * Detect plugin. For use on Front End only.
 */
 //include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
	$proactive=false;
 
	if ( is_plugin_active( 'wp-upg-pro/odude-ecard-pro.php' ) ) 
	{
		 $proactive=true;
	} 
	
	$propassive="This features under development.";




	?>
	
	<script>
jQuery(document).ready(function($){
       $("#tabs").tabs();
});
  </script>
  
<div class="wrap">
	



	<form action='options.php' method='post'>
		
		<h2>User Photo Gallery</h2>
		<div id="tabs">
	<ul>
		
        <li><a href="#tab-1"><?php echo __("Global Settings","wp-upg");?></a></li>
       
		
		<li><a href="#tab-3"><?php echo __("UPG-Post Gallery","wp-upg");?></a></li> 
		
		
		<li><a href="#tab-2"><?php echo __("Other's Plugin Shortcode","wp-upg");?></a></li> 
		<?php
		do_action( "upg_setting_tab_title" , $upg_tab_title_id="", $upg_tab_title_label="" );
		?>
				
	</ul>
	 <div id="tab-1">
     <?php
	 settings_fields( 'ImageSettingPage' );
	do_settings_sections( 'ImageSettingPage' );
	 ?>
    </div>
   
	 <div id="tab-2">
      <?php
	  
	  settings_fields( 'ImageSetting_shortcode_Page' );
	  do_settings_sections( 'ImageSetting_shortcode_Page' );
	  
	  ?>
    </div>
		 <div id="tab-3">
      <?php
	  
	  settings_fields( 'primary_images_setting_page' );
	  do_settings_sections( 'primary_images_setting_page' );
	  
	  ?>
    </div>
	
	<?php
		do_action( "upg_setting_tab_body" , $upg_tab_title_id="");
		?>
	
	</div>
		
		<?php
		flush_rewrite_rules();
		submit_button();
		?>
		
	</form>
</div>
	<?php

}
?>