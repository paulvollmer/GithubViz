/**
 * GhvTreemapRect.pde
 * GitHubViz
 *
 * Tim Pulver <tim.pulver@fh-potsdam.de>
 * Paul Vollmer <paul.vollmer@fh-potsdam.de>
 * 
 *
 * @version    1.0.0
 * @modified   2012.05.10
 */

class TreemapRect extends Interaction {

	int x, y, w, h, value, index;
  
	TreemapRect(int x, int y, int w, int h, int value, int index){
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
		this.value = value;
		this.index = index;
	} 

  
	void draw(){
		int colorBg, colorTxt;
		boolean hover = overRect(mouseX, mouseY, x, y, w, h);
		
		if(hover){
			colorBg = cBgHover;
			colorTxt = cTxtHover;
		}
		else{
			colorBg = cBg;
			colorTxt = cBgHover;
		}
		fill(colorBg);
		stroke(cBgCanvas);
		rect(x, y, w, h);
		
		fill(colorTxt);
		noStroke();
		text(userData.repos[index].name, x+6, y+treemapLineHeight);
		if(hover){
			text("Watchers:\t" + userData.repos[index].watchers, x+6, y+treemapLineHeight*2);
			text("Forks:\t" + userData.repos[index].forks, x+6, y+treemapLineHeight*3);
		}
	}
}

