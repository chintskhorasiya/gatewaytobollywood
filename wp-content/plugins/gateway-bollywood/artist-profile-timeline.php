<?php
function artist_profile_timeline_html(){
    ?>
    <style type="text/css">
        /*progressbar*/
        #progressbar {
            margin-bottom: 30px;
            overflow: hidden;
            /*CSS counters to number the steps*/
            counter-reset: step;
        }
        #progressbar li {
            list-style-type: none;
            color: black;
            text-transform: uppercase;
            font-size: 9px;
            width: 33.33%;
            float: left;
            position: relative;
        }
        #progressbar li:before {
            content: counter(step);
            counter-increment: step;
            width: 20px;
            line-height: 20px;
            display: block;
            font-size: 10px;
            color: #333;
            background: white;
            border-radius: 3px;
            margin: 0 auto 5px auto;
        }
        /*progressbar connectors*/
        #progressbar li:after {
            content: '';
            width: 100%;
            height: 2px;
            background: white;
            position: absolute;
            left: -50%;
            top: 9px;
            z-index: -1; /*put it behind the numbers*/
        }
        #progressbar li:first-child:after {
            /*connector not needed before the first step*/
            content: none; 
        }
        /*marking active/completed steps green*/
        /*The number of the step and the connector before it = green*/
        #progressbar li.active:before,  #progressbar li.active:after{
            background: #27AE60;
            color: black;
        }
    </style>
    <?php

    global $wpdb;
    global $user_ID;
    $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
    $profle_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_ID."'");

    $stage = 0;
    if(empty($profle_status_data)){
        $stage = 0;
    }
    elseif(!empty($profle_status_data->status)){
        $profle_status_data->status = (int)$profle_status_data->status;
        $stage = $profle_status_data->status;        
    }

    $options = get_option( 'gateway_bollywood_options' );
    ?>
    <div id="profile-timeline">    
        <ul id="progressbar">
            <li <?php if($stage >= 1) echo 'class="active"'; ?>><?php if($stage >= 1){ ?><a class="timeline-link" href="<?php echo get_page_link($options['gateway_bollywood_field_profile_page']) ?>"> <?php } ?>Account Informations<?php if($stage >= 1){ ?></a><?php } ?></li>
            <li <?php if($stage >= 2) echo 'class="active"'; ?>><?php if($stage >= 2){ ?><a class="timeline-link" href="<?php echo get_page_link($options['gateway_bollywood_field_profileinterest_page']) ?>"> <?php } ?>Interests<?php if($stage >= 1){ ?></a><?php } ?></li>
            <li <?php if($stage >= 3) echo 'class="active"'; ?>><?php if($stage >= 3){ ?><a class="timeline-link" href="<?php echo get_page_link($options['gateway_bollywood_field_profileexperience_page']) ?>"> <?php } ?>Work Experiences<?php if($stage >= 1){ ?></a><?php } ?></li>
            <li <?php if($stage >= 4) echo 'class="active"'; ?>><?php if($stage >= 3){ ?><a class="timeline-link" href="<?php echo get_page_link($options['gateway_bollywood_field_profilepayment_page']) ?>"> <?php } ?>Prime Membership<?php if($stage >= 1){ ?></a><?php } ?></li>
        </ul>
    </div>
<?php
}
?>