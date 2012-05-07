//boolean viewChanged = false;
//boolean userChanged = false;
//boolean repoChanged = false;
GhvGraphicsObject[] drawables;



void setup(){
  size(800,600);
  background(#4D4D4D);
  fill(255);
  noLoop();
  //PFont fontA = loadFont("courier");
  //textFont(fontA, 14);
  
  drawables = new Circle[2];
  drawables[0] = new Circle(60, 60, 30);  
  drawables[1] = new Circle(120, 120, 10);
}

void draw(){  
  
  println("Hello ErrorLog!");
  for(int i=0; i<drawables.length; i++){
  	drawables[i].draw();
  }
}

void drawFollower(int n){
	for(int i=0; i<n; i++){
		ellipse(random(0, width), random(0, height), 40, 40);
	}
	
	var userData = getUser(getUrlVars()["user"]);
	println("user name: " + userData.login);
	// make sure userData has been loaded already!!
	println("Accessing a Javascript Object from within P5: " + userData.login);
	alert('BÖAAAA');
}

void mouseClicked(){
	println("mouseClicked: " + mouseX + ", " + mouseY);
	for(int i=0; i<drawables.length; i++){
		if(drawables[i].isClickable && drawables[i].isInRegion(mouseX, mouseY)){
			println("drawable " + i + " clicked!");
		}
	}
}


public class Circle extends GhvGraphicsObject{
	// we need two different coordinates if we want to make transitions (on animations)
	float mxOrig, myOrig, rOrig;	// original postition (original)
	float mxCur, myCur, rCur;	// middlepoint coordinates, radius (current)
	// coorinates of the destination (on animations, i.e. if the repo circles go to the bottom and become smaller)
	float mxDest, myDest, rDest; 
	
	public Circle(int x, int y, int r){
		this.mxOrig = this.mxCur = x;
		this.myOrig = this.myCur = y;
		this.rOrig = this.rCur = r;
		this.isClickable = true; 
	}
	
	public void draw(){
		ellipse(mxCur, myCur, 2*rCur, 2*rCur);
	}
	
	public boolean isInRegion(int x, int y){
		return pow(x-mxCur, 2) + pow(y - myCur, 2) < pow(rCur, 2);
	}
}

abstract class GhvGraphicsObject{
	boolean isClickable = false;
	boolean isTransformable = false;
	boolean currentlyTransforming = false;	// if an animation is currently going on (i.e. position change)
	boolean hasDataSource = false;
	
	public void draw(){
          println("draw() needs to be implemented!");}
	public boolean isClickable(){return isClickable;}
	// determine if a coorinate (i.e. the mouse) is on top of the object
	public boolean isInRegion(int x, int y){println("isInRegion() needs to be implemented!"); return false;}
}

class GhvGraphicsContainer{
  int contX, contY, contW, contH;  // x, y positions (top left point), width, height
  ArrayList<GhvGraphicsObject> childs;
  
  public GhvGraphicsContainer(int x, int y, int w, int h){
    this.contX = x;
    this.contY = y;
    this.contW = w;
    this.contH = h;
    childs = new ArrayList<GhvGraphicsObject>();  
  }
  
  public void addChild(GhvGraphicsObject obj){
    childs.add(obj);
  }
  
  public void draw(){
   //draw myself here...
   //...
   
    for(GhvGraphicsObject obj: childs){
      obj.draw();  
    }        
  }
  
}
