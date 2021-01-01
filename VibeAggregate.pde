Program p;
int counter = 0;
ButtonSelector vibe6;
boolean selected = false;
void setup(){
  fullScreen();
  loadPixels();
  
  for(int i = 0; i < width; i ++) {
    for(int j = 0; j < height; j ++) {
      float valToLerp = ((float)(j)/width);
      float lerpVal = lerp(0, 255, valToLerp);
      
      pixels[(j*width)+i] = color(lerpVal, 0, lerpVal);
    }  
  }
  updatePixels();
  textAlign(LEFT, TOP);
  vibe6 = new ButtonSelector(new Vibe6(), "Vibe 6", 10, height/7, height/7-1);
}

void draw(){
  if(!selected){
    counter++;
    textSize((height/7)/2);
    fill(255, 102, 153);
    text("Pick a vibe, any vibe.", 10, 30);
    fill(255, 0, 0);
    System.out.println("AAAA" + mouseX);
    if(vibe6.display()){System.out.println("AAAA" + mouseX); p = vibe6.ret; selected = true; p.setup();}
  }
  else{
    p.draw();
  }
}