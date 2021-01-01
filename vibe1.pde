class Vibe1 implements Program{
  final int SIZEX = 20;
  final int X = 0;
  final int Y = 1;
  final int Z = 2;
  final int R = 3;
  final int G = 4;
  final int B = 5;
  float[][] points = new float[SIZEX+4][6];
  float counter = 500000000;
  float translateX = width/2;
  float translateY = height/2;
  void vibeClear() {
    for(int i = 0; i < width; i ++) {
      for(int j = 0; j < height; j ++) {
        float valToLerp = ((float)(j)/width);
        float lerpVal = lerp(0, 255, valToLerp);
        
        pixels[(j*width)+i] = color(lerpVal, 0, lerpVal);
      }  
    }
    updatePixels();
  }
  
  void setup() {
    loadPixels();
    //size(displayWidth, displayHeight, P3D);
    vibeClear();
    for( int i = 0; i < SIZEX; i++) {
      points[i][X] = random(-10000, 10000);
      points[i][Y] = random(-10000, 10000);
      points[i][Z] = random(-200, 200);
      points[i][R] = random(50, 200);
      points[i][G] = random(50, 200);
      points[i][B] = random(50, 255);
    }
    points[SIZEX][X] = -1000;
    points[SIZEX+1][X] = 1000;
    points[SIZEX][Y] = -1000;
    points[SIZEX+1][Y] = 1000;
    
    points[SIZEX+2][X] = 1000;
    points[SIZEX+3][X] = -1000;
    points[SIZEX+2][Y] = -1000;
    points[SIZEX+3][Y] = 1000;
  
  }

  float rotate = 0;
  float rotateUp = 0;
  void draw(){
    vibeClear();
    float translateZ = height;
    if(mousePressed){
      rotate += map(mouseX-pmouseX, -width, width, -5, 5);
    }
    counter+=0.05;
    if(counter >= 10){
      setup();
      counter = 0;
    }
    rotateX(5);
    translate(translateX, translateY, translateZ);
    if(keyPressed){
      if(key == 'w'){
        translateY-=15;
      } else if(key == 's'){
        translateY+=15;
      } else if(key == 'a'){
        translateX+=15;
      } else if(key == 'd'){
        translateX-=15;
      } else if(key == 'x'){
        translateZ-=15;
      } else if(key == 'c'){
        translateZ+=15;
      }
    }
    beginShape();
    for( int i = 0; i < SIZEX+4; i++) {
      for( int j = 0; j < SIZEX+4; j++) {
        stroke(points[i][R]+points[j][R], points[i][G]+points[j][G],
              points[i][B]+points[j][B]);
        line(points[i][X], points[i][Y], points[i][Z], points[j][X], points[j][Y], points[j][Z]);
      }
    }
    endShape();
  } 
} 