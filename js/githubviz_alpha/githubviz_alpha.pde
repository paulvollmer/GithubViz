/**
 * GitHubViz
 */





User user;


/**
 * Main Processing Setup
 */
void setup() {
  // processing java
  size(800, 600);
  // processing javascript
  //size(window.innerWidth-20, window.innerHeight-250);

  smooth();
  noCursor();
  frameRate(60);

  user = new User();
  user.init("octocat", "https://github.com/images/error/octocat_happy.gif", "https://www.github.com/octocat", "monalisa octocat", "GitHub", "https://github.com/blog", "San Francisco", 5, 2, 20, 15, "2008-01-14T04:33:35Z", "User");
}


/**
 * Main Processing Draw
 */
void draw() {
  background(#4D4D4D);
  translate(20, 0);
  println(frameRate);
  
  user.draw();

  // red outline arround the canvas
  /*stroke(255, 0, 0);
   	noFill();
   	rect(1, 1, width-2, height-2);*/

  /*noStroke();
   fill(#3399FF);
   ellipse(mouseX, mouseY, 20, 20);*/
   
   // using the grid to debug layout raster issues
   //grid();
   
   // cursor function must be at the bottom of our draw code.
   cursor(mouseX, mouseY);
}


/**
 * Create our own cursor
 */
void cursor(int x, int y) {
  stroke(#3399FF);
  strokeWeight(2);
  noFill();
  line(x, y, x+10, y+10);
  line(x, y, x+5, y);
  line(x, y, x, y+5);
}




void grid() {
  for(int i=0; i<10; i++) {
    stroke(255, 255, 0);
    strokeWeight(1);
    noFill();
    rect(i*(width/10), 0, width/10, height);
  }
}
