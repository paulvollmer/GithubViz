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
		
		if(overRect(mouseX, mouseY, x, y, w, h)){
			colorBg = cBgHover;
			colorTxt = cTxtHover;
		}
		else{
			colorBg = cBg;
			colorTxt = cTxt;
		}
		fill(colorBg);
		stroke(#4d4d4d);
		rect(x, y, w, h);
		
		fill(colorTxt);
		noStroke();
		text(userData.repos[index].name, x+6, y+20);
	}
}

