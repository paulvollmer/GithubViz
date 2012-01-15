

String city = "novosibirsk";
googleMapsApi gMaps = new googleMapsApi();

PImage world = new PImage();
float worldX;
float worldY;
float worldW;
float worldH;


void setup() {
  size(950, 700);
  noLoop();
  gMaps.init(this, city);
  world = loadImage("world.png"); //welt.jpeg");
  worldX = 10;
  worldY = 10;
  worldW = world.width;
  worldH = world.height;
}

void draw() {
  //background(#FFFFFF);
  image(world, worldX, worldY);
  
  // location point
  float px = map(int(gMaps.lng), -180.0f, 180.0f, worldX, worldW);
  float py = map(int(gMaps.lat), 90.0f, -90.0f, worldY, worldH);
  println(py);
  fill(255, 0, 0);
  ellipse(px, py, 10, 10);
  
  fill(#000000);
  text("City: " + city, 10, 630);
  text("Status: " + gMaps.status, 10, 650);
  text("Lat: " + gMaps.lat, 250, 630);
  text("Lng: " + gMaps.lng, 250, 650);
  
}

