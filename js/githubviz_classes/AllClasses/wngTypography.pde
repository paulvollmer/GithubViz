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
  
  PFont h1, h2, h3;
  PFont pTag;
  
  wngTypography() {}
  
  void listFonts() {
    // Uncomment the following two lines to see the available fonts 
    String[] fontList = PFont.list();
    println(fontList);
  }
  
  void init(String fontname) {
    h1 = createFont(fontname, 34);
    h2 = createFont(fontname, 26);
    h3 = createFont(fontname, 21);
    pTag = createFont(fontname, 12);
  }
  
  
  
  void draw(String msg, int x, int y) {
    noStroke();
    text(msg, x, y);
  }
  
  
  
}
