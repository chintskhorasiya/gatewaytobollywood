<?php

function gateway_fields_update() {
    global $wpdb;
    $table_name = $wpdb->prefix . "gateway_bollywood_fields";
    $id = $_GET["id"];
    $fid = $_POST["fid"];
    $label = $_POST["label"];
	$type = $_POST["type"];
	$options = $_POST["options"];
	$required = ( $_POST["required"] ? $_POST["required"] : '0' );
	$active = ( $_POST["active"] ? $_POST["active"] : '0' );
	$tab = ( $_POST["tab"] ? $_POST["tab"] : '0' );
	$validation = ( $_POST["validation"] ? $_POST["validation"] : '0' );
//update
    if (isset($_POST['update'])) {
        
		if(!empty($fid) && !empty($label) && !empty($type) && !empty($tab)){
			
			if(!preg_match('/^[a-zA-Z0-9_]{5,}$/', $fid)) { // for english chars + numbers only
			    // valid username, alphanumeric & longer than or equals 5 chars
				$error .= "Please enter valid Field Key, should contain alphanumeric and underscore character only<br>";

			}

			if(($type == '3' || $type == '4' || $type == '5') && count($options) <= 1) { // for english chars + numbers only
			    // valid username, alphanumeric & longer than or equals 5 chars
				$error .= "Please add options for Selectbox|Checkbox|Radio button";

			}

			if(empty($error)){
			
				$wpdb->update(
						$table_name, //table
						array('fid' => $fid, 'label' => $label, 'type' => $type, 'options' => json_encode($options), 'required' => $required, 'active' => $active, 'tab' => $tab, 'validation' => $validation), //data
						array('ID' => $id), //where
						array('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s'), //data format
						array('%s') //where format
				);

			}
		
		} else {
			
			if(empty($fid)){
				$error .= "Please enter Field Key<br>";
			}
			
			if(empty($label)){
				$error .= "Please enter Field Label<br>";
			}

			if(empty($type)){
				$error .= "Please select Field Type<br>";
			}

			if(empty($tab)){
				$error .= "Please select Tab for your Field<br>";
			}
			
		}
    }
//delete
    else if (isset($_POST['delete'])) {
        $wpdb->query($wpdb->prepare("DELETE FROM $table_name WHERE id = %s", $id));
    } else {//selecting value to update	
        $fields = $wpdb->get_results($wpdb->prepare("SELECT id,fid,label,type,options,required,tab,validation,active from $table_name where id=%s", $id));
        foreach ($fields as $s) {
        	//var_dump($s);
            $fid = $s->fid;
			$label = $s->label;
			$type = $s->type;
			$options = json_decode($s->options, true);
			//var_dump($options);
			$required = $s->required;
			$tab = $s->tab;
			$validation = $s->validation;
			$active = $s->active;
        }
    }
    ?>
    <link type="text/css" href="<?php echo WP_PLUGIN_URL; ?>/gateway-bollywood/style-admin.css" rel="stylesheet" />
    <div class="wrap">
        <h2>Edit Field</h2>
		
		<?php if ($_POST['delete'] && !isset($error)) { ?>
            <div class="updated"><p>Field deleted</p></div>
            <a href="<?php echo admin_url('admin.php?page=gateway_fields_list') ?>">&laquo; Back to fields list</a>

        <?php } else if ($_POST['update'] && !isset($error)) { ?>
            <div class="updated"><p>Field updated</p></div>
            <a href="<?php echo admin_url('admin.php?page=gateway_fields_list') ?>">&laquo; Back to fields list</a>

        <?php } else { ?>
		
			<?php if (isset($error)): ?><div class="error"><p><?php echo $error; ?></p></div><?php endif; ?>
			
            <form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
                <table class='wp-list-table widefat fixed'>
	                <!--<tr>
	                    <th class="ss-th-width">ID</th>
	                    <td><input type="text" name="id" value="<?php echo $id; ?>" class="required ss-field-width" /></td>
	                </tr>-->
	                <tr>
	                    <th class="ss-th-width">Field Key *</th>
	                    <td><input type="text" name="fid" value="<?php echo $fid; ?>" class="required ss-field-width" /></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Field Label *</th>
	                    <td><input type="text" name="label" value="<?php echo $label; ?>" class="required ss-field-width" /></td>
	                </tr>
					
					<tr>
	                    <th class="ss-th-width">Field Type *</th>
	                    <td>
							<select name="type" id="fieldType">
								<option value="0">Select Field Type</option>
								<option <?php if($type == '1') echo 'selected="selected"'; ?> value="1">Textbox</option>
								<option <?php if($type == '2') echo 'selected="selected"'; ?> value="2">Textarea</option>
								<option <?php if($type == '3') echo 'selected="selected"'; ?> value="3">Radio button</option>
								<option <?php if($type == '4') echo 'selected="selected"'; ?> value="4">Checkbox</option>
								<option <?php if($type == '5') echo 'selected="selected"'; ?> value="5">Selectbox</option>
								<!--<option <?php if($type == '6') echo 'selected="selected"'; ?> value="6">Image</option>
								<option <?php if($type == '7') echo 'selected="selected"'; ?> value="7">Document</option>-->
							</select>
						</td>
	                </tr>
					
					<tr id="optionsTR">
	                    <th class="ss-th-width">Field Options</th>
	                    <td id="optionsArea">
	                    	<?php
	                    	if(!empty($options) && count($options) > 0){

	                    		foreach ($options as $opt_key => $option) {
	                    			?>
	                    			<input type="hidden" name="option_counter" id="option_counter" value="<?php echo count($options); ?>" />
	                    			<span id="option_span_<?php echo $opt_key; ?>"><input type="text" name="options[]" id="option_<?php echo $opt_key; ?>" value="<?php echo $option; ?>" class="input-option" /><button type="button" class="remove-option" id="removeOption_<?php echo $opt_key; ?>" value="Delete Option">Delete</button><br></span>
	                    			<?php
	                    		}

	                    	} else {
	                    	?>
	                    		<input type="hidden" name="option_counter" id="option_counter" value="0" />

							<?php } ?>
							<button type="button" id="addOption" value="Add Option">Add</button>
						</td>
	                </tr>
					
					<tr>
	                    <th class="ss-th-width">Required</th>
	                    <td><input type="checkbox" name="required" <?php if($required == '1') echo 'checked="checked"'; ?> value="1" class="ss-field-width" /></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Active</th>
	                    <td><input type="checkbox" name="active" <?php if($active == '1') echo 'checked="checked"'; ?> value="1" class="ss-field-width" /></td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Field Tab *</th>
	                    <td>
							<select name="tab">
								<option value="0">Select Tab</option>
								<option <?php if($tab == '1') echo 'selected="selected"'; ?> value="1">Information</option>
								<option <?php if($tab == '2') echo 'selected="selected"'; ?> value="2">Interest</option>
								<option <?php if($tab == '3') echo 'selected="selected"'; ?> value="3">Experience</option>
						</td>
	                </tr>

	                <tr>
	                    <th class="ss-th-width">Field Validation</th>
	                    <td>
							<select name="validation">
								<option value="0">Select Validation</option>
								<option <?php if($validation == '1') echo 'selected="selected"'; ?> value="1">Email</option>
								<option <?php if($validation == '2') echo 'selected="selected"'; ?> value="2">Phone</option>
								<option <?php if($validation == '3') echo 'selected="selected"'; ?> value="3">URL</option>
								<option <?php if($validation == '4') echo 'selected="selected"'; ?> value="4">Age</option>
						</td>
	                </tr>
	            </table>
                <input type='submit' name="update" value='Save' class='button'> &nbsp;&nbsp;
                <input type='submit' name="delete" value='Delete' class='button' onclick="return confirm('Are you sure want to delete this field?')">
            </form>
        <?php } ?>

    </div>
    <script type="text/javascript">
	jQuery(document).ready(function(){
		console.log('start...!');
		jQuery('#optionsTR').hide();

		// if type is already selected 

		var fieldType = jQuery('#fieldType').val();
		if(fieldType == '3' || fieldType == '4' || fieldType == '5'){
			jQuery('#optionsTR').show();	
		} else {
			jQuery('#optionsTR').hide();
		}

		jQuery('#fieldType').change(function(){
			console.log(jQuery(this).val());
			var fieldType = jQuery(this).val();
			if(fieldType == '3' || fieldType == '4' || fieldType == '5'){
				jQuery('#optionsTR').show();	
			} else {
				jQuery('#optionsTR').hide();
			}
		});

		jQuery('#addOption').click(function(){
			var option_counter_val = jQuery('#option_counter').val();
			var option_counter_next = parseInt(option_counter_val)+parseInt(1); 
			jQuery('#addOption').before('<span id="option_span_'+option_counter_next+'"><input type="text" name="options[]" id="option_'+option_counter_next+'" value="" class="input-option" /><button type="button" class="remove-option" id="removeOption_'+option_counter_next+'" value="Delete Option">Delete</button><br></span>');
			jQuery('#option_counter').val(option_counter_next);
		});

		jQuery('.remove-option').live('click', function(){
			console.log('remove clicked!');
			var myRemoveId = jQuery(this).attr('id').replace('removeOption_', '');	
			console.log(myRemoveId);
			jQuery('#option_span_'+myRemoveId).remove();
			//var numOptionItems = jQuery('.input-option').length;
			//console.log(numOptionItems);
			//jQuery('#option_counter').val(numOptionItems);

		});
	});
	</script>
    <?php
}
?>