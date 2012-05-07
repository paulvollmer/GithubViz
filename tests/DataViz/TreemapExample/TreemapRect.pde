
class TreemapRect extends Interaction {

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
      col = 0xFF00FF00;
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
    }
    
    fill(1);
    //text(str(value), x1+6, y1+20);  //(we don't care about the actual value now that we have the pcnt...)
    text(myPcntStr, x1+(w1/2)-10, y1+(h1/2)+5);
*/
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

