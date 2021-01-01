class Vibe6 implements Program{
  Pattern1[] ps;
  float current = 0;
  int current_alpha;
  int dir = 1;
  final int screenNumber = 10;
  


  void setup(){
    ps = new Pattern1[screenNumber];
    ps[0] = new Pattern1(width, height);
    for(int i = 1; i < screenNumber; i++){
      System.out.println(i);
      ps[i] = new Pattern1(ps[i-1]);
    }
  }
  
  void draw(){
    ps[(int)current].display();
    current += dir*max(cos((current*PI)/(2*screenNumber)), 0.25);
    if( current >= screenNumber-1){
      dir = -1;
    }
    if( current <= 0){
      dir = 1;
    }
        
    delay(10);
  }
} 