class Vibe3 implements Program{
  float radius = 700.0;
  float bend = 0.0, bend2 = PI*2;
  float col = 0;
  float angle = 0;
  int widthhalf, heighthalf;
  
  void setup(){
    widthhalf = width/2;
    heighthalf = height/2;
    bend += random(100)/100;
    background(0); 
  }
  
  void draw(){
    float pointx, pointy;
    float ratio = cos((angle*PI)/180);
    pointx = ratio * radius;
    pointy = sqrt(pow(radius,2 )-(pow(pointx, 2) )) * (angle%360>180?-1:1);
    strokeWeight(1);
    noFill();
    stroke(col, 0,  255-col);
    arc(widthhalf, heighthalf, pointx+widthhalf, pointy+heighthalf, 0, bend);
    //line(widthhalf, heighthalf, pointx+widthhalf, pointy+heighthalf);
    bend+= random(10)/10;
    angle+=0.5;
    col+=1;
    col%=255;
     
  }
}