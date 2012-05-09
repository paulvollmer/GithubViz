/**
 * Slider2d
 *
 * diese classe liefert einen 2d slider.
 * den 2d slider kann man an den enden über einen anchor einstellen.
 */
class Slider2d {
  
  // Position and size of the slider
  int x, y, w, h;
  
  // Die spanne zwischen leftAnchor und rightAnchor.
  float valueRange;
  
  // min, max value of the Anchors
  float valueMin = 0.0;
  float valueMax = 1.0;

  // Anchor classes for left and right anchor.
  Anchor leftAnchor;
  Anchor rightAnchor;
  
  
  Interaction interaction;
  
  
  
  
  Slider2d(){
    leftAnchor  = new Anchor();
    rightAnchor = new Anchor();
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
    
    leftAnchor.init(val1);
    rightAnchor.init(val2);
    leftAnchor.x = (int)mapValueToPixel(val1);
    rightAnchor.x = (int)mapValueToPixel(val2);
  }
  
  
  /**
   * draw the Slider
   */
  void draw(){
    noStroke();
    fill(120);
    rect(x, y, w, h);
    
    int yPadding = y+4;
    
    fill(cBgCanvas);
    beginShape();
    vertex(leftAnchor.x, yPadding+15);
    vertex(leftAnchor.x, yPadding);
    vertex(rightAnchor.x, yPadding);
    vertex(rightAnchor.x, yPadding+15);
    endShape();
    
    fill(cBgHover);
    leftAnchor.drawLeft(yPadding);
    rightAnchor.drawRight(yPadding);
  }
  
  
  
  void mousePressed(){
    leftAnchor.mousePressedLeft(y);
    
    if(leftAnchor.moving){
      leftAnchor.value = mapPixelToValue();
      
      /*if(leftAnchor.value > valueMin){
        leftAnchor.value = mapPixelToValue();
      } /*else {
        leftAnchor.value = 0.0;
        leftAnchor.moving = false;
      }*/
      
      if(leftAnchor.value > valueMax){
        leftAnchor.value = mapPixelToValue();
      }
    }
    
    rightAnchor.mousePressedRight(y);
    if(rightAnchor.moving){
      rightAnchor.value = mapPixelToValue();
    }
    
    // calculate the valueRange
    valueRange = rightAnchor.value - leftAnchor.value;
  }
  
  
  /**
   * mouseReleased
   */
  void mouseReleased(){
    leftAnchor.mouseReleased();
    rightAnchor.mouseReleased();
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
  
  
}

