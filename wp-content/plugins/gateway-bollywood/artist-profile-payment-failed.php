<?php

function artist_profile_payment_failed_html(){
    
    ?>
    <div class="plan-section">

        <?php
        global $user_ID, $user_identity;
        
        if (!empty($user_ID))
        { 
            $current_user = wp_get_current_user();
            echo artist_profile_timeline_html();

            $status=$_POST["status"];
            $firstname=$_POST["firstname"];
            $amount=$_POST["amount"];
            $txnid=$_POST["txnid"];

            $posted_hash=$_POST["hash"];
            $key=$_POST["key"];
            $productinfo=$_POST["productinfo"];
            $email=$_POST["email"];

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
                else {    

                    $retHashSeq = $salt.'|'.$status.'|||||||||||'.$email.'|'.$firstname.'|'.$productinfo.'|'.$amount.'|'.$txnid.'|'.$key;

                     }
                     $hash = hash("sha512", $retHashSeq);
              
                   if ($hash != $posted_hash) {
                       echo "Invalid Transaction. Please try again";
                       }
                   else {

                     echo "<h3>Your order status is ". $status .".</h3>";
                     echo "<h4>Your transaction id for this transaction is ".$txnid.". You may try making the payment by clicking the link below.</h4>";
                      
                     } 
            ?>
            <!--Please enter your website homepagge URL -->
            <?php
            $options = get_option( 'gateway_bollywood_options' );
            ?>
            <p><a href="<?=get_page_link($options['gateway_bollywood_field_profile_page']);?>"> Try Again</a></p>
            <?php
        }
        else
        {
            $options = get_option( 'gateway_bollywood_options' );
            echo 'Please <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here';
        }
        ?>

    </div>
<?php
}
?>