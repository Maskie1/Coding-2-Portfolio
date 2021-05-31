class EnemyShip {
  // Member variables
  int  x, y, health, rad, speed;
  // constructor
  EnemyShip(int x, int y, int health) {
 this.x = x;
 this.y = y;
 this.health = health;
 speed = level;
 rad = 80;
 health = 100;
}
  
  //display method
  void display() {
    fill(200,0,200);
    ellipse(x,y, 80, 80);
    fill(0,200,0);
    ellipse(x,y,40,40);
    fill(0,255,0,128);
    //rect(x,y+ 70, health, 20);
  }
  
  
  

void move() {
  x+=speed;
  if(x>=width || x<=0) {
    speed *=-1;
    y+=80;
  }
}
Boolean gunHit( Gun gun) {
  float distance = dist(x,y, gun.x, gun.y);
  if (distance <rad+gun.rad) {
    return true;
  } else {
    return false;
  }
}
  boolean Bottom() {
    if(y>=height+50) {
      return true;
    } else {
      return false;
    }
  }
}
