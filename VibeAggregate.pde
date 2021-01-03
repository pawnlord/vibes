Program p;
int counter = 0;
ButtonSelector vibe1, vibe2, vibe3, vibe4, vibe5;
boolean selected = false;
void setup(){
  fullScreen(P3D);
  textAlign(LEFT, TOP);
  vibe1 = new ButtonSelector(new Vibe1(), "Random Lines", 10, height/6, height/6-10);
  vibe2 = new ButtonSelector(new Vibe2(), "Waves", 10, (height/6)*2, height/6-10);
  vibe3 = new ButtonSelector(new Vibe3(), "Arcs", 10, (height/6)*3, height/6-10);
  vibe4 = new ButtonSelector(new Vibe4(), "Spin", 10, (height/6)*4, height/6-10);
  vibe5 = new ButtonSelector(new Vibe5(), "Vibe 5", 10, (height/6)*5, height/6-10);
  
}

void draw(){
  if(!selected){
    counter++;
    loadPixels();
    for(int i = 0; i < width; i ++) {
      for(int j = 0; j < height; j ++) {
        float valToLerp = ((float)(j)/width);
        float lerpVal = lerp(0, 255, valToLerp);
        
        pixels[(j*width)+i] = color(lerpVal, 0, lerpVal);
      }  
    }
    updatePixels();
    textSize((height/6)/2);
    fill(255, 102, 153);
    text("Pick a vibe, any vibe.", 10, 30);
    fill(255, 0, 0);
    
    if(vibe1.display()){p = vibe1.ret; selected = true; p.setup();}
    else if(vibe2.display()){p = vibe2.ret; selected = true; p.setup();}
    else if(vibe3.display()){p = vibe3.ret; selected = true; p.setup();}
    else if(vibe4.display()){p = vibe4.ret; selected = true; p.setup();}
    else if(vibe5.display()){p = vibe5.ret; selected = true; p.setup();}
   
  }
  else{
    p.draw();
  }
}