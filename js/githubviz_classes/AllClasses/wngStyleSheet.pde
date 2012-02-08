/**
 *  wngTypography is developed by wrong-entertainment & powder
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



/*
mit der stylesheet classe soll das handling mit verschiedenen schriften performanter ablaufen.

*/


class wngStyleSheet {
  
  PFont h1, h2, h3;
  int[] hTag = new int[3];
  
  PFont pTag;
  int pTag;
  
  
  wngStyleSheet() {}
  
  
  void init(int h1, int h2, int h3, int p1) {
    hTag[0] = h1;
    hTag[1] = h2;
    hTag[2] = h3;
    pTag = p1;
    println("wngStyleSheet.init H1: "+hTag[0]+", "+hTag[1]+", "+hTag[2]+", pTag: "+pTag);
  }
  void init() {
   init(36, 24, 18, 12);
  }
 
  
}

