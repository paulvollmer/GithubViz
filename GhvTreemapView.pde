/**
 * GhvTreemapView.pde
 * GitHubViz
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

int[] numbers;
int[] indexes;
Treemap tm;
TreemapRect[] rects; // Here all TreemapRects are stored
int rectCount = 0;	// used for creating new elements within the index-array, will increment by time
int treemapLineHeight = 20;

/**
 * NOTE: look at callback_handler.js
 * Will be called when Github-data request was successful
 * Init the treemap here
 */
void userDataReady(){
	userDataLoaded = true;	
	userData = getUser(getUrlVars()["user"]);
	tm = new Treemap();

  	int nbItems = userData.public_repo_count;
  	rects = new TreemapRect[nbItems];
    //int nbItems = nEntries;

	// Debugging Stuff
  	//println("nbItems = " + nbItems);
  	numbers = new int[nbItems];
    indexes = new int[nbItems];
  	for( int i=0; i < numbers.length; i++ ) {
    	numbers[i] = (userData.repos[i].watchers + userData.repos[i].forks);
		//numbers[i] = (int)random(1, 10000);
		indexes[i] = i;
		tm.totalValue += numbers[i]; //There's a problem here, the total is never accurate...
  	}
  	
	// Print indexes + values
	// Debugging Stuff
	//println("\nIndex \t Value");
	for(int i=0; i<nbItems; i++){
		// Debugging Stuff
		//println(indexes[i] + " \t "  + numbers[i]); 
	}
	// Calculate block sizes and strore in rects-array
	tm.makeBlock(0, 0, width, height, numbers, indexes);
}


void drawTreemap(){
	for(int i=0; i<rects.length; i++){
		rects[i].draw();
	}
}

void handleTreemapClick(){
	for(int i=0; i<rects.length; i++){
		if(pointInRect(mouseX, mouseY, rects[i].x, rects[i].y, rects[i].w, rects[i].h) == true){
			switchMode(viewEnum.REPO, curUser, rects[i].index); 
		}		
	}
}


boolean pointInRect(int mx, int my, int x, int y, int width, int height) {
    if(mx >= x && mx <= x+width && 
       my >= y && my <= y+height) {
      return true;
    } 
    else {
      return false;
    }
}
