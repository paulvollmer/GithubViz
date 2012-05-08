
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
  int size = 20;
  
  
  Interaction interaction;
  
  
  
  Anchor(){
    interaction = new Interaction();
  }
  
  
  
  void init(float value){
    this.value = value;
    //println("[Anchor] Constructor");
    //println("         value = " + value);
  }
  
  
  
  /**
   * 
   */
  void drawLeft(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, size, size)){
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    beginShape();
    vertex(x, y);
    vertex(x, y+size);
    vertex(x-size, y);
    endShape();
  }
  
  
  
  /**
   * 
   */
  void drawRight(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, size, size)){
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    beginShape();
    vertex(x, y);
    vertex(x, y+size);
    vertex(x+size, y);
    endShape();
  }
  
  
  
  void mousePressed(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, size, size)){
      println("over");
      x = mouseX;
    }
  }
  
  
}
