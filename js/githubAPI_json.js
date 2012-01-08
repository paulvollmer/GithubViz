/**
 * get url variables
 */
function getUrlVars(){
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++){
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}





/*
 * Creates an unordered list containing Github user data.
 * Will be placed inside a div-element with id "githubAPI_userinfo"
 */
var gitUsername = getUrlVars()["user"];
var gitBaseUrl = "http://github.com/api/v2/json/";
var gitUserUrl = "user/show/";
var gitRepoUrl = "repos/show/";
var callback = "?callback=?";	
var gravatarUrl = "http://www.gravatar.com/avatar/";

$.getJSON(gitBaseUrl + gitUserUrl + gitUsername + callback,
function(json, statuts) {			
	var user_data = json.user;
	
	/*if(statuts == "success") {
	} else {
		alert("Your Username is not correct!");
	}*/
	
	// TODO: fix whitespace bug (if no whitespace available, table style broken.)
	$("#githubAPI_userinfo").append("<table id='githubAPI_userinfo-list'></table>");
   if(user_data.company != null) {
		$("#githubAPI_userinfo-list").append(" <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Company:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.company + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.name != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Name:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.name + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.created_at != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Created at:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.created_at + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.location != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Location:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.location + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.public_repo_count != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Public Repositories:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.public_repo_count + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.public_gist_count != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Public Gist:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.public_gist_count + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.blog != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Blog:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.blog + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.following_count != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Following:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.following_count + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.id != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>ID:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.id + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.type != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Type:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.type + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.permission != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Permission:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.permission + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.followers_count != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Followers:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.followers_count + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	if(user_data.login != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Login:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.login + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
		
		$("#githubAPI_username").append(user_data.login);
	}
	if(user_data.email != null) {
		$("#githubAPI_userinfo-list").append("  <tr>");
		$("#githubAPI_userinfo-list").append("    <th>Email:</th>");
		$("#githubAPI_userinfo-list").append("    <th>" + user_data.email + "</th>");
		$("#githubAPI_userinfo-list").append("  </tr>");
	}
	
	if(user_data.gravatar_id != null) {
		$('#githubAPI_usergravatar').prepend('<img id="githubAPI_gravatar" src="' + gravatarUrl + user_data.gravatar_id + '" />');
   }

});
