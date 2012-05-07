

class Interaction {
  
  int x, y, w, h;
  
  
  Interaction(){}


  boolean overRect(int mx, int my, int x, int y, int width, int height) {
    if(mx >= x && mx <= x+width && 
       my >= y && my <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
 
  
}
