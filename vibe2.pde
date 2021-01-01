class Vibe2 implements Program{
  float[][] points = new float[20][20];
  
  void fillScreen(float ringX, float ringY){
    loadPixels();
    for(int i = 0; i < width; i++){
      for(int j = 0; j < height; j++){
        float colorVal = map(j, height, 0, 0, 255);
        float distance = map(dist(ringX, ringY, i, j), ringX/2, 0, 0, 125);
        pixels[i+(j*width)] = color(colorVal, distance, min(255, colorVal+distance));
      }
    }
    updatePixels();
  }
  
  void setup(){
    float num = random(1500);
    float max = random(200)+50;
    fillScreen(width/2, height/2);
    for(int i = 0; i < 20; i++){ 
      for(int j = 0; j < 20; j++){ 
        points[i][j] = noise(i, j, num)*max;
      }
    }
  }
  float counter = 0;
  float rotation = 0;
  float ztrans = 90;
  
  void draw(){
    float wid = 600;
    translate(-wid*10, 900, ztrans);
    rotateX(5);
    rotateZ(rotation);
    counter += 0.1;
    stroke(255, 0, 255);
    fill(0, 0);
    strokeWeight(5);
    fillScreen(width/2, height/2);
    for(int i = 0; i < 20; i++){
      for(int j = 0; j < 20; j++){
        point(i*wid, j*wid, points[i][j]);
        points[i][j] += sin(counter+i+j);
        if(i != 0 && i != 19 && j != 0 && j != 19){
          stroke(points[i][j]*2,
                0,
                points[i][j]*2);
          beginShape();
          vertex(i*wid, j*wid, points[i][j]);
          vertex((i+1)*wid, j*wid, points[i+1][j]);
          vertex((i+1)*wid, (j+1)*wid, points[i+1][j+1]);
          vertex(i*wid, (j+1)*wid, points[i][j+1]);
          endShape();
        }
      }
    }
  }
}