<?php
global $post; 
global $wp_query;

$options = get_option('upg_settings');

if(isset($wp_query->query_vars['user'])){
$user=sanitize_text_field($wp_query->query_vars['user']);
}elseif(!empty($params['user'])){
$userData = get_user_by('id', $params['user']);
$user = $userData->user_nicename;
}else{
$user="";
}

$author = get_user_by('slug', $user);

/*$output='<div class="odude-shop">
<div id="catalog" class="row-fluid">';*/

$output='';

$postsperpage = $options['global_perpage'];
$perrow = $options['global_perrow'];
$album=$options['global_album'];
$orderby=$options['global_order'];
$page=$options['global_page'];
$popup=$options['global_popup'];

if(isset($params['perpage'])&&$params['perpage']>0) $postsperpage = $params['perpage'];
if(isset($params['perrow'])&&$params['perrow']>0) $perrow = $params['perrow'];

if(isset($params['album'])) 
	$album = trim($params['album']);


if(isset($params['orderby'])) $orderby = $params['orderby'];
if(isset($params['page'])) $page = $params['page'];
if(isset($params['popup'])) $popup = $params['popup'];

if(isset($params['layout']))
	$layout=trim($params['layout']);
else
	$layout=$options['global_layout'];

//if($popup=="on")
	//add_thickbox();

//query_posts('post_type=upg&posts_per_page='.$postsperpage.'&paged='.$wp_query->query_vars['paged'].'&ptype='.$ptype);
$paged = ( get_query_var('paged') ) ? get_query_var('paged') : 1;


//to list of specific user

if($album!='')
{
$args = array(
	'post_type' => 'upg',
	'paged' => $paged,
	'posts_per_page' => $postsperpage,
	'orderby' => $orderby,
	'order'   => 'DESC',
	'author_name' => $user,
	'tax_query' => array(
		array(
			'taxonomy' => 'upg_cate',
			'field'    => 'slug',
			'terms'    => explode(',',$album),
			//'terms'    => array( 'mobile', 'sports' ),
		),
		
	),
);
}
else
	
{
	$args = array(
	'post_type' => 'upg',
	'paged' => $paged,
	'posts_per_page' => $postsperpage,
	'author_name' => $user,
);

}


$query = new WP_Query($args); 
if($query->post_count <= 0 && $params['onlynumber'] != "true"){
	return "<h3>No ".$params['gtype']." right now.</h3>";
}

$put="";
ob_start ();

if(file_exists(upg_BASE_DIR."/layout/grid/".$layout."/".$layout."_config.php"))
	include(upg_BASE_DIR."/layout/grid/".$layout."/".$layout."_config.php");


if(file_exists(upg_BASE_DIR."/layout/grid/".$layout."/".$layout."_up.php"))
	include(upg_BASE_DIR."/layout/grid/".$layout."/".$layout."_up.php");
	else
	echo __('Layout Not Found. Check Settings and save update again.','wp-upg').": ".$layout;


$images_counter = 0;
$videos_counter = 0;
	
while($query->have_posts()) : $query->the_post();
$permalink=get_permalink();
$thetitle=get_the_title();
$image=upg_image_src('thumbnail',$post);
$image_large=upg_image_src('large',$post);

	if(upg_isVideo($post) && $params['gtype'] == "video")
	{
		$preview_large=upg_video_preview_url(upg_isVideo($post));
		$preview_type='youtube';
		
		$videos_counter++;

		if($params['onlynumber'] != "true"){
			
			if(file_exists(upg_BASE_DIR."/layout/grid/".$layout."/$layout.php"))
				include(upg_BASE_DIR."/layout/grid/".$layout."/$layout.php");

		} else {
			$videosnumbers = true;
		}
	}
	elseif($params['gtype'] == "image" && !upg_isVideo($post))
	{
		$preview_large=$image_large;
		$preview_type='wp-upg';
		
		$images_counter++;

		if($params['onlynumber'] != "true"){

			if(file_exists(upg_BASE_DIR."/layout/grid/".$layout."/$layout.php"))
				include(upg_BASE_DIR."/layout/grid/".$layout."/$layout.php");

		} else {
			$imagesnumber = true;
		}
	} 


endwhile;


if($params['onlynumber'] == "true"){
	if($videosnumbers){
		return $videos_counter;
	} else{
		return $images_counter;
	}
}


if(file_exists(upg_BASE_DIR."/layout/grid/".$layout."/".$layout."_down.php"))
	include(upg_BASE_DIR."/layout/grid/".$layout."/".$layout."_down.php");



//echo '</div> </div>';



if(function_exists('wp_pagenavi'))
{
	if($page=="on")
	echo "<br>".wp_pagenavi( array( 'query' => $query ) );
}

$put=ob_get_clean (); 
return $put."".$output;
?>


