
Slider2d slider;


int[] issues;
int minTimestamp = 1336070800;
int maxTimestamp = 1336613943;




void setup(){
  size(800, 400);
  smooth();
  
  issues = new int[20];
  for(int i=0; i<issues.length; i++){
    issues[i] = (int)map(i, 0, issues.length, minTimestamp, maxTimestamp);
    println("issues["+i+"] = " + issues[i]);
  }
  
  
  slider = new Slider2d();
  slider.init(50, height-50, width-100, 28, 0.3, 0.7);
  
}



/*void getMinTimestamp(){
  //minTimestamp
  
  for(int i=0; i<issues.length; i++){
    temp = issues[i];
    if(issues[i] < temp)
  }
}*/



void draw(){
  background(cBgCanvas);
  slider.draw();
  
  // example 1
  // wir zeichnen zwei ellipsen und mappen diwse auf unsere Anchor.
  
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
  
  
  // example 2
  // wir zeichnen ein array an ellipsen und zoomen mit den zwei Anchor grafisch in dieses Array.
  fill(cBgHover);
  for(int i=0; i<issues.length; i++){
    
    //if((slider.leftAnchor.value-0.5 * issues[i] <= minTimestamp)){// && slider.rightAnchor.value * issues[i] > maxTimestamp){
      
      // ghetto mapping
      // TODO: check this up
      ellipse(map(issues[i], map(slider.leftAnchor.value, 0.0, 1.0, minTimestamp, maxTimestamp),
                             map(slider.rightAnchor.value, 0.0, 1.0, minTimestamp, maxTimestamp),
                             0, width),
              height-100,
              10, 10);
    //}
    
  }
  
  
  
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
