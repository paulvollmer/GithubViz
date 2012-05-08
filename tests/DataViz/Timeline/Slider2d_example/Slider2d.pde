
class Slider2d {
  
  // Pos size for slider
  int x, y, w, h;
  
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

