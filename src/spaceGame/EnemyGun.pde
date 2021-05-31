class EnemyGun {
  //member variables
  int x, y, speed, rad;


  // constructor
  EnemyGun(int x, int y) {
    this.x=x;
    this.y=y;
    speed = 6;
    rad = 3;
  }

  // display method
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(0, 255, 0);
    rect(x, y, 3, 6);
  }

  void shoot() {
    y+=speed;
  }

  boolean Bottom() {
    if (y>3+height) {
      return true;
    } else {
      return false;
    }
  }
}
