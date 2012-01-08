<!-- GithubViz -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<?php include("../static/head.php"); ?>
<script src="http://www.wrong-entertainment.com/code/GithubViz/js/processing-1.3.6.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">  
function drawSomeText(id) {  
  var pjs = Processing.getInstanceById(id);  
  var text = document.getElementById('inputtext').value;


/*
  Creates an unordered list containing Github user info and an image with the avatar.
  Will be placed inside a div-element with id "github_userinfo"
*/
  var gitUsername = text;
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
    pjs.drawText(user_data.login, user_data.followers_count, user_data.public_repo_count);
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
<h1>Processing.js Test</h1>
<!-- Processing canvas-->
<canvas id="sketch1" data-processing-sources="http://www.wrong-entertainment.com/code/GithubViz/js/test.pde"></canvas><br><br>
<input type="textfield" value="Powder" id="inputtext"/>  
<button onclick="drawSomeText('sketch1')" id="button4"/>Send</button>
</section>
<!-- CONTENT end -->

<?php include("../static/footer.php"); ?>
</body>
</html>
