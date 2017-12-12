<?php

function artist_profile_payment_html(){
    
    ?>
    <div class="plan-section">

        <?php global $user_ID, $user_identity; if (!empty($user_ID)) { ?>

            <?php
            $current_user = wp_get_current_user();
            ?>
                <?php
                echo artist_profile_timeline_html();

                global $wpdb;
                $profile_status_table_name = $wpdb->prefix . "gateway_bollywood_profile_status";
                $profile_status_data = $wpdb->get_row("SELECT user_id,status from $profile_status_table_name where `user_id`='".$user_ID."'");
                if(!empty($profile_status_data)){
                    $profile_status_data_status = (int)$profile_status_data->status;
                    if($profile_status_data_status < 4){
                        ?>
                        <div class="clear"></div>
                        <br>
                        <br>

                        <div class="col-md-6 free-plan plan">
                            <h2>Free</h2>
                            <ul>
                                <li>Lorem Ipsim dolor sit</li>
                                <li>Lorem Ipsim dolor sit</li>
                                <li>Lorem Ipsim dolor sit</li>
                            </ul>
                        </div>
                    
                        <div class="col-md-6 prime-plan plan">
                            <h2>Prime</h2>
                                <ul>
                                    <li>Lorem Ipsim dolor sit</li>
                                    <li>Lorem Ipsim dolor sit</li>
                                    <li>Lorem Ipsim dolor sit</li>
                                </ul>
                        </div>
                        
                        <div class="clear"></div>
                        
                        <div class="price-p p1" style="display: none;">
                            <h2>1 Month</h2>
                            <h3>Rs2500</h3>
                            <a href="#">Upgrade to Prime</a>
                        </div>

                        <div class="price-p p2">
                            <h2>6 Months</h2>
                            <h3>Rs1999</h3>
                            <!-- <div class='pm-button'><a href='https://www.payumoney.com/sandbox/paybypayumoney/#/CC97652967D8C7E6BE7AB8266E3FAE9A'><img src='https://www.payumoney.com/media/images/payby_payumoney/new_buttons/11.png' /></a></div> -->
                            <div class='pm-button'><a href='https://www.payumoney.com/sandbox/paybypayumoney/#/81A137726CAB300CCC7E686F3C97257F'><img src='https://www.payumoney.com/media/images/payby_payumoney/new_buttons/11.png' /></a></div> 
                        </div>

                        <div class="price-p p3">
                            <h2>12 Months</h2>
                            <h3>Rs2999</h3>
                            <!-- <a href="#">Upgrade to Prime</a> -->
                            <div class='pm-button'><a href='https://www.payumoney.com/sandbox/paybypayumoney/#/ED41AAD94A74CB8CF3433C60CF2A0E4A'><img src='https://www.payumoney.com/media/images/payby_payumoney/new_buttons/11.png' /></a></div> 
                        </div>

                        <div class="price-p p4" style="display: none;">
                            <h2>4 Month</h2>
                            <h3>Rs2500</h3>
                            <a href="#">Upgrade to Prime</a>
                        </div>

                        <div class="clear"></div> 
                        <?php
                    } else {
                        echo '<h2>You are prime member already !!</h2>';
                    }
                }
                ?>
            <?php

    } else {

            $options = get_option( 'gateway_bollywood_options' );

            echo 'Please <a href="'.get_page_link($options['gateway_bollywood_field_login_page']).'">login</a> here';

    } ?>

    </div>
<?php
}
?>