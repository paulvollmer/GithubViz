
class Pie {
 
  
  /**
   * Constuctor
   */
  Pie() {}


  /**
   * Draw a pie chart
   */
  void draw(int posX, int posY, int diam, int var1, int var2) {
    int tempVar = var1 + var2;
    
    noStroke();
    
    // var1
    fill(#3399FF);
    ellipse(posX, posY, diam, diam);
    
    // var2
    if(var2 != 0) {
      float degree = map(var2, 0, tempVar, 0, 360);
      fill(#FFFFFF);
      arc(posX, posY, diam, diam, 0, radians(degree));
    }
  }
  
}
 








class CirclePie {
  
  // variables thet will be calculate at the init function,
  //to redice position calculation at draw.
  
  // ground circle
  int groundDiam;
  int groundX;
  int groundY;
  
  // circle 1
  int circle1_value;
  float circle1_diam;
  float circle1_x;
  float circle1_y;
  float circle1_typoX;
  float circle1_typoY;
  
  // circle 2
  int circle2_value;
  float circle2_diam;
  float circle2_x;
  float circle2_y;
  float circle2_typoX;
  float circle2_typoY;
  
  
  /**
   * Constuctor
   */
  CirclePie() {}
  
  
  /**
   * Initialize and calculate variables.
   */
  void init(int posX, int posY, int diam, int val1, int val2) {
    groundX = posX+diam/2;
    groundY = posY+diam/2;
    groundDiam = diam;
    
    circle1_value = val1;
    circle2_value = val2;
    
    int tempVar = val1 + val2;
    
    circle1_diam = map(val1, 0, tempVar, 0, diam);
    circle1_x = posX+circle1_diam/2;
    circle1_y = posY+diam/2;
    circle1_typoX = posX;
    circle1_typoY = posY+(diam-circle1_diam)/2;
    
    circle2_diam = map(val2, 0, tempVar, 0, diam);
    circle2_x = posX+circle1_diam+circle2_diam/2;
    circle2_y = posY+diam/2;
    circle2_typoX = posX+circle1_diam;
    circle2_typoY = posY+diam/2+(circle2_diam/2)+15;
  }
  
  
  
  /**
   * Draw
   */
  void draw() {
    noStroke();
    
    // ground
    fill(#383838);
    ellipse(groundX, groundX, groundDiam, groundDiam);
    
    // var1
    fill(#707070);
    ellipse(circle1_x, circle1_y, circle1_diam, circle1_diam);
    fill(#3399FF);
    text(circle1_value + " Followers", circle1_typoX, circle1_typoY);
    
    // var2
    if(circle2_value != 0) {
      fill(#999999);
      ellipse(circle2_x, circle2_y, circle2_diam, circle2_diam);
      fill(#3399FF);
      text(circle2_value + " Following", circle2_typoX, circle2_typoY);
    }
  }
  
}
