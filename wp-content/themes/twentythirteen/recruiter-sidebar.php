<div class="search-bar">
	<h4></h4>
</div>
<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <li class="menu <?php if(strpos(get_permalink(), 'recruiter-dashboard') !== false){ echo 'menu-active'; } ?>"><a href="<?php echo site_url().'/recruiter-dashboard'; ?>">Dashboard</a></li>
        <li class="menu <?php if(strpos(get_permalink(), 'recruiter-jobs') !== false || strpos(get_permalink(), 'job-form') !== false){ echo 'menu-active'; } ?>"><a href="<?php echo site_url().'/recruiter-jobs'; ?>">My Jobs</a></li>
        <li class="menu <?php if(strpos(get_permalink(), 'my-applicants') !== false){ echo 'menu-active'; } ?>"><a href="<?php echo site_url().'/my-applicants'; ?>">My Applicants</a></li>
    </ul>
</div>