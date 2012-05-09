/**
 * Slider2d
 * GitHubViz
 *
 * Diese classe liefert einen 2d slider.
 * den 2d slider kann man an den enden über einen anchor einstellen.
 *
 * @author     Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * @version    1.0.1b
 * @modified   2012.05.09
 */



class Slider2d {
  
  // Class we need
  Interaction interaction;
  Anchor leftAnchor;          // Anchor classes for left and right anchor.
  Anchor rightAnchor;
  
  
  int x, y, w, h;             // Position and size of the slider
  float valueRange;           // Die spanne zwischen leftAnchor und rightAnchor.
  boolean valueRangeMoving;   // Dieser bool ist unser moving modus verantwortlich. true wenn
                              // die maus gepresst im bereich zwichen den Anchors ist.
  
  float valueMin = 0.0;       // min, max value of the Anchors
  float valueMax = 1.0;  
  
  
  
  
  /**
   * Constructor
   */
  Slider2d(){
    interaction = new Interaction();
  }
  
  
  
  
  
  /**
   * Initialize the Silder2d
   *
   * @param x x-position
   * @param y y-position
   * @param w width of the slider
   * @param h height of the slider
   * @param val1 Value of left Anchor
   * @param val2 Value of right Anchor
   */
  void init(int x, int y, int w, int h, float val1, float val2){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    leftAnchor  = new Anchor(val1);
    rightAnchor = new Anchor(val2);
    leftAnchor.x = (int)mapValueToPixel(val1);
    rightAnchor.x = (int)mapValueToPixel(val2);
    
    // berechne die aktuelle valueRange
    calcValueRange();
    
    // Debugging stuff
    /*println("[Slider2d] Constructor");
    println("[Slider2d] x                  =   " + this.x);
    println("[Slider2d] y                  =   " + this.y);
    println("[Slider2d] width              =   " + this.w);
    println("[Slider2d] height             =   " + this.h);
    println("[Slider2d] valueRange         =   " + valueRange);
    println("[Slider2d] valueRangeMoving   =   " + valueRangeMoving);
    println("[Slider2d] valueMin           =   " + valueMin);
    println("[Slider2d] valueMax           =   " + valueMax);*/
  }
  
  
  /**
   * draw the Slider
   */
  void draw(){
    // ground rect
    noStroke();
    fill(#555555);
    rect(x, y, w, h);
    
    // eine weitere möglichkeit als begrenzung sind linien am anfang nd ende des Slider2d.
    /*noFill();
    stroke(120);
    line(x, y, x, y+h);
    line(x+w, y, x+w, y+h);*/
    
    
    // 
    int yPadding = y+4;
    noStroke();
    
    if(interaction.overRect(mouseX, mouseY,leftAnchor.x+leftAnchor.anchorSize, yPadding, rightAnchor.x-leftAnchor.x-(leftAnchor.anchorSize*2), 15)){
      fill(cHover);
      if(mousePressed){
        println("[Slider2d] range bar pressed");
      }
    } else {
      fill(#9B9B9B);
    }
    beginShape();
    vertex(leftAnchor.x, yPadding+leftAnchor.anchorSize);
    vertex(leftAnchor.x, yPadding);
    vertex(rightAnchor.x, yPadding);
    vertex(rightAnchor.x, yPadding+rightAnchor.anchorSize);
    endShape();
    
    // Draw the Anchors
    fill(cBgHover);
    leftAnchor.drawLeft(yPadding, x);
    rightAnchor.drawRight(yPadding, x+w);
  }
  
  
  
  void mousePressed(){
    leftAnchor.mousePressedLeft(y);
    rightAnchor.mousePressedRight(y);
    
    // Anchor stuff
    if(leftAnchor.moving){
      leftAnchor.value = mapPixelToValue();
      // calculate the valueRange
      calcValueRange();
    }
    else if(rightAnchor.moving){
      rightAnchor.value = mapPixelToValue();
      // calculate the valueRange
      calcValueRange();
    }
    
    // Range bar
    /*if(){
      
    }*/
    
  }
  
  
  /**
   * mouseReleased
   */
  void mouseReleased(){
    leftAnchor.mouseReleased();
    rightAnchor.mouseReleased();
    
    valueRangeMoving = false;
  }
  
  
  /**
   * keyPressed
   * TODO use key to navigate between range
   */
  void keyPressed(){
    if (key == CODED) {
      
      if (keyCode == LEFT) {
        println("[Slider2d] keyPressed LEFT");
      } else if (keyCode == RIGHT) {
        println("[Slider2d] keyPressed RIGHT");
      } 
      
    } else {
      println("[Slider2d] keyPressed");
      
    }
  }
  
  
  
  /**
   * mapValueToPixel
   * calculate ärmchen  position
   */
  float mapValueToPixel(float val){
    float temp = map(val, valueMin, valueMax, x, x+w);
    return temp;
  }
  
  
  /**
   * mapPixelToValue
   */
  float mapPixelToValue(){
    return map(mouseX, x, x+w, valueMin, valueMax);
  }
  
  
  /**
   * Calculate value range
   * With this method we calculate the size between leftAnchor and
   * rightAnchor.
   */
  void calcValueRange(){
    valueRange = rightAnchor.value - leftAnchor.value;
    println("[Slider2d] calcValueRange = " + valueRange);
  }
  
  /**
   * Calculate the value range width in pixel
   * This value we need for the interaction overRect.
   */
  int calcValueRangePixelWidth(){
    int temp = rightAnchor.x - leftAnchor.x;
    println("[Slider2d] calcValueRangePixelWidth = " + temp);
    
    return temp;
  }
  
  
}

