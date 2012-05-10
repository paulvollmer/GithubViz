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
	Processing.logger = console
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

void mousePressed(){
	if(curView == viewEnum.REPO){
		repoView.mousePressed();
	}
}



void mouseDragged(){
	if(curView == viewEnum.REPO){
		repoView.mouseDragged();
	}
}



void mouseReleased(){ 
	if(curView == viewEnum.REPO){
		repoView.mouseReleased();
	}
}


void keyPressed(){
	if(curView == viewEnum.REPO){
		repoView.keyPressed();
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
	//userDataLoaded = false;
	repoDataLoaded = false;
	curView = view;
	curUser = user;
	curRepo = getUser(curUser).repos[index];
	curRepoUrlParam = curRepo.name;
	println("\n" + "Mode switched to: \n" + "curView: " + curView + "\n" + "curUser: " + getUser(curUser).name + "\n" + "curRepo: " + curRepo.name + "\n\n");
	repoView.init();
	requestRepoData(curRepo.name);
}