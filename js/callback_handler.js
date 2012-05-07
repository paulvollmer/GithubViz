
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
	// LOGIN ---------------------------------------------------------------
	$("#userData").append('<a href="http://github.com/' + userData.login + '" title="Visit on GitHub"><h1 id="userLogin">' + userData.login + '</h1></a>').log("userData appended!");
	// BLOG ---------------------------------------------------------------
	if(userData.blog != null){
		var shortBlog = userData.blog;
		shortBlog.replace("http://", "");
		shortBlog.replace("www.", "");
		$("#userData").append('<a id="userBlog" href="' + userData.blog + '" title="Homepage">' + shortBlog + '</a>').log("blog appended!");
	}
	
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
	p5.drawFollower(userData.followers_count);
}

/*
 * Not finished yet, just for testing
 */
/*
var displayRepoData = funtion(repoData){
	$("#repoData").append('<p id="repoName (First)">' + userData.repos[0].name + '</p>').log("repoName appended!");	
}
*/
