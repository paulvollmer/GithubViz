/**
 * GhvRepoView.pde
 * GitHubViz
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

boolean tagsAndBranchesAvailable = false;
boolean openIssuesAvailable = false;
boolean closedIssuesAvailable = false;
boolean commitsAvailable = false;
int minTimestamp, maxTimestamp;
Slider2d slider;

class RepoView{

	RepoView(){}
	void init(){
		println("Repo init called...");
		slider = new Slider2d();
  		slider.init(50, height-50, width-100, 28, 0.0, 1.0);
	}
	
	void drawRepoView(){
		println("[DRAW_REPO_VIEW] frameRate:\t" + frameRate);
		background(cBgCanvas);
		
		/*
		text(curRepo.name, 50, 50);
		if(allRepoDataAvailable()){
			var issues = getIssuesOpen();
			for(int i=0; i<issues.length; i++){
				text(issues[i].created_at + " - " + issues[i].timestamp, i*10, i*10);
			}
			var issuesCl = getIssuesClosed();
			for(int i=0; i<issuesCl.length; i++){
				text(issuesCl[i].created_at + " - " + issuesCl[i].timestamp, i*10, 200+i*10);
			}
		}
		*/
		if(allRepoDataAvailable()){
			fill(cBgHover);
			var commits = curRepo.commits;
			/*
			println("\n\n" + "minTimestamp: " + minTimestamp + "\n" + "maxTimestamp: " + maxTimestamp + "\n");
			for(int i=0; i<commits.length; i++){
				text(commits[i].timestamp, 300+i*10, i*10);
			}
			println("commits.length: " + commits.length);
			*/
			for(int i=0; i<commits.length; i++){
				ellipse(map(	commits[i].timestamp, 
								minTimestamp, 
								maxTimestamp, 
				            	-slider.leftAnchor.value*(width-1), 
				            	width-1+(1-slider.rightAnchor.value)*(width-1)), 
	    			100, 20, 20);
			}
		}
		
		slider.draw();
	}
	
	void mousePressed(){
	  slider.mousePressed();
	}
	
	
	
	void mouseDragged(){
	  slider.mouseDragged();
	}
	
	
	
	void mouseReleased(){ 
	  slider.mouseReleased();
	}
	
	
	void keyPressed(){
	  slider.keyPressed();
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
	}
}	

/*
 * Gets called, when commits for curRepo are loaded
 * We don't have a callback for the detailed commit call, yet,
 * so accessing i.m. modified will result in undefined!!
 */
void commitsReady(){
	println("Commits ready");
	commitsAvailable = true;	// detailed infos are only available later - ghetto
	var commits = curRepo.commits;
	for(int i=0; i<commits.length; i++){
		commits[i].load('detailed');
	}
	if(allRepoDataAvailable()){
		addTimestamps();
	}
}



/*
 * Checks if all repo-data for curRepo is loaded already.
 * Sets minTimestamp and maxTimestamp
 */
boolean allRepoDataAvailable(){
	return tagsAndBranchesAvailable && openIssuesAvailable && closedIssuesAvailable && commitsAvailable;    
}

void addTimestamps(){
	int minTs, maxTs;	// min timestamp, max timestamp, we will store this later
	
	// add timestamp to closed issues
	var issuesClosed = getIssuesClosed();
	// just init minTs and maxTs with first date
	minTs = getTimestamp(issuesClosed[0].created_at);
	maxTs = minTs;
	for(int i=0; i<issuesClosed.length; i++){
		issuesClosed[i].timestamp = getTimestamp(issuesClosed[i].created_at);
		if(issuesClosed[i].timestamp < minTs) minTs = issuesClosed[i].timestamp;		
		if(issuesClosed[i].timestamp > maxTs) maxTs = issuesClosed[i].timestamp;
	}
	// add timestamp to open issues
	var issuesOpen = getIssuesOpen();
	for(int i=0; i<issuesOpen.length; i++){
		issuesOpen[i].timestamp = getTimestamp(issuesOpen[i].created_at);
		if(issuesOpen[i].timestamp < minTs) minTs = issuesOpen[i].timestamp;		
		if(issuesOpen[i].timestamp > maxTs) maxTs = issuesOpen[i].timestamp;
	}
	// add timestamp to commits
	var commits = curRepo.commits;
	for(int i=0; i<commits.length; i++){
		commits[i].timestamp = getTimestamp(commits[i].committed_date);
		if(commits[i].timestamp < minTs) minTs = commits[i].timestamp;		
		if(commits[i].timestamp > maxTs) maxTs = commits[i].timestamp;
	}
	/* ADD THE REST HERE - COMMITS & CO DEPENDING ON WHAT WE NEED... */
	/*
	minTimestamp = minTs;	// Store globally
	maxTimestamp = maxTs;
	*/
	// GHETTO - using commit-dates as timestamp-boundaries
	minTimestamp = commits[commits.length-1].timestamp;
	maxTimestamp = commits[0].timestamp;
	println("minTimestamp: " + minTimestamp);
	println("maxTimestamp: " + maxTimestamp);
}