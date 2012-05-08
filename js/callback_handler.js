/*
 * Writes the username and blog Url in the DOM using jQuery
 * The elements will be created inside the element with id "userData" (at the end). 
 *
 * To keep things clean name the IDs of the elements like this: user + datafield (from github.js),
 * i.e. userData.login -> userLogin
 * Do the same with repo, issue, ...
 * Look up the names here: https://github.com/judofyr/github-js/blob/master/README.markdown
 */
var displayUserData = function(userData){
	// AVATAR -------------------------------------------------------------
	if(userData.id != null){
		$("#userData").append('<a href="http://github.com/' + userData.login + '" title="Visit on GitHub" target="_blank"><img id="userId" width="120px" src=" http://www.gravatar.com/avatar/' + userData.gravatar_id + '" /></a>');
	}
	
	// LOGIN --------------------------------------------------------------
	$("#userData").append('<a href="http://github.com/' + userData.login + '" title="Visit on GitHub"><h1 id="userLogin">' + userData.login + '</h1></a>').log("userData appended!");
	
    // BLOG ---------------------------------------------------------------
	if(userData.blog != null){
		var shortBlog = userData.blog.replace("http://", "").replace("www.", "");
		$("#userData").append('<a id="userBlog" href="' + userData.blog + '" title="Homepage">' + shortBlog + '</a>').log("blog appended!");
	}
    
    // MAP -----------------------------------------------------------------
	if(userData.location != null){
		// On success a map will be drawn
		getLatLong(userData.location, latLongCallback);
	}
	
    // PJS -----------------------------------------------------------------
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
    p5.userDataReady();
}
