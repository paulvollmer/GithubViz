/* GITHUBVIZ */
/*
 * Useful links:
 * JSON structure: http://develop.github.com/p/repo.html
 * Commit API v2: http://develop.github.com/p/commits.html
 */

		var repoTagsLoaded = false;
		var repoBranchesLoaded = false;
   		
   		var userData = new Array();
   		

   		
   		//function loadData(dataType, )
   		function loadBasicUserData(theUserName){
			if(userExists(theUserName)){
				$('document').log("user " + theUserName + " exits - no need to fetch data!");
				displayUserData(getUser(theUserName));
			}
			else{
	   			var user = new GitHub.User(theUserName);
				userData.push(user);
				user.load('basic', 'followers', 'following', 'repos', function(data){
					if(curView == viewEnum.REPO){
						setCurRepo(curRepoUrlParam);
						requestRepoData(curRepoUrlParam);
					}
					displayUserData(data);
				});
				
			}
   		}
   		
   		function setCurRepo(repoName){
   			curRepo = getRepoByName(repoName);	
   		}
   		
   		function requestRepoData(repoName){
   			//alert('Requesting repo data');
   			var repo = getRepoByName(repoName);
   			if(repo != null){
   				repo.load('tags', 'branches', function(data){
   					tagsAndBranchesCallback(data);
   					repo.commits('master', function(commits) {	// will only load newest results, see page start for a link
						commitsCallback(commits);          // [GitHub.Commit]
					});
   				});
   				repo.issues('open', function(issues) {	//'open'
   					openIssuesCallback(issues);
   				});
   				repo.issues('closed', function(issues) {	//'closed'
   					closedIssuesCallback(issues);
   				});				
   			}
   			else{
   				alert('Repository "' + curRepo + '" not found!');
   			}
   			
   		}
   		
   		/*
   		 * Returns a repo object by its name
   		 * Repo has to be loaded already (using loadBasicUserData()).
   		 * If we have the repo object, we can request commits, issues and so on in the calling function.
   		 */
   		function getRepoByName(repoName){
   			var repos = getUser(curUser).repos;
   			for(var i=0; i<repos.length; i++){
   				if(repos[i].name.toLowerCase() != null && repos[i].name.toLowerCase() == repoName.toLowerCase()) return repos[i];
   			}	
   			return null;
   		}
   		
   		function getUser(theUserName){
   			for(var i=0; i<userData.length; i++){
   				if(userData[i].login.toLowerCase() != null && userData[i].login.toLowerCase() == theUserName.toLowerCase()) return userData[i];
   			}	
   			return null;
   		}
   		
		function userExists(theUserName){
   			for(var i=0; i<userData.length; i++){
   				if(userData[i].login.toLowerCase() != null && userData[i].login.toLowerCase() == theUserName.toLowerCase()) return true;
   			}	
   			return false;
   		}
