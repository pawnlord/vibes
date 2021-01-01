Program p = new Vibe6();
int counter = 0;
  ButtonSelector vbe6;
void setup(){
  fullScreen();
  vbe6 = new ButtonSelector(new Vibe6(), "Vibe 6", 10, height/7, height/7-1);
  p.setup();
}

void draw(){
  p.draw();
  counter++;
    if(vbe6.display()){System.out.println(mouseX + "," + mouseY + "AAAA" + counter);}
}