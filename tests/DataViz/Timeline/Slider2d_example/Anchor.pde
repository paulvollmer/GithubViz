
/**
 * Diese klasse benutzen wir für unseren Slider"d.
 * der Anchor wird rechts und links benutzt um den silder zu bedienen.
 
 
 */
class Anchor {
  
  // Value of our anchor
  float value;
  // position of the anchor
  int x;
  // size of the anchor
  int size = 20;
  
  boolean state;
  
  
  Interaction interaction;
  
  
  
  Anchor(){
    interaction = new Interaction();
    state = false;
  }
  
  
  
  void init(float value){
    this.value = value;
    //println("[Anchor] Constructor");
    //println("         value = " + value);
  }
  
  
  
  /**
   * h = size of the anchor
   */
  void drawLeft(int y){
    if(state){
      x = mouseX;
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    beginShape();
    vertex(x, y);
    vertex(x, y+size);
    vertex(x-size, y);
    endShape();
    
    state = false;
  }
  
  
  
  /**
   * h = size of the anchor
   */
  void drawRight(int y){
    if(state){
      x = mouseX;
      fill(255, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    beginShape();
    vertex(x, y);
    vertex(x, y+size);
    vertex(x+size, y);
    endShape();
    
    state = false;
  }
  
  
  
  void mousePressed(int y){
    if(interaction.overRect(mouseX, mouseY, x, y, size, size)){
      println("over");
      state = true;
    } else {
      state = false;
    }
  }
  
  
}
