

class Typography {
  
  PFont h1, h2, h3;
  PFont pTag;
  
  Typography() {}
  
  void listFonts() {
    // Uncomment the following two lines to see the available fonts 
    String[] fontList = PFont.list();
    println(fontList);
  }
  
  void init(String fontname) {
    h1 = createFont(fontname, 32);
    h2 = createFont(fontname, 24);
    h3 = createFont(fontname, 18);
    pTag = createFont(fontname, 10);
  }
  
  
  
  void draw(String msg, int x, int y) {
    text(msg, x, y);
  }
  
  
  
}
