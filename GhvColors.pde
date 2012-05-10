// Base color
int cBlack = #000000;
int cWhite = #FFFFFF;
int cRed = #FF0000;
int cGreen = #00FF00;
int cBlue = #0000FF;


// colors
int cBgCanvas = #4D4D4D;	// Canvas background

int cBg = #5c5c5c;	// TreemapRect background
int cBgHover = #48a1f0;	// TreemapRect background hover
int cTxt = #000000;	// Text color
int cTxtHover = #ffffff;	// Text color hover
int cBgClick = cBgHover;
int cTxtClick = cTxtHover;
int cRectOutline = cBgCanvas;


// Color for our buttons
int cOn = #00ff00;
int cHover = cBgHover;
int cOff = #00ffff;



/**
 * Draw all our color as color rectangles
 * This will be used to get an overview of our colors
 */
void drawColorSet(){
  int x = 10;
  int y = 10;
  int colorPattern = 20;
  
  fill(cBlack);
  rect(x, y, colorPattern, colorPattern);
  fill(cWhite);
  rect(x+colorPattern, y, colorPattern, colorPattern);
  fill(cRed);
  rect(x+colorPattern*2, y, colorPattern, colorPattern);
  fill(cGreen);
  rect(x+colorPattern*3, y, colorPattern, colorPattern);
  fill(cBlue);
  rect(x+colorPattern*4, y, colorPattern, colorPattern);
  
  fill(cBgCanvas);
  rect(x, y+colorPattern, colorPattern, colorPattern);
  fill(cBg);
  rect(x, y+colorPattern, colorPattern, colorPattern);
  fill(cBgHover);
  rect(x+colorPattern*2, y+colorPattern, colorPattern, colorPattern);
  fill(cTxt);
  rect(x+colorPattern*3, y+colorPattern, colorPattern, colorPattern);
  fill(cTxtHover);
  rect(x+colorPattern*4, y+colorPattern, colorPattern, colorPattern);
  
  fill(cOn);
  rect(x, y+colorPattern*2, colorPattern, colorPattern);
  fill(cHover);
  rect(x, y+colorPattern*2, colorPattern, colorPattern);
  fill(cOff);
  rect(x+colorPattern*2, y+colorPattern*2, colorPattern, colorPattern);
  
}


