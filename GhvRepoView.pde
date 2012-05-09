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
		if(closedIssuesAvailable){
			var issues = getIssuesOpen();
			for(int i=0; i<issues.length; i++){
				text(issues[i].created_at, i*10, i*10);
			}
		}
	}
}

void tagsAndBranchesReady(){
	println("Tags and Branches ready!");
	tagsAndBranchesAvailable = true;
}

void openIssuesReady(){
	println("Issues ready (open)!");
	openIssuesAvailable = true;
}

void closedIssuesReady(){
	println("Issues ready (closed)!");
	closedIssuesAvailable = true;
}	

void commitsReady(){
	println("Commits ready");
	commitsAvailable = true;
}