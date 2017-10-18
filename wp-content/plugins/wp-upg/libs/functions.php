<?php
function upg_sanitize_content($content) 
{
	$allowed_tags = wp_kses_allowed_html('post');
	return wp_kses(stripslashes($content), $allowed_tags);
}

function upg_prepare_post($title, $content) 
{
	$options = get_option('upg_settings');
	
	$postData = array();
	$postData['post_title']   = $title;
	$postData['post_content'] = $content;
	$postData['post_author']  = upg_get_author();
	$postData['post_type']  = 'upg';
	
	if(isset($options['publish']) && $options['publish']=='1' )
	$postData['post_status'] = 'publish';
	
	return apply_filters('upg_post_data', $postData);
}

function upg_get_author() 
{
	if ( is_user_logged_in() )
	{
		$author_id =get_current_user_id();
	} 
	else 
	{
		$options = get_option('upg_settings');
			if(!isset($options['guest_user']))
			$options['guest_user']="";
		$author_id =$options['guest_user'];
	}	
	
	
	return $author_id;
}

function upg_include_deps() 
{
	if (!function_exists('media_handle_upload')) {
		require_once (ABSPATH .'/wp-admin/includes/media.php');
		require_once (ABSPATH .'/wp-admin/includes/file.php');
		require_once (ABSPATH .'/wp-admin/includes/image.php');
	}
}
	
function upg_check_images($files) 
{
	global $upg_options;
	
	$temp = false; $errr = false; $error = array();
	
	if (isset($files['tmp_name'])) $temp = array_filter($files['tmp_name']);
	if (isset($files['error']))    $errr = array_filter($files['error']);
	
	$file_count = 0;
	if (!empty($temp)) 
	{
		foreach ($temp as $key => $value) if (is_uploaded_file($value)) $file_count++;
	}
	if (true) 
	{
		
		//if ($file_count > 1) $error[] = 'file-max';
		
		$i=0;
			
			$image = @getimagesize($temp[$i]);
			
			if (false === $image) 
			{
				$error[] = 'file-type';
				//break;
			} 
			else 
			{
				if (function_exists('exif_imagetype')) 
				if (isset($temp[$i]) && !exif_imagetype($temp[$i])) 
				{
					$error[] = 'exif_imagetype';
					//break;
				}
				/* $file = check_upload_size( $temp[$i] );
				if ( $file['error'] != '0' )
				{
					$error[] = 'max-filesize';
				} */
				
				
			}
		
	}
	else 
	{
		$files = false;
	}
	$file_data = array('error' => $error, 'file_count' => $file_count);
	return $file_data;
}		

function upg_submit_url($title, $url, $content, $category)
{
	$url=str_replace("m.youtube","www.youtube",$url);
	
	$newPost = array('id' => false, 'error' => false);
	$newPost['error'][] ="";
	
	if (empty($title))    $newPost['error'][] = 'required-title';
	if (empty($category)) $newPost['error'][] = 'required-category';
	if (empty($content))  $newPost['error'][] = 'required-description';
	if (empty($url))  $newPost['error'][] = 'required-url';
	if ($category=='-1') $newPost['error'][] = 'required-category';
	if(upg_getid_youtube($url)=='') $newPost['error'][] = 'wrong-youtube-url';
		
		
		
		$newPost['error'][]=apply_filters('upg_verify_submit', "");
		//var_dump($newPost);

		
		foreach ($newPost['error'] as $e) 
	{
		if (!empty($e)) 
		{
			unset($newPost['id']);
			return $newPost;
		}
	}
	
	$postData = upg_prepare_post($title, $content);
	
	do_action('upg_insert_before', $postData);
	$newPost['id'] = wp_insert_post($postData);
	do_action('upg_insert_after', $newPost);
	
	if ($newPost['id']) 
	{
		$post_id = $newPost['id'];
		//wp_set_post_categories($post_id, array($category));
		wp_set_object_terms($post_id, array($category),'upg_cate');
		
		add_post_meta($post_id, 'youtube_url', $url);
		
	}
	
	return apply_filters('upg_new_post', $newPost);
	
	
}
	
function upg_submit($title, $files, $content, $category)
{
	$newPost = array('id' => false, 'error' => false);
	$newPost['error'][] ="";
	
	if (empty($title))    $newPost['error'][] = 'required-title';
	if (empty($category)) $newPost['error'][] = 'required-category';
	if (empty($content))  $newPost['error'][] = 'required-description';
	
		$newPost['error'][]=apply_filters('upg_verify_submit', "");
	
	
	$file_data = upg_check_images($files, $newPost);
	$file_count       = $file_data['file_count'];
	$newPost['error'] = array_unique(array_merge($file_data['error'], $newPost['error']));
	
	if ($category=='-1') $newPost['error'][] = 'required-category';
	
	foreach ($newPost['error'] as $e) 
	{
		if (!empty($e)) 
		{
			unset($newPost['id']);
			return $newPost;
		}
	}
	
	$postData = upg_prepare_post($title, $content);
	
	do_action('upg_insert_before', $postData);
	$newPost['id'] = wp_insert_post($postData);
	do_action('upg_insert_after', $newPost);
	if ($newPost['id']) 
	{
		$post_id = $newPost['id'];
		//wp_set_post_categories($post_id, array($category));
		wp_set_object_terms($post_id, array($category),'upg_cate');
		
		//POST IMG
		do_action('upg_files_before', $files);
		
		$attach_ids = array();
		if ($files) 
		{
			upg_include_deps();
			$i=0;
				
				$key = apply_filters('upg_file_key', 'user-submitted-image-{$i}');
				
				$_FILES[$key] = array();
				$_FILES[$key]['name']     = $files['name'][$i];
				$_FILES[$key]['tmp_name'] = $files['tmp_name'][$i];
				$_FILES[$key]['type']     = $files['type'][$i];
				$_FILES[$key]['error']    = $files['error'][$i];
				$_FILES[$key]['size']     = $files['size'][$i];
				
				$attach_id = media_handle_upload($key, $post_id);
				
				if (!is_wp_error($attach_id) && wp_attachment_is_image($attach_id)) 
				{
					$attach_ids[] = $attach_id;
					add_post_meta($post_id, 'pic_name', $attach_id);
					//add_post_meta($post_id, 'meta-box-media[pic_name]', wp_get_attachment_url($attach_id));
					//echo $post_id."-image attached".$attach_id."-".wp_get_attachment_url($attach_id);
				} 
				else 
				{
					wp_delete_attachment($attach_id);
					wp_delete_post($post_id, true);
					$newPost['error'][] = 'upload-error';
					unset($newPost['id']);
					return $newPost;
				}
			
		}
		else
		{
			$newPost['error'][] = 'no-files';
		}
		do_action('upg_files_after', $attach_ids);
		//update_post_meta($post_id, $upg_post_meta_IsSubmission, true);
		
		//END
	}
	else 
	{
		$newPost['error'][] = 'post-fail';
	}
	return apply_filters('upg_new_post', $newPost);
	
}




function upg_author($author)
{
	$options = get_option('upg_settings');
	if(isset($options['main_page']))
	{
		if ( get_option('permalink_structure') )
		$linku=esc_url( get_permalink($options['main_page'])."".$author->user_nicename );
		else
		$linku=esc_url( get_permalink($options['main_page'])."&user=".$author->user_nicename );
	}
	else
	{
		$linku="";
	}
	
	return  '<div class=""><a href="'.$linku.'" title='.$author->display_name.'>'.get_avatar( get_the_author_meta($author->email), $size = '50').'</a></div><div class="upg-profile-name">'.$author->display_name.'</div>';

	//return '<span class="">Submitted by: <a href="'.$linku.'">'.$author->display_name.'</a></span><br>';
	
	//return '<a href="'.$linku.'">'.get_avatar( $author->user_email,32 ).'</a><br>'.$author->display_name;
}
?>