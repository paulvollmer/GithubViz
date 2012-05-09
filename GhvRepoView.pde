boolean tagsAndBranchesAvailable = false;
boolean openIssuesAvailable = false;
boolean closedIssuesAvailable = false;
boolean commitsAvailable = false;

class RepoView{

	RepoView(){}
	void init(){
		println("Repo init called...");
	}
	
	void drawRepoView(){
		text(curRepo.name, 50, 50);
		if(allRepoDataAvailable()){
			//println("All repodata POW!");
			println("before issues open");
			var issues = getIssuesOpen();
			for(int i=0; i<issues.length; i++){
				text(issues[i].created_at + " - " + issues[i].timestamp, i*10, i*10);
			}
			println("before issues closed");
			var issuesCl = getIssuesClosed();
			for(int i=0; i<issuesCl.length; i++){
				text(issuesCl[i].created_at + " - " + issuesCl[i].timestamp, i*10, 200+i*10);
			}
		}
	}
}

/*
 * Gets called, when tags and branches for curRepo have been loaded
 */
void tagsAndBranchesReady(){
	println("Tags and Branches ready!");
	tagsAndBranchesAvailable = true;
	if(allRepoDataAvailable()){
		addTimestamps();
		//getTimestampBorders();
	}	
}

/*
 * Gets called, when open issues for curRepo have been loaded
 */
void openIssuesReady(){
	println("Issues ready (open)!");
	openIssuesAvailable = true;
	if(allRepoDataAvailable()){
		addTimestamps();
		//getTimestampBorders();
	}
}

/*
 * Gets called, when closed issues for curRepo are loaded
 */
void closedIssuesReady(){
	println("Issues ready (closed)!");
	closedIssuesAvailable = true;
	if(allRepoDataAvailable()){
		addTimestamps();
		//getTimestampBorders();
	}
}	

/*
 * Gets called, when commits for curRepo are loaded
 */
void commitsReady(){
	println("Commits ready");
	commitsAvailable = true;
	if(allRepoDataAvailable()){
		addTimestamps();
		//getTimestampBorders();
	}
}


/*
 * Checks if all repo-data for curRepo is loaded already.
 */
boolean allRepoDataAvailable(){
	return tagsAndBranchesAvailable && openIssuesAvailable && closedIssuesAvailable && commitsAvailable;    
}

void addTimestamps(){
	// add timestamp to closed issues
	var issuesClosed = getIssuesClosed();
	for(int i=0; i<issuesClosed.length; i++){
		issuesClosed[i].timestamp = getTimestamp(issuesClosed[i].created_at);
	}
	// add timestamp to open issues
	var issuesOpen = getIssuesOpen();
	for(int i=0; i<issuesOpen.length; i++){
		issuesOpen[i].timestamp = getTimestamp(issuesOpen[i].created_at);
	}
	// add timestamp to open issues
	var issuesOpen = getIssuesOpen();
	for(int i=0; i<issuesOpen.length; i++){
		issuesOpen[i].timestamp = getTimestamp(issuesOpen[i].created_at);
	}
	/* ADD THE REST HERE - COMMITS & CO DEPENDING ON WHAT WE NEED... */
}