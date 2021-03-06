/**
 * GhvEntry.pde
 * GitHubViz
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

var userData;
boolean userDataLoaded;
boolean repoDataLoaded;
RepoView repoView;


/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SETUP
 */
void setup(){
 	size(document.body.clientWidth-42, (document.body.clientWidth-340)/16*9);
 	smooth();
 	PFont fontA = loadFont("CordiaNew-18.vlw");
 	textFont(fontA, 14);
	userDataLoaded = false;
	repoDataLoaded = false;
	repoView = new RepoView();
}


/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DRAW
 */
void draw(){
	background(cBgCanvas);
	
	if(curView == viewEnum.USER){
		if(userDataLoaded){
			drawTreemap();
		}
	}
	else if(curView == viewEnum.REPO){
		// CHANGE THIS!--v	
		//if(repoDataLoaded){
		if(true){
			repoView.drawRepoView();
		}			
	}
}


/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ MOUSE CLICKED
 */
void mouseClicked(){
	if(curView == viewEnum.USER){
		if(userDataLoaded){
			handleTreemapClick();
		}
	}
	else if(curView == viewEnum.REPO){	
		if(repoDataLoaded){}
	}			
} 


/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SWITCH MODE
 */
void switchMode(String view, String user, int index){
	//println("\n" + "Switching mode - view: " + view + ", user: " + user + ", repo-index: " + index + "..." + "\n");
	curView = view;
	curUser = user;
	curRepo = getUser(curUser).repos[index];
	curRepoUrlParam = curRepo.name;
	println("\n" + "Mode switched to: \n" + "curView: " + curView + "\n" + "curUser: " + curUser + "\n" + "curRepo: " + curRepo.name + "\n\n");
	repoView.init();
	requestRepoData(curRepo.name);
}