<div class="pure-u-1 pure-u-md-1-<?php echo $perrow; ?>">
     <div class="obox" >
     <div class="body" style="text-align:center" >
	
	
	<?php
	
			if($permalink=="0")
			{
			echo '<img src="'.$image.'" class="pure-img">';
			}
		else
		{
			if($popup=="on")
			{
			
			echo '<a href="'.$preview_large.'" title="'.$thetitle.'" class="'.$preview_type.'" border=0><img src="'.$image.'"></a>';
			
			
			}
			else
			{
			echo '<a href="'.$permalink.'" border=0><img src="'.$image.'"></a>';
			}
		}
		
				?>
	
	</div>
   
    <div class="footer" style="text-align:center">

	<?php echo $thetitle; ?>
	
	</div>
  </div>
  
  </div>