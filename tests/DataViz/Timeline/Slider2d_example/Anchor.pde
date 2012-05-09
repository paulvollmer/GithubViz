/**
 * Anchor
 * GitHubViz
 *
 * Diese klasse benutzen wir für unseren Slider.
 * der Anchor wird rechts und links benutzt um den silder zu bedienen.
 *
 * @author     Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * @version    1.0.1
 * @modified   2012.05.09
 */
 
 
 
class Anchor {
  
  // Class we need
  Interaction interaction;
  
  
  float value;           // Value of our anchor
  int x;                 // position of the anchor
  int anchorSize = 20;   // size of the anchor
  boolean moving;        // true, if the anchor is moving at the moment
  
  
  
  
  
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
    println("value        =   " + value);
    println("x            =   " + x);
    println("anchorSize   =   " + anchorSize);
    println("moving       =   " + moving);
  }
  
  
  /**
   * Draw left Anchor
   * 
   * param y
   *       y position of the anchor.
   */
  void drawLeft(int y){
    if(moving){
      x = mouseX;
      fill(cBlack);
    } else if(interaction.overRect(mouseX, mouseY, x-anchorSize, y, anchorSize, anchorSize)) {
      fill(cHover);
    } else {
      fill(cWhite);
    }
    beginShape();
    vertex(x, y);
    vertex(x, y+anchorSize);
    vertex(x-anchorSize, y);
    endShape();
  }
  
  
  /**
   * Draw right Anchor
   *
   * param y
   *       y position of the anchor.
   */
  void drawRight(int y){
    if(moving){
      x = mouseX;
      fill(cBlack);
    } else if(interaction.overRect(mouseX, mouseY, x, y, anchorSize, anchorSize)) {
      fill(cHover);
    } else {
      fill(cWhite);
    }
    beginShape();
    vertex(x, y);
    vertex(x, y+anchorSize);
    vertex(x+anchorSize, y);
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
    if(interaction.overRect(mouseX, mouseY, x-anchorSize, y, anchorSize, anchorSize)){
      moving = true;
    }
  }
  
  void mousePressedRight(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, anchorSize, anchorSize)){
      moving = true;
    }
  }
  
  
  
  /**
   * bei released beenden wir das moving verhalten.
   */
  void mouseReleased(){
    moving = false;
  }
  
  
}
