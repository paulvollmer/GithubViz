
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
  
  //drawColorSet();
  
  fill(0, 255, 255);
  ellipse(map(slider.leftAnchor.value, 0.0, 1.0, 0, width), height/2,
          20, 20);
  ellipse(map(slider.rightAnchor.value, 0.0, 1.0, 0, width), height/2,
          20, 20);
}



void mousePressed(){
  slider.mousePressed();
}



void mouseDragged(){
  slider.mousePressed();
  
  println("### leftAnchor.value  = " + slider.leftAnchor.value);
  println("### rightAnchor.value = " + slider.rightAnchor.value);
}



void mouseReleased(){ 
  slider.mouseReleased();
}
