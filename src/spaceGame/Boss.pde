class Boss {
  // Member variables
  int x, y, speed, rad, health;
  // constructor
  Boss() {
    y = - 100;
    speed = 1;
    rad = 500;
    health = 1000;
    x = width/2;
  }
  void move() {
    y+=speed;
  }
  
  //display method
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    fill(255,0,255);
    ellipse(x, y, 500, 500);
    fill(0,255,0);
    ellipse(x, y, 200, 200);
    fill(255,0,0,128);
    rectMode(CENTER);
   // rect(x, y+ 400, health/2, 30);
    
  }
  boolean gunHit( Gun gun) {
    float distance = dist(x,y, gun.x, gun.y);
    if (distance < rad + gun.rad) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
}
void ship_b() {
  
}
void weapons_b() {
  
}
void movement_b() {
}
