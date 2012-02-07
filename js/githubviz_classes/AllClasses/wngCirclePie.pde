/**
 *  wngCirclePie is developed by wrong-entertainment & powder
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
CirclePie
Die klasse circlePie ist für zwei werte gebaut und zeichnet einen
grossen circle mit zwei weiteren enthalten. Diese zwei weitere kreise
weden auf ihre werte angepasst und der draw bereich wird berechnet
(größe des jeweiligen kreises).
 */



class wngCirclePie {

  // variables thet will be calculate at the init function,
  // to min. position calculation at draw (no calculation needed).

  // ground circle
  int groundDiam;
  int groundX;
  int groundY;

  // circle 1
  int circle1_value;
  float circle1_diam;
  float circle1_x;
  float circle1_y;
  float circle1_typoX;
  float circle1_typoY;

  // circle 2
  int circle2_value;
  float circle2_diam;
  float circle2_x;
  float circle2_y;
  float circle2_typoX;
  float circle2_typoY;


  /**
   * Constuctor
   */
  wngCirclePie() {
  }


  /**
   * Initialize and calculate variables.
   * 
   * 
   */
  void init(int posX, int posY, int diam, int val1, int val2) {
    //println("Start CirclePi init");

    groundX = posX;
    groundY = posY;
    groundDiam = diam;

    circle1_value = val1;
    circle2_value = val2;

    int tempVar = val1 + val2;

    // horizontal
    /*circle1_diam = map(val1, 0, tempVar, 0, diam);
    circle1_x = posX+circle1_diam/2;
    circle1_y = posY+diam/2;
    circle1_typoX = posX;
    circle1_typoY = posY;*/
    // vertikal
	circle1_diam = map(val1, 0, tempVar, 0, diam);
    circle1_x = posX;
    circle1_y = posY-(diam-circle1_diam)/2;
    circle1_typoX = posX;
    circle1_typoY = posY-(diam/2)-10;

    circle2_diam = map(val2, 0, tempVar, 0, diam);
    circle2_x = posX;
    circle2_y = posY+circle1_diam/2;
    circle2_typoX = posX;
    circle2_typoY = posY+diam/2+15;
  }

  /**
   * Draw
   */
  void draw() {
    noStroke();

    // ground
    fill(#383838);
    ellipse(groundX, groundY, groundDiam, groundDiam);

    // var1 ground
    // wir müssen von var1 text und ground splitten.
    // der text wird aufgerufen nachdem var2 vollständig gezeichnet wurde.
    fill(#707070);
    ellipse(circle1_x, circle1_y, circle1_diam, circle1_diam);

    // var2
    if (circle2_value != 0) {
      fill(#999999);
      ellipse(circle2_x, circle2_y, circle2_diam, circle2_diam);
      fill(#FFFFFF);
      text(circle2_value + " Following", circle2_typoX, circle2_typoY);
    }

    // var1 text
    fill(#FFFFFF);
    text(circle1_value + " Followers", circle1_typoX, circle1_typoY);
  }
}
