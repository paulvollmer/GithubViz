/*
All classes ist für die reine classen gedacht.
hier können wir testen und bauen.
Wenn eine klasse fertig ist müssen wir manuell den code in die pde aus dem discover.php canvas updaten.
das halte ich aber für sehr sinfoll, da wir so sehr gut an den untershiedlichen klassen testen können und 
durch ne gescheite versionierung genau wissen velche klassen stabil laufen.
*/



wngTypography typo;

wngPie pie;
wngCirclePie circlePie;
wngCircleChain circleChain;



void setup() {
  size(1200, 700);
  smooth();
  
  typo = new wngTypography();
  //typo.listFonts();
  typo.init("sans-seriv");
  
  pie = new wngPie();
  pie.init(120, 350, 200, 72, 2);
  
  circlePie = new wngCirclePie();
  circlePie.init(340, 350, 200, 2, 2);
  
  circleChain = new wngCircleChain();
  int[] temp1 = {50, 25, 10, 10, 5};
  circleChain.init(temp1, 560, 250, 500, 200);
}



void draw() {
  background(#4d4d4d);
  
  fill(#FFFFFF);
  textFont(typo.pTag);
  text("wngTypography Example", 20, 40);
  
  // typography test
  textFont(typo.h1);
  typo.draw("wngTypography <h1>", 20, 100);
  textFont(typo.h2);
  typo.draw("wngTypography <h2>", 20, 130);
  textFont(typo.h3);
  typo.draw("wngTypography <h3>", 20, 160);
  textFont(typo.pTag);
  typo.draw("wngTypography <p>", 20, 190);
  
  // chart test
  pie.draw();
  circlePie.draw();
  circleChain.draw();
  
  // description test
  fill(255, 255,0);
  text("wnPie", 20, 240);
  text("wngCirclePie", 240, 240);
  text("wngCircleChain", 460, 240);
  
}

