<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<?php include("../static/head.php"); ?>
<script src="http://www.wrong-entertainment.com/code/GithubViz/js/processing-1.3.6.min.js"></script>
<script type="text/javascript">  
            var bound = false;  
  
            function bindJavascript() {  
                var pjs = Processing.getInstanceById('sketch1');  
                if(pjs!=null) {  
                    pjs.bindJavascript(this);  
                    bound = true; }  
                if(!bound) setTimeout(bindJavascript, 250);   
       }  
            bindJavascript();  
  
            function showXYCoordinates(x, y) {  
                document.getElementById('xcoord').value = x;  
                document.getElementById('ycoord').value = y;   
       }  
        </script>

</head>
	
<body>
<?php include("../static/header.php"); ?>
<?php include("../static/nav.php"); ?>

<!-- CONTENT begin --> 
<section>
<h1>About</br>GithubViz</h1>
<canvas id="sketch1" data-processing-sources="http://www.wrong-entertainment.com/code/GithubViz/js/test.pde"></canvas>
<div id="coordinates">  
            x/y: <input type="textfield" id="xcoord"/>/<input type="textfield" id="ycoord"/>  
</div>

<p>Feel free to replace.</p>
<!-- <img src="http://placehold.it/750x350/808080/4D4D4D"> -->
</section>
<!-- CONTENT end -->

<?php include("../static/footer.php"); ?>
</body>
</html>
