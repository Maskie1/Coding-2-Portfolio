class Rock {
  // member variables
  int x, y, speed, rad, health;
  color c;
  // constructor
  Rock(int x, int y,color c) {
    this.x=x;
    this.y=y;
    this.c=c;
    speed = int(random(1,3));   
    health = int(random(25,50));
    
  }
  
  // display method
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    ellipse(x,y,health,health);
    rad = health;
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
boolean gunHit(Gun gun) {
    float distance = dist(x, y, gun.x, gun.y);

    if (distance < rad + gun.rad) {
      return true;
    } else {
      return false;
    }
  }  
}
