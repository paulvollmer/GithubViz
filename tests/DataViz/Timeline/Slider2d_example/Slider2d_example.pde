
Slider2d slider;


void setup(){
  size(800, 400);
  smooth();
  
  slider = new Slider2d();
  slider.init(50, height-50, width-100, 28, 0.1f, 0.7f);
  
}



void draw(){
  background(cBgCanvas);
  slider.draw();
  
  // get the left-, rightAnchor.value and map it to an ellipse.
  float tempX1 = map(slider.leftAnchor.value, 0.0, 1.0, 0, width);
  float tempX2 = map(slider.rightAnchor.value, 0.0, 1.0, 0, width);
  // draw the ellipse
  fill(0xFFFFFF00);
  ellipse(tempX1, 60, 20, 20);
  ellipse(tempX2, 85, 20, 20);
  
  text("valueRange: "+slider.valueRange, 20, 40);
  text("value 1: "+slider.leftAnchor.value, tempX1+14, 64);
  text("value 2: "+slider.rightAnchor.value, tempX2+14, 89);
  
  // Display the colors from GhvColors
  //drawColorSet();
}



void mousePressed(){
  slider.mousePressed();
}



void mouseDragged(){
  slider.mousePressed();
}



void mouseReleased(){ 
  slider.mouseReleased();
}


void keyPressed(){
  slider.keyPressed();
}
