class ButtonSelector{
  Program ret;
  public int x, y, size;
  String name;
  public ButtonSelector(Program ret, String name, int x, int y, int size){
    this.ret = ret;
    this.name = name;
    this.x = x;
    this.y = y;
    this.size = size;
  }
  public boolean display(){
    textSize(this.size);
    text(name, x, y);
    return (mouseX > x && mouseX < x+textWidth(name)) && (mouseY > y && mouseY < y+this.size) && mousePressed;
  }
}