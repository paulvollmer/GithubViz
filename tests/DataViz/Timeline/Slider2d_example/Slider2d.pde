
class Slider2d {
  
  // Position and size of the slider
  int x, y, w, h;
  
  // min, max value of the Anchors
  float valueMin = 0.0;
  float valueMax = 1.0;
  
  Anchor leftAnchor;
  Anchor rightAnchor;
  
  Interaction interaction;
  
  
  
  
  Slider2d(){
    leftAnchor  = new Anchor();
    rightAnchor = new Anchor();
    interaction = new Interaction();
  }
  
  
  
  /**
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
  
  
  
  void draw(){
    fill(120);
    rect(x, y, w, h);
    
    leftAnchor.drawLeft(y);
    rightAnchor.drawRight(y);
    
    fill(0, 255, 255);
    beginShape();
    vertex(leftAnchor.x, y+h);
    vertex(leftAnchor.x, y);
    vertex(rightAnchor.x, y);
    vertex(rightAnchor.x, y+h);
    endShape();
  }
  
  
  
  void mousePressed(){
    leftAnchor.mousePressed(y);
    rightAnchor.mousePressed(y);
  }
  
  
  
  
  // calculate ärmchen  position
  float mapValueToPixel(float val){
    float temp = map(val, valueMin, valueMax, x, x+w);
    return temp;
  }
  
  
  float mapPixelToValue(){
    return map(mouseX, x, x+w, valueMin, valueMax);
  }
  
  
}

