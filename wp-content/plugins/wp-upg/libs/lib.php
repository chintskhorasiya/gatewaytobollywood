<?php
//Update Personal layout files
function upg_update_personal_layout()
{
	$upload_dir = wp_upload_dir();
	$user_dirname_up = $upload_dir['basedir'].'/upg_grid_personal_up.php';
	$user_dirname_down = $upload_dir['basedir'].'/upg_grid_personal_down.php';
	$user_dirname_main = $upload_dir['basedir'].'/upg_grid_personal_main.php';
	$user_dirname_pick = $upload_dir['basedir'].'/upg_grid_personal_pick.php';
	
	$file_personal_pick=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal_pick.php";
	$file_personal_up=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal_up.php";
	$file_personal_down=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal_down.php";
	$file_personal_main=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal.php";
	
	//IF file not exist
	if( ! file_exists( $file_personal_up ) )
	{
		if( file_exists( $user_dirname_up ) )
		{
			//copy files from upload folder
			if (!copy($user_dirname_up, $file_personal_up)) 
			{
				echo "failed to copy $user_dirname_up...\n";
			}
			//copy files from upload folder
			if (!copy($user_dirname_down, $file_personal_down)) 
			{
				echo "failed to copy $user_dirname_down...\n";
			}
			//copy files from upload folder
			if (!copy($user_dirname_main, $file_personal_main)) 
			{
				echo "failed to copy $user_dirname_main...\n";
			}
			//copy files from upload folder
			if (!copy($user_dirname_pick, $file_personal_pick)) 
			{
				echo "failed to copy $user_dirname_pick...\n";
			}
			
			echo "all oik";
		}
		else
		{
			echo "copied";
			
			//Get content from sample file and save the file
			$sample_filename=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal.txt";
			$sample_content =  file_get_contents($sample_filename);
			$file = fopen($file_personal_main,"w+");
			fwrite($file, $sample_content);
			
			$sample_filename=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal_up.txt";
			$sample_content =  file_get_contents($sample_filename);
			$file = fopen($file_personal_up,"w+");
			fwrite($file, $sample_content);
			
			$sample_filename=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal_down.txt";
			$sample_content =  file_get_contents($sample_filename);
			$file = fopen($file_personal_down,"w+");
			fwrite($file, $sample_content);
			
			$sample_filename=plugin_dir_path( __FILE__ )."../layout/grid/personal/personal_pick.txt";
			$sample_content =  file_get_contents($sample_filename);
			$file = fopen($file_personal_pick,"w+");
			fwrite($file, $sample_content);
			
		}
	}
	
}


 // Only for extra custom fields
 function upg_get_value($field)
 {
	  global $post;
	  $value= get_post_custom($post->ID);
	  if(isset($value[$field][0]))
		  return $value[$field][0];
	  else
		  return "";
	  
 }
 
 
 
	//Detail Layout List
	 function upg_grid_layout_list($param,$name)
	{
        
		$upg_layout=$param;
		
		$dir    = upg_BASE_DIR.'layout/grid/';
		$filelist ="";
		$files = array_map("htmlspecialchars", scandir($dir));       

		foreach ($files as $file) 
		{
			if($upg_layout==$file)
				$checked='checked=checked';
			else
				$checked="";
			
			if(!strpos($file, '.') && $file != "." && $file != "..")	
			$filelist .= sprintf('<input type="radio" '.$checked.' name="'.$name.'" id="'.$name.'"  value="%s"/>%s layout<br>' . PHP_EOL, $file, $file );
		}
echo $filelist;
   
	}

//Adding facebook image meta tag for product page
function upg_metatag_facebook_head() 
{
	global $post;
	if(get_post_type( get_the_ID() )=='upg')
	{
		
	echo '<meta property="og:image" content="'.upg_image_src('large',$post).'" />';
	echo '<meta property="og:type" content="website" />';
	echo '<meta property="og:title" content="'.get_the_title($post->ID).'" />';
	echo '<meta property="og:url"  content="'.get_permalink($post).'" />';
	echo '<meta property="og:description"  content="'.wp_strip_all_tags($post->post_content).'" />';

	}

}



function upg_image_src($size,$post)
{
	// global $post;
	wp_enqueue_media();
	$field_names = array( 'pic_name');
	
	
	$all_upg_extra= get_post_custom($post->ID);
			if(isset($all_upg_extra["youtube_url"][0]))
			$youtube_url=trim($all_upg_extra["youtube_url"][0]);
			else	
			$youtube_url="";
		
		
	
	foreach ( $field_names as $name ) 
	{

			$value = $rawvalue = get_post_meta( $post->ID, $name, true );
			$image_attributes = wp_get_attachment_image_src( $rawvalue,$size );
			if ( $image_attributes )
			{
			return $image_attributes[0];
			}
			else
			{
				if(empty($youtube_url))
					return plugins_url( '../images/noimg.png', __FILE__ );
				else if(trim($youtube_url)!="")
					return upg_getimg_youtube($youtube_url);
				else
					return plugins_url( '../images/noimg.png', __FILE__ );
			}
					
			
	}
}
function upg_droplist_category()
{
	
		$disp='';
		$ptype='';
		

			$args = array(
			'show_option_all'    => '',
			'orderby'            => 'name',
			'order'              => 'ASC',
			'style'              => 'list',
			'show_count'         => 0,
			'hide_empty'         => 0,
			'use_desc_for_title' => 1,
			'feed'               => '',
			'feed_type'          => '',
			'feed_image'         => '',
			'exclude'            => '',
			'exclude_tree'       => '',
			'include'            => '',
			'hierarchical'       => 1,
			
			'number'             => null,
			'echo'               => 0,
			'depth'              => 0,
			'current_category'   => 0,
			'pad_counts'         => 0,
			'taxonomy'           => 'upg_cate',
			'walker'             => null,
			'value_field'	     => 'term_id'
			);

			

		

	 //$disp.=wp_dropdown_categories( $args );
	 
	 $disp.='<select name="cat" id="cat">'; 
    
    
    $categories = get_categories( array( 'taxonomy'=> 'upg_cate','hide_empty'         => 0 ) ); 
	
	$i=0;
    foreach ( $categories as $category ) 
	{
		$upg_show_cate = get_term_meta( $category->term_id, 'upg_show_cate', true  );
		
		if($upg_show_cate!="1")
		{
			
			$disp.='<option value="'.$category->term_id.'">'.$category->cat_name.'</option>'; 
			$i++;
		}
    }
	if($i==0)
		$disp.='<option value="0">Create Category - Admin</option>';
    
$disp.='</select>';
				
	
return $disp;

}

function upg_droplist_user($user)
{
	 $args = array(
    'show_option_all'         => null, // string
    'show_option_none'        => null, // string
    'hide_if_only_one_author' => null, // string
    'orderby'                 => 'display_name',
    'order'                   => 'ASC',
    'include'                 => null, // string
    'exclude'                 => null, // string
    'multi'                   => false,
    'show'                    => 'display_name',
    'echo'                    => true,
    'selected'                => $user,
    'include_selected'        => false,
    'name'                    => 'upg_settings[guest_user]', // string
    'id'                      => null, // integer
    'class'                   => null, // string 
    'blog_id'                 => $GLOBALS['blog_id'],
    'who'                     => null // string
	); 
	$disp= wp_dropdown_users( $args );
	return $disp;
}


function upg_html_content_type() 
{

	return 'text/html';
}
function upg_log($message) 
{
    if (WP_DEBUG === true) {
        if (is_array($message) || is_object($message)) {
            error_log(print_r($message, true));
        } else {
            error_log($message);
        }
    }
}
//log_me('This is a message for debugging purposes. wordks if dubug is enabled.');

function upg_delete_post_media( $post_id ) {

	if(!isset($post_id)) return; // Will die in case you run a function like this: delete_post_media($post_id); if you will remove this line - ALL ATTACHMENTS WHO HAS A PARENT WILL BE DELETED PERMANENTLY!
	elseif($post_id == 0) return; // Will die in case you have 0 set. there's no page id called 0 :)
	elseif(is_array($post_id)) return; // Will die in case you place there an array of pages.

	else {

	    $attachments = get_posts( array(
	        'post_type'      => 'attachment',
	        'posts_per_page' => -1,
	        'post_status'    => 'any',
	        'post_parent'    => $post_id
	    ) );

	    foreach ( $attachments as $attachment ) {
	        if ( false === wp_delete_attachment( $attachment->ID ) ) 
			{
	            upg_log('Unable to delete image-'.$post_id);
	        }
	    }
	}
}

function upg_getid_youtube($url)
{


$pattern = 
                '%^# Match any youtube URL
                (?:https?://)?  # Optional scheme. Either http or https
                (?:www\.)?      # Optional www subdomain
				(?:m\.)?      # Optional mobile subdomain
                (?:             # Group host alternatives
                  youtu\.be/    # Either youtu.be,
                | youtube\.com  # or youtube.com
                  (?:           # Group path alternatives
                    /embed/     # Either /embed/
                  | /v/         # or /v/
                  | /watch\?v=  # or /watch\?v=
                  )             # End path alternatives.
                )               # End host alternatives.
                ([\w-]{10,12})  # Allow 10-12 for 11 char youtube id.
                $%x'
                ;
            $result = preg_match($pattern, $url, $matches);
            if ($result) {
                return $matches[1];
            }
            return '';

}

function upg_getimg_youtube($url)
{
	$youtube_id=upg_getid_youtube($url);
	return 'http://img.youtube.com/vi/'.$youtube_id.'/mqdefault.jpg';
}


function upg_isVideo($post)
{
	$all_upg_extra= get_post_custom($post->ID);
			
			if(isset($all_upg_extra["youtube_url"][0]))
			$youtube_url=$all_upg_extra["youtube_url"][0];
			else	
			$youtube_url="";
		
		if($youtube_url=="")
			return '';
		else
			return $youtube_url;
	
}

function upg_video_preview_url($url)
{
	$youtube_id=upg_getid_youtube($url);
	return 'http://www.youtube.com/embed/'.$youtube_id.'?rel=0&amp;wmode=transparent';
}
?>