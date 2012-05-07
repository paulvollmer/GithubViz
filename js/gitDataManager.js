/* GITHUBVIZ */
   		
   		var userData = new Array();
   		

   		
   		//function loadData(dataType, )
   		function loadBasicUserData(theUserName){
			if(userExists(theUserName)) 
				$('document').log("user " + theUserName + " exits - no need to fetch data!");
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
   				if(userData[i].login != null && userData[i].login == theUserName) return userData[i];
   			}	
   			return null;
   		}
   		
		function userExists(theUserName){
   			for(var i=0; i<userData.length; i++){
   				if(userData[i].login != null && userData[i].login == theUserName) return true;
   			}	
   			return false;
   		}
