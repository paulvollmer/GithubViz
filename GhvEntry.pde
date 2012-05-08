var userData;
boolean userDataLoaded;
boolean repoDataLoaded;


/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SETUP
 * General display stuff
 */
void setup(){
 	size(800,600);  
 	smooth();
 	PFont fontA = loadFont("CordiaNew-18.vlw");
 	textFont(fontA, 14);
	userDataLoaded = repoDataLoaded = false;
}


/**
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DRAW
 * Processing Main Draw
 */
void draw(){
	background(cBgCanvas);	

	if(curView == viewEnum.USER && userDataLoaded){
		for(int i=0; i<rects.length; i++){
			rects[i].draw();
		}
	}	
	else if(curView == viewEnum.REPO && userDataLoaded & repoDataLoaded){}
}