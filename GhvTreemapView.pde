int[] numbers;
int[] indexes;
Treemap tm;
TreemapRect[] rects; // Here all TreemapRects are stored
int rectCount = 0;	// used for creating new elements within the index-array, will increment by time

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
  	println("nbItems = " + nbItems);
  	numbers = new int[nbItems];
    indexes = new int[nbItems];
  	for( int i=0; i < numbers.length; i++ ) {
    	numbers[i] = (userData.repos[i].watchers + userData.repos[i].forks);
		//numbers[i] = (int)random(1, 10000);
		indexes[i] = i;
		tm.totalValue += numbers[i]; //There's a problem here, the total is never accurate...
  	}
  	
	// Print indexes + values
	println("\nIndex \t Value");
	for(int i=0; i<nbItems; i++){
		println(indexes[i] + " \t "  + numbers[i]); 
	}
	// Calculate block sizes and strore in rects-array
	tm.makeBlock(10, 10, width-20, height-20, numbers, indexes);
}