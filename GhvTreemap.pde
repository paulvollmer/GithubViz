/**
 * GhvTreemap.pde
 * GitHubViz
 *
 * Based on http://www.openprocessing.org/sketch/24548
 * In version 2C, instead of calculating exactly the raios of all possibilities,
 * we take a heuristic approach, and don't resplit if it's not bat (close to 1:1, square ratio).
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

class Treemap {
  
  //the total values of all elements together, just to write % on square.
  float totalValue = 0;

  Treemap(){}

  
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
      return 2; //TEMPORARY !!!!
    } 
    else { //it's a quite good ratio! we don't touch it OR, it's the last one, sorry, no choice.  
      return 1;
    }
  }
  
  
	/*
	 * Standard bubble sort algorithm
	 * It will edit the indexes array as well, so we now later what is where
	 */
	void bubbleSort(int[] arr, int[] indexes) {
	  boolean swapped = true;
	  int j = 0;
	  int tmp, tmpi;
	  while (swapped) {
	    swapped = false;
	    j++;
	    for (int i = 0; i < arr.length - j; i++) {                                       
	      if (arr[i] > arr[i + 1]) {                          
	        tmp = arr[i];        
	        arr[i] = arr[i + 1];        
	        arr[i + 1] = tmp;
	        tmpi = indexes[i];
	        indexes[i] = indexes[i + 1];
	        indexes[i + 1] = tmpi;
	        swapped = true;
	      }
	    }                
	  }
	}




  /**
   *
   */
  void makeBlock(int refX, int refY, int blockW, int blockH, int[] numbers, int[] indexes) {
    bubbleSort(numbers, indexes);// we sort the array from biggest to smallest value.
    numbers = reverse(numbers);
    indexes = reverse(indexes);

    //First we need to asses the optimal number of item to be used for block A
    // How do we do that?

    int nbItemsInABlock= getPerfectSplitNumber(numbers, blockW, blockH); //return the numbers of elements that should be taken for A block.

    int valueA = 0;//the biggest value
    int valueB = 0;//value B will correspond to the sum of all remmaining objects in array
    int indexA = 0;
    int indexB = 0;
    int[] numbersA = {}; //in the loop, we'll populate these two out of our main array.
    int[] numbersB = {};
    int[] indexesA = {}; //in the loop, we'll populate these two out of our main array.
    int[] indexesB = {};
    //int[] numbersA = new int[numbers.length-1]; //a new array excluding the big value.
    //int[] numbersB = new int[numbers.length-1]; //a new array excluding the big value of part A.

    for ( int i=0; i < numbers.length; i++ ) {
      if (i < nbItemsInABlock) {//item has to be placed in A array...
        numbersA = append(numbersA, numbers[i]);
        indexesA = append(indexesA, indexes[i]);
        valueA += numbers[i];
        indexA += indexes[i];
      } 
      else {
        numbersB = append(numbersB, numbers[i]);
        indexesB = append(indexesB, indexes[i]);
        valueB += numbers[i];
        indexB += indexes[i];
      }
    }
    float ratio = float(valueA) / float(valueB + valueA);
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

    if (numbersA.length >= 2) {//this mean there is still stuff in this arary...
      makeBlock(xA, yA, widthA, heightA, numbersA, indexesA);
    } 
    else {
      //if it's done, we add the B to display list, and that's it for recussivity, we return to main level...
      // the main function will then deal with all the data...
      ///////////////////////////////////////////////////////////////////////////////////////drawRect(xA, yA, widthA, heightA, valueA);
      //tRect.draw(xA, yA, widthA, heightA, valueA, indexA);
      rects[rectCount] = new TreemapRect(xA, yA, widthA, heightA, valueA, indexA);
      rectCount++;
    }


    if (numbersB.length >= 2) {//this mean there is still stuff in this arary...
      makeBlock(xB, yB, widthB, heightB, numbersB, indexesB);
    } 
    else {
      //if it's done, we add the B to display list, and that's it for recussivity, we return to main level...
      // the main function will then deal with all the data...
      ///////////////////////////////////////////////////////////////////////////////////////drawRect(xB, yB, widthB, heightB, valueB);
      //tRect.draw(xB, yB, widthB, heightB, valueB, indexB);
      rects[rectCount] = new TreemapRect(xB, yB, widthB, heightB, valueB, indexB);
      rectCount++;
    }
    //If it represent more than one value, we send the block B to be split again (recursivly)
  }
}