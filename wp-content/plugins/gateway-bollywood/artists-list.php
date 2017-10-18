<?php

function gateway_artists_list() {
    ?>
    <link type="text/css" href="<?php echo WP_PLUGIN_URL; ?>/seawind-courses/style-admin.css" rel="stylesheet" />
    <div class="wrap">
        <h2>Artists</h2>
        <?php
        global $wpdb;
        $table_name = $wpdb->prefix . "course";

        $user_rows = get_users('role=artist');
        ?>
        <table class='wp-list-table widefat fixed striped posts'>
            <tr>
                <!--<th class="manage-column ss-list-width">ID</th>-->
                <th class="manage-column ss-list-width">Login</th>
				<th class="manage-column ss-list-width">Email</th>
				<th class="manage-column ss-list-width">Role</th>
                <th>&nbsp;</th>
            </tr>
            <?php foreach ($user_rows as $row) { /* echo '<pre>'; print_r($row); echo '</pre>'; */ ?>
                <tr>
                    <!--<td class="manage-column ss-list-width"><?php echo $row->id; ?></td>-->
                    <td class="manage-column ss-list-width"><?php echo $row->data->user_nicename; ?></td>
					<td class="manage-column ss-list-width"><?php echo $row->data->user_email; ?></td>
					<td class="manage-column ss-list-width">Artist</td>
                    <td><!--<a href="<?php echo admin_url('admin.php?page=seawind_courses_update&id=' . $row->id); ?>">Update</a>--></td>
                </tr>
            <?php } ?>
        </table>
    </div>
    <?php
}