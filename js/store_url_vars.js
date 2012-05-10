// store current view, current user and current repo from URL
		// i.e. discover.html?view=user&user=powder
		// STORE VIEW -------------------
		switch (getUrlVars()["view"]){
			case viewEnum.USER:
				curView = viewEnum.USER;
				break;
			case viewEnum.REPO:
				curView = viewEnum.REPO;
				break;				 
		}
		// STORE USER -------------------   
        curUser = getUrlVars()["user"].toLowerCase();
        // STORE REPO -------------------
        
       	if(getUrlVars()["repo"] != null) curRepoUrlParam = getUrlVars()["repo"].toLowerCase();
       	//alert('Current View: ' + curView + '\n' + 'currentUser: ' + curUser + '\n' + 'Current Repo: ' + curRepoUrlParam);