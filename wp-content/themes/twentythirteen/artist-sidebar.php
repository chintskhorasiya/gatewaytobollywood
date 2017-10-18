<?php
global $user_ID;
?>
<div class="search-bar">
	<h4></h4>
</div>
<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <li class="menu <?php if(strpos(get_permalink(), 'artist-dashboard') !== false){ echo 'menu-active'; } ?>"><a href="<?php echo site_url().'/artist-dashboard'; ?>">Dashboard</a></li>
        <li class="menu <?php if(strpos(get_permalink(), 'artist-jobs') !== false){ echo 'menu-active'; } ?>"><a href="<?php echo site_url().'/artist-jobs'; ?>">My Jobs</a></li>
        <li class="menu"><a href="<?php echo site_url().'/talents/?userId='.$user_ID; ?>">My Profile</a></li>
    </ul>
</div>