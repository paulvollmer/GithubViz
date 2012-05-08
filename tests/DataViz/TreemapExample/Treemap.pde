

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

