class Star {
  // Member variables
   int x, y, speed, di;
  color c;
  
  // constructor
  Star(int x, int y) {
  this.x=x;
  this.y=y;
  c = color(255);
 speed = int(random(2,3));
 di = int(random(1,3));
  }
  
  //display method
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    ellipse(x,y,di,di);
  }
  void move() {
  y+=speed;
}  
  
  boolean Bottom() {
  if(y>height+80) {
    return true;
  } else {
    return false;
  }
}
}
