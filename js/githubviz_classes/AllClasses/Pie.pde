

class Pie {

int x;
int y;
int diameter;
int value1;
int value2;
  
  /**
   * Constuctor
   */
  Pie() {}

  
  /**
   * Initialize pie chart
   */
  void init(int posX, int posY, int diam, int var1, int var2) {
	x = posX;
	y = posY;
	diameter = diam;
	value1 = var1;
	value2 = var2;
  }
	
  /**
   * Draw a pie chart
   */
  void draw() {
    int tempVar = value1 + value2;
    
    noStroke();
    
    // var1
    fill(#3399FF);
    ellipse(x, y, diameter, diameter);//ellipse(x, y, diameter, diameter);
    
    // var2
    if(value2 != 0) {
      float degree = map(value2, 0, tempVar, 0, 360);
      fill(#FFFFFF);
      arc(x, y, diameter, diameter, 0, radians(degree));
    }
  }
  
}
