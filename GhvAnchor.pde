/**
 * Anchor
 * GitHubViz
 *
 * Diese klasse benutzen wir für unseren Slider.
 * der Anchor wird rechts und links benutzt um den silder zu bedienen.
 *
 * @author     Paul Vollmer <paul.vollmer@fh-potsdam.de>
 *             Tim Pulver <tim.pulver@fh-potsdam.de>
 * @version    1.0.1d
 * @modified   2012.05.10
 */
 
 
 
class Anchor {
  
  // Class we need
  Interaction interaction;
  
  
  float value;           // Value of our anchor
  int x;                 // position of the anchor
  int anchorSize = 20;   // size of the anchor
  boolean moving;        // true, if the anchor is moving at the moment
  Anchor theOther;
  
  
  
  
  
  /**
   * Constructor
   * Initialize the Interaction class and set variables.
   *
   * @param value
   *        An input value. this we need to calculate the position.
   */
  Anchor(float value){
    interaction = new Interaction();
    
    this.value = value;
    moving = false;
    
    // Debugging stuff
    /*println("[Anchor] Constructor");
    println("[Anchor] value        =   " + value);
    println("[Anchor] x            =   " + x);
    println("[Anchor] anchorSize   =   " + anchorSize);
    println("[Anchor] moving       =   " + moving);*/
  }
  
  /**
   * Draw left Anchor
   * 
   * @param y
   *        y position of the anchor.
   * @param minX
   *        Minimum x position of the anchor.
   */
  void drawLeft(int y, int minX){
    anchorDraw(y, x+anchorSize/2, x, moving && mouseX > minX);
  }
  
  
  /**
   * Draw right Anchor
   *
   * @param y
   *        y position of the anchor.
   * @param maxX
   *        Maximum x position of the anchor.
   */
  void drawRight(int y, int maxX){
     anchorDraw(y, x-anchorSize/2, x-anchorSize, moving&&mouseX<maxX);
  }
  
  
  
  /**
   *
   */
  void anchorDraw(int y, int i, int inter, boolean val){
    if(val){
      x = mouseX;
      fill(cBlack);
    } else {
      moving = false;
    }
    
    // hover
    if(interaction.overRect(mouseX, mouseY, inter, y, anchorSize, anchorSize)) {
      fill(cHover);
    }
    else {
      fill(cWhite);
    }
    
    
    beginShape();
    vertex(x, y);
    vertex(i, y+anchorSize/2);
    vertex(x, y+anchorSize);
    endShape();
  }
  
  
  
  /**
   * Wir brauchen eine mousePressedLeft für eine andere interaction.overRect
   * bei dem input müssen wir die breite des anchors von dem x-position wert abziehen. (x-anchorSize)
   *
   * param y
   *       y position of the anchor.
   */
  void mousePressedLeft(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, anchorSize, anchorSize)){
      moving = true;
      //println("mousePressedLeft");
    }
  }
  
  void mousePressedRight(int y){
    if(interaction.overRect(mouseX, mouseY, x-anchorSize, y, anchorSize, anchorSize)){
      moving = true;
      //println("mousePressedRight");
    }
  }
  
  
  
  /**
   * bei released beenden wir das moving verhalten.
   */
  void mouseReleased(){
    moving = false;
  }
  
  
}
