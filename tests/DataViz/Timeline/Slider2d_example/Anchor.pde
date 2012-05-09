
/**
 * Diese klasse benutzen wir für unseren Slider.
 * der Anchor wird rechts und links benutzt um den silder zu bedienen.
 
 
 */
class Anchor {
  
  // Value of our anchor
  float value;
  // position of the anchor
  int x;
  // size of the anchor
  int anchorSize = 20;
  
  boolean moving;
  
  
  Interaction interaction;
  
  
  
  Anchor(){
    interaction = new Interaction();
    moving = false;
  }
  
  
  
  void init(float value){
    this.value = value;
    //println("[Anchor] Constructor");
    //println("         value = " + value);
  }
  
  
  
  /**
   * linker Anchor
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
   * linker Anchor
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
   * bei dem input müssen wir die breite des anchors von dem x wert abziehen. (x-anchorSize)
   */
  void mousePressedLeft(int y){
    if(interaction.overRect(mouseX, mouseY, x-anchorSize, y, anchorSize, anchorSize)){
      println("over");
      moving = true;
    }
  }
  
  void mousePressedRight(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, anchorSize, anchorSize)){
      println("over");
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
