/**
 *  wngPie is developed by wrong-entertainment & powder
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
 *  @version    0.1.1
 */



class wngPie {

int x;
int y;
int diameter;
int value1;
int value2;
  
  /**
   * Constuctor
   */
  wngPie() {}

  
  /**
   * Initialize pie chart
   */
  void init(int posX, int posY, int diam, int var1, int var2) {
	x = posX;
	y = posY;
	diameter = diam;
	value1 = var1;
	value2 = var2;
  }
	
  /**
   * Draw a pie chart
   */
  void draw() {
    int tempVar = value1 + value2;
    
    noStroke();
    
    // var1
    fill(#3399FF);
    ellipse(x, y, diameter, diameter);//ellipse(x, y, diameter, diameter);
    
    // var2
    if(value2 != 0) {
      float degree = map(value2, 0, tempVar, 0, 360);
      fill(#FFFFFF);
      arc(x, y, diameter, diameter, 0, radians(degree));
    }
  }
  
}
