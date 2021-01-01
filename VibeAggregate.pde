Program p = new Vibe6();
int counter = 0;
  ButtonSelector vbe6;
void setup(){
  fullScreen();

  textAlign(LEFT, TOP);
  vbe6 = new ButtonSelector(new Vibe6(), "Vibe 6", 10, height/7, height/7-1);
  p.setup();
}

void draw(){
  p.draw();
  counter++;
  textSize((height/7)/2);
  fill(255, 102, 153, 0);
  text("Pick a vibe, any vibe.", 10, 30);
    if(vbe6.display()){System.out.println((vbe6.y+vbe6.size) + "," + vbe6.x + "," + vbe6.y + "AAAA" + counter);}
}