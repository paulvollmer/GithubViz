<!-- GitHubViz -->
<!doctype html>
<head>
<?php include("static/head.php"); ?>
</head>

<body>
<?php include("static/nav.php"); ?>

<div id="section">
  <!-- Search Area -->
  <div style="margin-bottom: 50px;">
    <h1>Search GitHub User</h1>
    <form action="discover.php">
      <input type="text" size="65" name="user" value="Wrong-Entertainment" style="padding: 5px; background-color: #999; border: 1px; color: #fff;">
      <input type="submit" class="Button" value="Search" style="padding: 5px; background-color:#39F; color:#fff; width:70px; border: 0px;"> <br/>
    </form>
  </div>

  <!-- Popular Users/Popular Repos -->
  <table cellpadding="5" style="color: #39F;">
    <colgroup cellspacing="10" width="350" span="2"></colgroup>
    <tr>
      <td><h2>Popular Users</h2></td>
      <td><h2>Popular Repos</h2></td>
    </tr>
  </table>
  
  <table cellpadding="5" border="1" bordercolor="#39F">
    <colgroup cellspacing="10" width="350" span="2"></colgroup>
	
	<tr>
	  <td class="popname" onclick="location.href='discover.php?user=jquery';" style="cursor:pointer; cursor:hand;">
		jquery
		<p class="popdesc">jquery JavaScript Library</p></td>
	  <td class="popname" onclick="location.href='discover.php?user=openFrameworks';" style="cursor:pointer; cursor:hand;">
		openFrameworks / openFrameworks
		<p class="popdesc">OpenFrameworks is a cross platform ...</p></td>
	</tr>
	
	<tr>
	  <td class="popname" onclick="location.href='discover.php?user=diaspora';" style="cursor:pointer; cursor:hand;">
		diaspora
		<p class="popdesc">Distributes and Contextural social network</p></td>
	  <td class="popname" onclick="location.href='discover.php?user=twitter';" style="cursor:pointer; cursor:hand;">
		twitter / bootstrap
		<p class="popdesc">HTML, CSS and JS toolkit from twitter</p></td>
	</tr>
	
	<tr>
	  <td class="popname" onclick="location.href='discover.php?user=facebook';" style="cursor:pointer; cursor:hand;">
		facebook
		<p class="popdesc">We have created a new repository for this</p></td>
	  <td class="popname" onclick="location.href='discover.php?user=jqueryui';" style="cursor:pointer; cursor:hand;">
		jquery / jqueryui
		<p class="popdesc">The offical jQuery user interface library</p></td>
	</tr>
	
	<tr>
	  <td class="popname" onclick="location.href='discover.php?user=openFrameworks';" style="cursor:pointer; cursor:hand;">
		openFrameworks
		<p class="popdesc">OpenFrameworks is a cross platform ...</p></td>
	  <td class="popname" onclick="location.href='discover.php?user=jquery';" style="cursor:pointer; cursor:hand;">
		jquery / sizzle
		<p class="popdesc">A sizzlin hot lector engine.</p></td>
	</tr>
	
	<tr>
	  <td class="popname" onclick="location.href='discover.php?user=cinder';" style="cursor:pointer; cursor:hand;">
		cinder
		<p class="popdesc">Cinder is a community-developed, free and ...</p></td>
	  <td class="popname" onclick="location.href='discover.php?user=processingjs';" style="cursor:pointer; cursor:hand;">
		jresig / procesing.js
		<p class="popdesc">A port of the processing visualisation ...</p></td>
	</tr>
  </table>
</div>
  
<?php include("static/footer.php"); ?>
</body>
</html>
