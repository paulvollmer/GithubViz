
String username;
String follower;
String repository;




void setup() {
  size(750, 400);
  frameRate(25);

  //fontA = loadFont("Arial"); 
  //textSize(fontA, 72);

  username = "wng";
  follower = "11120119";
  repository = "1";
}



void draw() {
  background(50, 50, 50);

  fill(00);
  noStroke();
  rect(0, 0, width, 10);

  fill(255);
  text("User: "+username, 100, 100);
  text("Follower: "+follower, 100, 120);
  text("Repository: "+repository, 100, 140);

  for(int i=0; i<(int)repository; i++) {
	int n = 4;
	rect(100+(i*25), 50-n, 20, n);
}
  
}




void drawText(String usr, String flw, String rpo) {
  username = usr;
  follower = flw;
  repository = rpo;
}
