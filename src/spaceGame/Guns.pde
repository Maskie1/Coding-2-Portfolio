class Gun {
  //member variables
  int x, y, speed, rad;
  color c;


  // constructor
  Gun(int x, int y,color c) {
    this.x=x;
    this.y=y;
    this.c=c;
    speed = 6;
    rad = 3;
  }

  // display method
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(255, 255, 255);
    rect(x, y, 3, 6);
  }

  void shoot() {
    y-=speed;
  }

  boolean Top() {
    if (y<-3) {
      return true;
    } else {
      return false;
    }
  }
}
