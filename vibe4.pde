class Vibe4 implements Program{
  float radius = 1298.0;
  float bend = 0.0, bend2 = PI*2;
  float col = 0;
  float angle = 0;
  float direction = 1;
  int halfwidth = 1440/2;
  int halfheight = 900/2;
  float colorspeed = random(4000)/1000+4;
  
  void setup(){
    fullScreen(P3D);
    bend += random(100)/100;
    background(0); 
  }
  
  void draw(){
    float pointx, pointy;
    float ratio = cos((angle*PI)/180);
    pointx = ratio * radius;
    pointy = sqrt(pow(radius,2 )-(pow(pointx, 2) )) * (angle%360>180?-1:1);
    noFill();
    stroke(col, 0, 255-col);
    curve(bend, bend, halfwidth, halfheight, pointx+halfwidth, pointy+halfheight, pointy+halfheight, pointx+halfwidth);
    stroke(0, 255-col, col);
    line(halfwidth, halfheight, pointx+halfwidth, pointy+halfheight);
    bend+= random(100) - 50;
    angle+=0.5;
    col+=direction*colorspeed;
    if(col > 255 || col < 0){
      direction *= -1;
    }
  }
}  