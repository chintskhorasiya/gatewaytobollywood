<?php

function gateway_fields_list() {
    ?>
    <div class="wrap">
        <h2>Fields</h2>
        <div class="tablenav top">
            <div class="alignleft actions">
                <a href="<?php echo admin_url('admin.php?page=gateway_fields_create'); ?>">Add New</a>
            </div>
            <br class="clear">
        </div>
        <?php
        global $wpdb;
        $table_name = $wpdb->prefix . "gateway_bollywood_fields";

        $total_count = $wpdb->get_var("SELECT count(*) from $table_name");

        $row_limit = 10;

        $currpage = (!empty($_GET['pg']) ? (int)$_GET['pg'] : 1 );
        
        $curr_limit = ($currpage-1) * $row_limit;
        $offset = $row_limit;

        //var_dump($curr_limit);
        //var_dump($offset);
        //var_dump($total_jobs);

        if(($curr_limit+$offset) >=  $total_count) {
            $nextpage = '#';
        } else {
            $nextpage = get_permalink().'?page=gateway_fields_list&pg='.($currpage+1);                
        }

        if($currpage >= 2) {
            $prevpage = get_permalink().'?page=gateway_fields_list&pg='.($currpage-1);
        } else {
            $prevpage = '#';
        }

        $rows = $wpdb->get_results("SELECT id,fid,label,type,options,required,tab,validation,active from $table_name order by id DESC limit $curr_limit,$offset");
        ?>
        <table class='wp-list-table widefat fixed striped posts'>
            <tr>
                <!--<th class="manage-column ss-list-width">ID</th>-->
                <th class="manage-column ss-list-width">Field Key</th>
				<th class="manage-column ss-list-width">Field Label</th>
				<th class="manage-column ss-list-width">Field Type</th>
				<th class="manage-column ss-list-width">Required</th>
                <th class="manage-column ss-list-width">Active</th>
                <th>&nbsp;</th>
            </tr>
            <?php foreach ($rows as $row) { ?>
                <tr>
                    <!--<td class="manage-column ss-list-width"><?php echo $row->id; ?></td>-->
                    <td class="manage-column ss-list-width"><?php echo $row->fid; ?></td>
					<td class="manage-column ss-list-width"><?php echo $row->label; ?></td>
					<?php
                    if(!empty($row->type)){
                        switch ($row->type) {
                            case 1:
                                $type_name = 'Textbox';
                                break;

                            case 2:
                                $type_name = 'Textarea';
                                break;

                            case 3:
                                $type_name = 'Radio button';
                                break;

                            case 4:
                                $type_name = 'Checkbox';
                                break;

                            case 5:
                                $type_name = 'Selectbox';
                                break;

                            case 6:
                                $type_name = 'Image';
                                break;

                            case 7:
                                $type_name = 'Document';
                                break;

                            default:
                                $type_name = 'Textbox';
                                break;
                        }
                    }
                    ?>
                    <td class="manage-column ss-list-width"><?php echo $type_name; ?></td>
					<td class="manage-column ss-list-width"><?php echo ( $row->required ? 'Yes' : 'No') ?></td>
                    <td class="manage-column ss-list-width"><?php echo ( $row->active ? 'Yes' : 'No') ?></td>
                    <td><a href="<?php echo admin_url('admin.php?page=gateway_fields_update&id=' . $row->id); ?>">Update</a></td>
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