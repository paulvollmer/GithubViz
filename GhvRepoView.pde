
class RepoView{

	RepoView(){}
	void init(){
		println("Repo init called...");
	}
	
	void drawRepoView(){
		text(curRepo.name, 50, 50);
	}
}

void tagsAndBranchesReady(){
	println("Tags and Branches ready!");
}

void openIssuesReady(){
		println("Issues ready (open)!");
}

void closedIssuesReady(){
		println("Issues ready (closed)!");
}	

void commitsReady(){
	println("Commits ready");
}