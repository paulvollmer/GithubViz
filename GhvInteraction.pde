/**
 * GhvInteraction.pde
 * GitHubViz
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

class Interaction {  
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