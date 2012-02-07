



Typography typo;

Pie pie;
CirclePie circlePieUser;

void setup() {
  size(1200, 700);
  smooth();
  
  typo = new Typography();
  typo.init("Helvetica");
  
  pie = new Pie();
  pie.init(120, 350, 200, 72, 2);
  
  circlePieUser = new CirclePie();
  circlePieUser.init(340, 350, 200, 2, 2);
}

void draw() {
  background(#4d4d4d);
  
  textFont(typo.pTag);
  text("Tpography Example", 20, 40);
  
  textFont(typo.h1);
  typo.draw("Typography <h1>", 10, 100);
  textFont(typo.h2);
  typo.draw("Typography <h2>", 10, 130);
  textFont(typo.h3);
  typo.draw("Typography <h3>", 10, 160);
  textFont(typo.pTag);
  typo.draw("Typography <p>", 10, 190);
  
  
  text("Pie", 20, 240);
  text("CirclePie", 240, 240);
  
  pie.draw();
  
  circlePieUser.draw();
  
}
