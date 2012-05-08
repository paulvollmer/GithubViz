boolean viewChanged = false;
boolean userChanged = false;
boolean repoChanged = false;



// TREEMAP
int[] numbers;
Treemap tm;



void setup(){
  size(800,600);
  background(#4D4D4D);
  fill(255);
  noLoop();

  PFont fontA = loadFont("courier");
  textFont(fontA, 14);
}



void draw(){    
  println("Hello ErrorLog!########");


  // x, y, w, h, VALUE
  //tm.makeBlock(10, 10, width-20, height-20, numbers);
}



void drawFollower(int n){
	/*for(int i=0; i<n; i++){
		rect(random(0, width), random(0, height), 40, 40);
	}*/
	
	var userData = getUser(getUrlVars()["user"]);;
	println("### Log test");
	
	// make sure userData has been loaded already!!
	
	/*println("\nAccessing a Javascript Object from within P5: ");
	println("\nuserData =============================================================================");
	println("login          =   " + userData.login);
	println("id             =   " + userData.id);
	println("avatar_url     =   " + userData.avatar_url);
	println("gravatar_id    =   " + userData.gravatar_id);
	println("url            =   " + userData.url);
	println("name           =   " + userData.name);
	println("company        =   " + userData.company);
	println("blog           =   " + userData.blog);
	println("location       =   " + userData.location);
	println("email          =   " + userData.email);
	println("hireable       =   " + userData.hireable);
	println("bio            =   " + userData.bio);
	println("public_repos   =   " + userData.public_repo_count);
	println("public_gists   =   " + userData.public_gist_count);
	println("followers      =   " + userData.followers.length());
	println("following      =   " + userData.following.length());
	println("html_url       =   " + userData.html_url);
	println("created_at     =   " + userData.created_at);
	println("type           =   " + userData.type);
	
	println("\nrepoData =============================================================================");
	int tempL = userData.repos.length();
	for(int i=0; i<tempL; i++){
		println("\nrepo[" + userData.repos[i].name + "]");
		println("watchers      =   " + userData.repos[i].watchers);
		println("description   =   " + userData.repos[i].description);
		println("size          =   " + userData.repos[i].size);
		println("updated_at    =   " + userData.repos[i].updated_at);
		println("open_issues   =   " + userData.repos[i].open_issues);
	}*/
	
		tm = new Treemap();

		  // FIRST, we generate an array with n number of random values.
		  ///////////////////////////////////////////////////////////////
		  int nbItems = userData.public_repo_count; //floor(random(2,50));
		  println("nbItems = "+nbItems);
		  numbers = new int[nbItems];
		  //totalValue = 0;
		  for( int i=0; i <= numbers.length-1; i++ ) {
		    numbers[i] = (userData.repos[i].watchers + userData.repos[i].forks);
			tm.totalValue += numbers[i]; //There's a problem here, the total is never accurate...
		  }
		  tm.init(numbers);
		
	tm.makeBlock(10, 10, width-20, height-20, numbers);
	
	
	//alert('BÖAAAA');
	
	
	/*fill(0);
	rect(90, 90, 200, 200);
	fill(255);
	text("test", 100, 100);*/
}























class Interaction {  
  Interaction(){}
  boolean overRect(int mx, int my, int x, int y, int width, int height) {
    if(mx >= x && mx <= x+width && 
       my >= y && my <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}


/**
 * Based on
 * http://www.openprocessing.org/sketch/24548
 *
 * In version 2C, instead of calculating exactly the raios of all possibilities,
 * we take a heuristic approach, and don't resplit if it's not bat (close to 1:1, square ratio).
 */
class Treemap {
  TreemapRect tRect;
  
  //the total values of all elements together, just to write % on square.
  float totalValue = 0;

  Treemap(){}

  /**
   *
   */
  void init(int[] value) {
    println("INIT");
    
    tRect = new TreemapRect();
  }
  
  
  
  /**
   * FIND GOOD SPLIT NUMBER - advantagous block aspect ratio.
   *
   * This is where well'll need to calculate the possibilities
   * We'll need to calculate the average ratios of created blocks.
   * For now we just try with TWO for the sake of the new functionn...
   *
   * Let's just split in either one or two to start...
   */
  int getPerfectSplitNumber(int[] numbers, int blockW, int blockH) {
    //println("blockW = "+blockW);
    //println("blockH = "+blockH);

    int valueA = numbers[0]; //our biggest value
    int valueB = 0; //value B will correspond to the sum of all remmaining objects in array
    for ( int i=1; i < numbers.length; i++ ) {
      valueB += numbers[i];
    }

    float ratio = float(valueA) / float(valueB + valueA);

    int heightA, widthA;
    if (blockW >= blockH) {
      heightA = blockH;
      widthA  = floor(blockW * ratio);
    } 
    else {
      heightA = floor(blockH * ratio);
      widthA  = blockW;
    }

    float ratioWH = float(widthA) / float(heightA) ;
    float ratioHW = float(heightA) / float(widthA);
    float diff;

    if (widthA >= heightA) {// Larger rect //ratio = largeur sur hauteur,
      //we should spit vertically...
      diff = 1 - ratioHW ;
    } 
    else {//taller rectangle ratio
      diff = 1- ratioWH;
    }

    if ((diff > 0.5) && (numbers.length >= 3)) { //this is a bit elongated (bigger than 2:1 ratio)
      ///////////////println("======================--> 22222");
      return 2; //TEMPORARY !!!!
    } 
    else { //it's a quite good ratio! we don't touch it OR, it's the last one, sorry, no choice.  
      ////////////println("======================--> 11111");
      return 1;
    }

    //diff is the difference (between 0...1) to the square ratio.
    // 0 mean we have a square (don't touch, it's beautifull!)
    // 0.9 mean we have a very long rectangle.


    /* Previous ghetto mehod
     
     if(numbers.length >= 3){//if there are 3 elements or more in our array, we try fragmenting A for better RAtios.
     return 2;//the two is really hardcoded, we should calculate average ratios of all blocks...
     }else{
     return 1;
     } */
  }




  /**
   *
   */
  void makeBlock(int refX, int refY, int blockW, int blockH, int[] numbers) {
    // We sort the received array.
    numbers = reverse(sort(numbers));// we sort the array from biggest to smallest value.
    // println(numbers);

    //First we need to asses the optimal number of item to be used for block A
    // How do we do that?

    int nbItemsInABlock= getPerfectSplitNumber(numbers, blockW, blockH); //return the numbers of elements that should be taken for A block.

    int valueA = 0;//the biggest value
    int valueB = 0;//value B will correspond to the sum of all remmaining objects in array
    int[] numbersA = {}; //in the loop, we'll populate these two out of our main array.
    int[] numbersB = {};
    //int[] numbersA = new int[numbers.length-1]; //a new array excluding the big value.
    //int[] numbersB = new int[numbers.length-1]; //a new array excluding the big value of part A.

    for ( int i=0; i < numbers.length; i++ ) {
      if (i < nbItemsInABlock) {//item has to be placed in A array...
        numbersA = append(numbersA, numbers[i]);
        //numbersA[i] = numbers[i]; //we populate our new array of values, we'll send it recursivly...
        valueA += numbers[i];
      } 
      else {
        numbersB = append(numbersB, numbers[i]);
        //numbersB[i-nbItemsInABlock] = numbers[i]; //we populate our new array of values, we'll send it recursivly...
        valueB += numbers[i];
      }
    }
    float ratio = float(valueA) / float(valueB + valueA);

    /////////println("ratio = " + ratio);
    /////////println("A val = " + valueA);
    /////////println("B val = " + valueB);
    //now we split the block in two according to the right ratio...

    /////////////// WE SET THE X, Y, WIDTH, AND HEIGHT VALUES FOR BOTH RECTANGLES.

    int xA, yA, heightA, widthA, xB, yB, heightB, widthB;
    if (blockW > blockH) { //si plus large que haut...
      //we split vertically; so height will stay the same...

      xA = refX;
      yA = refY;// we draw the square in top right corner, so same value.
      heightA = blockH;
      widthA  = floor(blockW * ratio);

      xB = refX + widthA;
      yB = refY;
      heightB = blockH;
      widthB = blockW - widthA; //the remaining portion of the width...
    } 
    else {//tall rectangle, we split horizontally.
      xA = refX;
      yA = refY;// we draw the square in top right corner, so same value.
      heightA = floor(blockH * ratio);
      widthA  = blockW;

      xB = refX;
      yB = refY+ heightA;
      heightB = blockH - heightA;
      widthB = blockW; //the remaining portion of the width...
    }

    /////////////// END OF Block maths.

    // if the ratio of the A block is too small (elongated rectangle)
    // we take an extra value for the A sqare, don't draw it, then send the 2 element
    // it represents to this function (treat it recusvily as if it was a B block).
    // We dont care about the ratio of B block because they are divided after...

    //drawRect(xA, yA, widthA, heightA, valueA); //(x, y, width, height)
    //int pcntA = floor(valueA / float(valueA + valueB)*100);
    //int pcntB = floor(valueB / float(valueA + valueB)*100);
    /////////println("numbers.length = "+numbers.length);
    /////////println("numbersA.length = "+numbersA.length);
    /////////println("numbersB.length = "+numbersB.length);
    //We add the block A to the display List
    // for now, we just draw the thing, let's convert to OOP later...

    if (numbersA.length >= 2) {//this mean there is still stuff in this arary...
      makeBlock(xA, yA, widthA, heightA, numbersA);
    } 
    else {
      //if it's done, we add the B to display list, and that's it for recussivity, we return to main level...
      // the main function will then deal with all the data...
      ///////////////////////////////////////////////////////////////////////////////////////drawRect(xA, yA, widthA, heightA, valueA);
      tRect.draw(xA, yA, widthA, heightA, valueA);
    }


    if (numbersB.length >= 2) {//this mean there is still stuff in this arary...
      makeBlock(xB, yB, widthB, heightB, numbersB);
    } 
    else {
      //if it's done, we add the B to display list, and that's it for recussivity, we return to main level...
      // the main function will then deal with all the data...
      ///////////////////////////////////////////////////////////////////////////////////////drawRect(xB, yB, widthB, heightB, valueB);
      tRect.draw(xB, yB, widthB, heightB, valueB);
    }
    //If it represent more than one value, we send the block B to be split again (recursivly)
  }
}


class TreemapRect extends Interaction {

  int x, y, w, h;
  int value;
  
  int col;


  TreemapRect() {
    col = 0xFFFF0000;
  } 

  
  /**
   *
   */
  void init(int x, int y, int w, int h, int value, int col){
    //println("INIT");
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.value = value;
    this.col = col;
  }
  
  void calc(){
    println("calc");
  }
  

  /**
   *
   */
  void draw(int x, int y, int w, int h, int value) {
    stroke(1);
    if(overRect(mouseX, mouseY, x, y, w, h)){
      col = 0xFFFFFF00;
      if(mousePressed) col = 0xFF00FF00;
    } else {
      col = 0xFFFF0000;
    }
    fill(col);
    rect(x, y, w, h);
    
    /*String myPcntStr ;
    int myPcnt = int(round ((value / totalValue) *100)) ;
    float myPcntDecimal = int(round ((value / totalValue) *1000)) ;
    myPcntDecimal = myPcntDecimal/10;
    //myPcnt = floor (myPcnt);

    if (myPcntDecimal > 10) { //bigger than 10%, we round it up.
      myPcntStr = str(myPcnt) + "%";
    }
    else {
      myPcntStr = str (myPcntDecimal) + "%";
    }*/
    
    fill(0);
    text(value, x+6, y+20);  //(we don't care about the actual value now that we have the pcnt...)
    //text(myPcntStr, x1+(w1/2)-10, y1+(h1/2)+5);

    ///////////println("### totalValue = "+totalValue);
  }


  /**
   *
   */
  void mousePressed() {
    if(overRect(mouseX, mouseY, x, y, w, h)){
      println("OVER");
      col = 0xFF00FF00;
    } else {
      col = 0xFFFF0000;
    }
  
  }
  
  
}


