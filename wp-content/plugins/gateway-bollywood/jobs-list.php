<?php

function gateway_jobs_list() {
    ?>
    <div class="wrap">
        <h2>Jobs</h2>
        <?php
        global $wpdb;
        $table_name = $wpdb->prefix . "gateway_bollywood_jobs";

        $total_jobs = $wpdb->get_var("SELECT count(*) from $table_name");

        $row_limit = 10;

        $currpage = (!empty($_GET['pg']) ? (int)$_GET['pg'] : 1 );
        
        $curr_limit = ($currpage-1) * $row_limit;
        $offset = $row_limit;

        //var_dump($curr_limit);
        //var_dump($offset);
        //var_dump($total_jobs);

        if(($curr_limit+$offset) >=  $total_jobs) {
            $nextpage = '#';
        } else {
            $nextpage = get_permalink().'?page=gateway_jobs_list&pg='.($currpage+1);                
        }

        if($currpage >= 2) {
            $prevpage = get_permalink().'?page=gateway_jobs_list&pg='.($currpage-1);
        } else {
            $prevpage = '#';
        }


        $rows = $wpdb->get_results("SELECT * from $table_name order by id DESC limit $curr_limit,$offset");
        ?>
        <table class='wp-list-table widefat fixed striped posts'>
            <tr>
                <!--<th class="manage-column ss-list-width">ID</th>-->
                <th class="manage-column ss-list-width">Job Title</th>
				<th class="manage-column ss-list-width">Active</th>
				<th class="manage-column ss-list-width">Featured</th>
				<th>&nbsp;</th>
            </tr>
            <?php foreach ($rows as $row) { ?>
                <tr>
                    <td class="manage-column ss-list-width"><?php echo $row->title; ?></td>
					<td class="manage-column ss-list-width"><?php echo ( $row->active ? 'Yes' : 'No') ?></td>
                    <td class="manage-column ss-list-width"><?php echo ( $row->featured ? 'Yes' : 'No') ?></td>
                    <td><a href="<?php echo admin_url('admin.php?page=gateway_jobs_update&id=' . $row->id); ?>">Update</a></td>
                </tr>
            <?php } ?>
        </table>

        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="<?php echo $prevpage; ?>">Previous</a></li>
            <li class="page-item pull-right"><a class="page-link" href="<?php echo $nextpage; ?>">Next</a></li>
          </ul>
        </nav>
    </div>
    <?php
}