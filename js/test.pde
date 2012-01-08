/*interface JavaScript {  
   void showXYCoordinates(int x, int y);   
 }  
  
void bindJavascript(JavaScript js) {  
    javascript = js;   
 }  
  
JavaScript javascript;*/



int mx, my;
String textContent;

ArrayList username;

void setup() {
  size(750, 400);
  //loop();
  username = new ArrayList();
  username.add(new User("def"));
}

void draw() {
  background(0x808080);
  fill(255, 0, 0);
  ellipse(mx, my, 10, 10);
  
  println("username.size()" + username.size());
  for (int i = username.size()-1; i >= 0; i--) { 
 // An ArrayList doesn't know what it is storing so we have 
 // to cast the object coming out
 User usr = (User) username.get(i);
 test(usr.name, 100, 10*i);
println(i);
 }

  // place the text centered on the drawing area  
  text(textContent, (width - twidth)/2, height/2);
}


/*void mouseMoved() {
	if(javascript!=null){  
	     javascript.showXYCoordinates(mouseX, mouseY);
	mx = mouseX;
	my = mouseY; 
	   }
}*/









void drawText(String t) {
	background(0x808080);
   // get the width for the text  
   float twidth = textWidth(t);
   textContent = t;

username.add(new User(textContent));

   // place the text centered on the drawing area  
   text(t, (width - twidth)/2, height/2);     
 }




class User {

	String name;

	User(String n) {
		name = n;
	}

	void init(){
		println(name);
	}
}