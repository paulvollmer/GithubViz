

int[] numbers;

Treemap tm;


void setup() {
  size( 600, 450 );
  //noLoop();
  smooth();

  tm = new Treemap();
  
  // FIRST, we generate an array with n number of random values.
  ///////////////////////////////////////////////////////////////
  int nbItems = 40; //floor(random(2,50));
  println("nbItems = "+nbItems);
  numbers = new int[nbItems];
  //totalValue = 0;
  for( int i=0; i <= numbers.length-1; i++ ) {
    float tempVal = random(3,1000);
    if(tempVal > 500) { // we tweak a bit the random to make sure we have an inverted bell curve (good for treemaps)
      tempVal = tempVal + (tempVal *random (1*3));
    }
    else {
      tempVal = tempVal / random(0, tempVal/500);
    }
    numbers[i] = floor(tempVal);
    println( tm.totalValue + " + " + numbers[i] + " = ...");
    tm.totalValue += numbers[i]; //There's a problem here, the total is never accurate...
    println("numbers = "  );
    println(numbers );
  }
  
  
  tm.init(numbers);
  
}



void draw() {
  background(1);

  // x, y, w, h, VALUE
  tm.makeBlock(10, 10, width-20, height-20, numbers);
}



void mousePressed() {
 // redraw();
}

