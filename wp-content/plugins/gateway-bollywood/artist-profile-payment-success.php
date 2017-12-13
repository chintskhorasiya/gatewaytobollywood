<?php

function artist_profile_payment_success_html(){
    
    ?>
    <div class="plan-section">

        <?php global $user_ID, $user_identity; if (!empty($user_ID)) { ?>

            <?php
            $current_user = wp_get_current_user();
            
            echo artist_profile_timeline_html();
            
            //print_r($_POST);

            $status=$_POST["status"];
            $firstname=$_POST["firstname"];
            $amount=$_POST["amount"];
            $txnid=$_POST["txnid"];
            $posted_hash=$_POST["hash"];
            $key=$_POST["key"];
            $productinfo=$_POST["productinfo"];
            $email=$_POST["email"];
            //$salt="AqBa84k36H";//"GQs7yium";

            $options = get_option( 'gateway_bollywood_options' );
            
            if($options['gateway_bollywood_field_payumoney_mode'] == "live"){
                $salt="CWFkYeCu1n";
            } else {
                $salt="AqBa84k36H";   
            }

            if(isset($_POST["additionalCharges"])) {

                $additionalCharges=$_POST["additionalCharges"];
                $retHashSeq = $additionalCharges.'|'.$salt.'|'.$status.'|||||||||||'.$email.'|'.$firstname.'|'.$productinfo.'|'.$amount.'|'.$txnid.'|'.$key;
            }
            else
            {
                $retHashSeq = $salt.'|'.$status.'|||||||||||'.$email.'|'.$firstname.'|'.$productinfo.'|'.$amount.'|'.$txnid.'|'.$key;
            }

            $hash = hash("sha512", $retHashSeq);

            if ($hash != $posted_hash) {

                echo "Invalid Transaction. Please try again";
            }
            else
            {
                $custom_msg = "";
                if($amount == '1999.0'){
                    $custom_msg = "You have now access till next 6 months.";
                    $plan = "6 months";
                } else {
                    $custom_msg = "You have now access till next 12 months.";
                    $plan = "12 months";
                }

                global $wpdb;
                $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
                $profile_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_ID."'");
                if(!empty($profile_status_data)){
                    $profile_status_data_status = (int)$profile_status_data->status;
                    if($profile_status_data_status < 4){
                        $wpdb->update(
                            $profile_status_table_name, //table
                            array('status' => 4), //data
                            array('user_id' => $user_ID), //data
                            array('%d'), //data format  
                            array('%d') //data format         
                        );
                    }
                }

                $profile_payments_table_name = $wpdb->prefix . "gateway_bollywood_profile_payments";
                $profle_payments_data = $wpdb->get_row("SELECT user_id,plan,amount from $profile_payments_table_name where `user_id`='".$user_ID."'");

                $today_date = date('Y-m-d');

                if(empty($profle_payments_data)){

                    $wpdb->insert(
                        $profile_payments_table_name, //table
                        array('user_id' => $user_ID, 'plan' => $plan,'amount' => $amount, 'txnid'=>$txnid, 'status'=>$status, 'date_paid'=>$today_date), //data
                        array('%d', '%s', '%s', '%s', '%s', '%s') //data format         
                    );

                } else {
                    $wpdb->update(
                        $profile_payments_table_name, //table
                        array('plan' => $plan,'amount' => $amount, 'txnid'=>$txnid, 'status'=>$status, 'date_paid'=>$today_date),
                        array('user_id' => $user_ID), // where data
                        array('%s', '%s', '%s', '%s', '%s'), //data format   
                        array('%d') // where data format
                    );
                }

                echo "<h3>Thank You. Your order status is ". $status .".</h3>";
                echo "<h4>Your Transaction ID for this transaction is ".$txnid.".</h4>";
                echo "<h4>We have received a payment of Rs. " . $amount . ". ".$custom_msg."</h4>";
            } 


    } else {

            $options = get_option( 'gateway_bollywood_options' );

            echo 'Please <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here';

    } ?>

    </div>
<?php
}
?>