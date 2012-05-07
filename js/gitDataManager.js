/* GITHUBVIZ */
   		
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
					displayUserData(data);
				});
				
			}
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
