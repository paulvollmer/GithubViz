/**
 * GitHubViz
 */


void setup() {
	size(window.innerWidth-20, window.innerHeight-250);
	noCursor();
	frameRate(60);
	
	background(#4D4D4D);
}

void draw() {
	
	// red outline arround the canvas
	/*stroke(255, 0, 0);
	noFill();
	rect(1, 1, width-2, height-2);*/
	
	noStroke();
	fill(#3399FF);
	ellipse(mouseX, mouseY, 20, 20);
}