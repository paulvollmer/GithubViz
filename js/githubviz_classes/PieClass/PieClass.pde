



Pie pie;
void setup() {
  size(500, 500);
  
  pie = new Pie();
  pie.init(width/2, height/2, height-100, 72, 2);
}

void draw() {
  pie.draw();
}
