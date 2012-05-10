
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
  slider.init(50, height-50, width-100, 28, 0.0, 1.0);
  
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
  
  fill(#ff0000);
  for(int i=0; i<issues.length; i++){
    //println(map(testTime[i], 1000, 2000, slider.mapValueToPixel(slider.leftAnchor.value), 1.0));
    //ellipse(map(testTime[i], 1000, 2000, slider.mapValueToPixel(slider.leftAnchor.value), 1.0), 20, 10, 10);
    
    //if((slider.leftAnchor.value-0.5 * issues[i] <= minTimestamp)){// && slider.rightAnchor.value * issues[i] > maxTimestamp){
      
      // 
      ellipse(map(issues[i], map(slider.leftAnchor.value, 0.0, 1.0, minTimestamp, maxTimestamp),
                             map(slider.rightAnchor.value, 0.0, 1.0, minTimestamp, maxTimestamp),
                             0, width),
              20,
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
