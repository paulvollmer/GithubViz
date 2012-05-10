
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
		$("#userData").append('<a href="http://github.com/' + userData.login + '" title="Visit on GitHub" target="_blank"><img id="userId" width="120px" src=" http://www.gravatar.com/avatar/' + userData.gravatar_id + '"></img></a>');
	}
	// div for all text infos
	$("#userData").append('<div id="userTextInfo"></div');
	
	// LOGIN --------------------------------------------------------------
	$("#userTextInfo").append('<a href="http://github.com/' + userData.login + '" title="Visit on GitHub"><h1 id="userLogin">' + userData.login + '</h1></a>').log("userData appended!");
	// BLOG ---------------------------------------------------------------
	if(userData.blog != null){
		var shortBlog = userData.blog.replace("http://", "").replace("www.", "");
		$("#userTextInfo").append('<a id="userBlog" href="' + userData.blog + '" title="Homepage">' + shortBlog + '</a>').log("blog appended!");
	}
	// MAP -----------------------------------------------------------------
	if(userData.location != null){
		$("#userTextInfo").append('<p id="userLocation">' + userData.location + '</p>').log("user location appended!");
		// On success a map will be drawn
		getLatLong(userData.location, latLongCallback);
	}
	
    // PJS -----------------------------------------------------------------
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
    p5.userDataReady();
}

/*
 * Gets called, when tags and branches for curRepo are loaded
 * Master SHA: use repo.branches.master to get the SHA
 * Master name: 'master'
 */
var tagsAndBranchesCallback = function(data){
	//alert('Tags & Branches for ' + curRepo.name + ' loaded, master branch SHA: ' + curRepo.branches.master);
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
    p5.tagsAndBranchesReady();
}

/*
 * Gets called, when recent issues (open) for curRepo are loaded
 */
var openIssuesCallback = function(issuesOpen){
	//alert('Issues for ' + curRepo.name + ' loaded (open Issues)');
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
    p5.openIssuesReady();		
}

/*
 * Gets called, when recent issues (closed) for curRepo are loaded
 */
var closedIssuesCallback = function(issuesClosed){
	//alert('Issues for ' + curRepo.name + ' loaded (closed Issues)');
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
    p5.closedIssuesReady();	
}

/*
 * Gets called, when recent commits for curRepo are loaded
 */
var commitsCallback = function(commits){
	//alert('Commits for ' + curRepo.name + ' loaded (Master Branch)');
	curRepo.commits = commits;	// We are setting the master commits as main commits in the object
	var p5 = Processing.getInstanceById('gitHubVizCanvas');
    p5.commitsReady();		
}


