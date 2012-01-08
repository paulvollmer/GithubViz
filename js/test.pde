
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
  background(0xFF4D4D4D);

  fill(0xFF48A1F0);
  noStroke();
  rect(0, 0, width, 5);

  fill(255);
  text("User: "+username, 100, 100);
  text("Follower: "+follower, 100, 120);
  text("Repository: "+repository, 100, 140);

  for(int i=0; i<(int)repository; i++) {
	int n = 4;
	rect(100+(i*7), 150-n, 5, n);
}
  
}




void drawText(String usr, String flw, String rpo) {
  username = usr;
  follower = flw;
  repository = rpo;
}
