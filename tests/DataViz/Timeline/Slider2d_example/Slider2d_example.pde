
Slider2d slider;


void setup(){
  size(800, 400);
  smooth();
  
  slider = new Slider2d();
  slider.init(50, height-35, width-100, 35, 0.1f, 0.7f);
  
}



void draw(){
  background(cBgCanvas);
  slider.draw();
  
  // get the left-, rightAnchor.value and map it to an ellipse.
  float tempX1 = map(slider.leftAnchor.value, 0.0, 1.0, 0, width);
  float tempX2 = map(slider.rightAnchor.value, 0.0, 1.0, 0, width);
  // draw the ellipse
  fill(0xFFFFFF00);
  ellipse(tempX1, height/2, 20, 20);
  ellipse(tempX2, height/2, 20, 20);
  
  text("value: "+slider.leftAnchor.value, tempX1, height/2-20);
  text("value: "+slider.rightAnchor.value, tempX2, height/2+30);
  text("valueRange: "+slider.valueRange, 100, 100);
  
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
