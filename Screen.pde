abstract class Screen {
  protected int[][] colors;
  protected int sizeX, sizeY;
  public Screen(Screen s){
    // Copy elements of a[] to b[] 
    this.colors = new int[s.colors.length][s.colors[0].length];
    for (int i=0; i<s.colors.length; i++) 
      for (int j=0; j<s.colors[0].length; j++) 
          this.colors[i][j] = s.colors[i][j]; 
    this.sizeX = s.sizeX;
    this.sizeY = s.sizeY;
  }
  public Screen(int sizeX, int sizeY) {
    this.colors = new color[sizeX][sizeY];
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    pattern();
  }

  protected abstract void pattern();

  public void display() {
    loadPixels();
    for (int i = 0; i < this.sizeX; i++) {
      for (int j = 0; j < this.sizeY; j++) {
        pixels[i+(j*width)] = this.colors[i][j];
      }
    }
    updatePixels();
  }
}
class Pattern1 extends Screen {
  final int pointAmount = 10;
  PVector[] points;
  public Pattern1(int sizeX, int sizeY) {
    super(sizeX, sizeY);
  }
  public Pattern1(Pattern1 p) {
    super(p);
    this.points = new PVector[pointAmount];
    for(int i = 0; i < pointAmount; i++){
      this.points[i] = new PVector(p.points[i].x+notZero(sin(p.points[i].x/100.0)*10),p.points[i].y-notZero(sin(p.points[i].y/100.0)*10));
    }
    pattern();
  }
  protected void pattern(){
    if(points == null){
      points = new PVector[pointAmount];
      for (int i = 0; i < pointAmount; i++){
        this.points[i] = new PVector(random(this.sizeX), random(this.sizeY));
      }
    }
    
    for (int i = 0; i < this.sizeX; i++) {
      for (int j = 0; j < this.sizeY; j++) {
        colors[i][j] = color(calculateDistance(i, j, 2, 2),0,calculateDistance(i, j, 0, 0.7));
      }
    }
  } 
  private int calculateDistance(int x, int y, int index, float ratio) {
    float distance = 0;
    float maxDistance = (float)Math.sqrt(this.sizeX*this.sizeX+this.sizeY*this.sizeY);
    float[] distances = new float[pointAmount];   
    for (int i = 0; i < pointAmount; i++) {
      float distanceX = x-points[i].x;
      float distanceY = y-points[i].y;
      distances[i] = (float)Math.sqrt(distanceX*distanceX+distanceY*distanceY);
    }
    distances = sort(distances);
    distance = distances[index];
    return (int)(map(distance/ratio, 0.0, maxDistance, 0, 255));
  }
  private float notZero(float f){
    return (f==0)?10:f;
  };
}