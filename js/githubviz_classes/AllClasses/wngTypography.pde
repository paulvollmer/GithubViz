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
das ist ein vorschlag wie wir eine besprochene css classe aufbauen könnten.
ich fände es gut wenn wir im setup alle styles (...ich will h1, h3 und p...) einmal initialisierun müssten bevor wir die benutzen können.
dann hätten wir keine PFont null objects.

hatte ich mich jetzt aber nochnicht weiter drum gekümmert, da ich erstmal die chart clasen teten wollte.
*/



class wngTypography {
  
  //PFont h1, h2, h3;
  //PFont pTag;
  
  wngStyleSheet css;
  
  
  
  /**
   * Constuctor
   */
  wngTypography() {}
  
  
  
  void listFonts() {
    // Uncomment the following two lines to see the available fonts 
    String[] fontList = PFont.list();
    println(fontList);
  }
  
  
  
  void init(String fontname) {
    css = new wngStyleSheet();
    css.init(48, 36, 18, 12);
    
    //h1 = createFont(fontname, 36);
    h1 = createFont(fontname, css.hTag[0]);
    h2 = createFont(fontname, css.hTag[1]);
    h3 = createFont(fontname, css.hTag[2]);
    pTag = createFont(fontname, css.pTag);
  }
  
  
  
  void draw(String msg, int x, int y) {
    noStroke();
    text(msg, x, y);
    //wngText(msg, x, y);
  }
  
}







/*class Typo {
  
  //PFont font;
  int col = #000000;
  
  Typo(){}
  
}*/

