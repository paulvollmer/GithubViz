<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<?php include("../static/head.php"); ?>
<script src="http://www.wrong-entertainment.com/code/GithubViz/js/processing-1.3.6.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- <script type="text/javascript">  
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
</script>-->

<script type="text/javascript">  
function drawSomeText(id) {  
  var pjs = Processing.getInstanceById(id);  
  var text = document.getElementById('inputtext').value;


var gitUsername = text;//"WrongEntertainment";
var gitBaseUrl = "http://github.com/api/v2/json/";
var gitUserUrl = "user/show/";
var gitRepoUrl = "repos/show/";
var callback = "?callback=?";	
var gravatarUrl = "http://www.gravatar.com/avatar/";
	 
$.getJSON(gitBaseUrl + gitUserUrl + gitUsername + callback,
function(json, statuts) {			
	var user_data = json.user;
	//alert(user_data.login);
	$("#github_userinfo").append("<ul id='github_userinfo-list'></ul>");
	$("#github_userinfo-list").append("<li>Name: " + user_data.login + "</li>");
	name = user_data.login;
	pjs.drawText(name);
	$("#github_userinfo-list").append("<li>Followers: " + user_data.followers_count + "</li>");
	$("#github_userinfo-list").append("<li>Public Repos: " + user_data.public_repo_count + "</li>");
	$('#github_userinfo').prepend('<img id="github_avatar" src="' + gravatarUrl + user_data.gravatar_id + '" />');
});
		

  //pjs.drawText(text);
}
</script>

</head>
	
<body>
<?php include("../static/header.php"); ?>
<?php include("../static/nav.php"); ?>

<!-- CONTENT begin -->
<div id="github_repositories"></div>

<section>
<h1>About</br>GithubViz</h1>
<canvas id="sketch1" data-processing-sources="http://www.wrong-entertainment.com/code/GithubViz/js/test.pde"></canvas>
<div id="coordinates">  
            x/y: <input type="textfield" id="xcoord"/>/<input type="textfield" id="ycoord"/>  
</div>

<input type="textfield" value="my text" id="inputtext"/>  
<button onclick="drawSomeText('sketch1')"/>


<p>Feel free to replace.</p>
<!-- <img src="http://placehold.it/750x350/808080/4D4D4D"> -->
</section>
<!-- CONTENT end -->

<?php include("../static/footer.php"); ?>
</body>
</html>
