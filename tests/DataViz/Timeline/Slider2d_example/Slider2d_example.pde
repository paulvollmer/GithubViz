
Slider2d slider;


void setup(){
  size(600, 600);
  smooth();
  
  slider = new Slider2d();
  slider.init(100, 100, width-200, 35, 0.3f, 0.7f);
  
}


void draw(){
  background(cBgCanvas);
  
  slider.draw();
  
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
