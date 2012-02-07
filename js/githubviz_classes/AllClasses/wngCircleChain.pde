/**
 *  wngCircleChain is developed by wrong-entertainment & powder
 *
 *
 *  Copyright 2011 Paul Vollmer & Tim Pulver
 *  paulvollmer.net
 *  vollmerpaul@yahoo.de
 *  timpulver.de
 *  pulver.tim@googlemail.com
 * 
 *  This file is part of GitHubViz software.
 *
 *  GitHubViz is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Lesser General Public License for more details.
 *  
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with GitHubViz. If not, see <http://www.gnu.org/licenses/>.
 * 
 *  @author     Paul Vollmer & Tim Pulver
 *  @modified   2012.02.07
 *  @version    0.1.2
 */



/*
wngCircleChain
Desc.......
 */



class wngCircleChain {

  // totalVal beinhaltet alle werte zusammengerechnet
  int totalVal;
  // val enthällt die werte aus dem daten array.
  int[] val;
  
  // position variables
  //int[] xCircle;
  int x, y, w, h;
  
  float[] ballDiam;
  float[] ballX;
  float temp;
  

  /**
   * Constuctor
   */
  wngCircleChain() {}


  /**
   * Initialize and calculate variables.
   * 
   */
  void init(int[] v, int tx, int ty, int tw, int th) {
    println("wngCircleChain");
    val = v;
    x = tx;
    y = ty;
    w = tw;
    h = th;
    
    // ballDiam und ballX array größe festlegen.
    ballDiam = new float[v.length];
    ballX = new float[v.length];
    
    
    // das datenpacket lesen und die grafik berechnen.
    
    // counte den gesammten betrag des daten arrays. das brauchen wir zum rechnen
    for(int i=0; i<val.length; i++) {
      totalVal = totalVal+val[i];
    }
    println("totalVal: " + totalVal);
    
    // wir mappen unseren wert auf die globale variable valDiam damit wir ihn in der draw zum zeichnen verwenden können.
    for(int i=0; i<val.length; i++) {
      ballDiam[i] = map(val[i],  0, totalVal, 0, w);
      println("ballDiam: " + ballDiam[i]);
    }
  
    for(int i=0; i<val.length; i++) {
      if(i > 0) {
        // berechnung für rectangles (rectMode upperleft corner)
        //ballX[i] = x+ballX[i-1]+ballDiam[i-1];
        // berechnung für rect-, ellipseMode center
        ballX[i] = (ballX[i-1]+ballDiam[i-1]/2) + (ballDiam[i]/2);
        println(ballX[i-1]);
      } else {
        ballX[i] = x;
      }
      
      println("ballX["+i+"]: "+ballX[i]);
  
  /*      temp = temp+ballDiam[i];
      // die position für jeden ball berechnen.
      ballX[i] = x+temp;//+ballX[i]+ballDiam[i];
      print("ballX: "+ballX[i]);
      
      println(" val"+i+": " + val[i] + " ballDiam: "+ballDiam[i]); */
    }
    //println("totalVal: " + totalVal);
    
  }





  /**
   * Draw
   */
  void draw() {
    //rect(x, y, w, h);
    
    //stroke(255, 0, 0);
    fill(#707070);
    for(int i=0; i<val.length; i++) {
      //rect(ballX[i], y, ballDiam[i], ballDiam[i]);
      
      ellipse(ballX[i]+(ballDiam[0]/2), y+100, ballDiam[i], ballDiam[i]);
    }
    fill(#4d4d4d);
    rect(x, y+h/2, w, h);
  }
   
}
