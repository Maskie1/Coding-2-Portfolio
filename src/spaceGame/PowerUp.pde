class PowerUp {
  // Member variables
  int x, y, speed, rad, choice;
  // constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(2,8));
    choice = int(random(1,5.5));
  }
void move() {
  y+=speed;
}
  //display method
  void display() {
    
    // ammunition
    
    if (choice == 1) {
      fill(255, 0, 0, 175);
      rectMode(CENTER);
      rect(x, y, 50, 30);
      fill(255, 0, 0);
      rect(x, y, 10, 20);
      rect(x+15, y, 10, 20);
      rect(x-15, y, 10, 20);
      
      // weapon upgrade
      
    } else if (choice == 2) {
      fill(0, 0, 255, 175);
      rectMode(CENTER);
      rect(x, y, 50, 30);
      fill(0, 0, 255);
      rect(x,y,30, 15);
     
      // health points
      
    } else if (choice == 3) {
      fill(0,255,0,175);
      rectMode(CENTER);
      rect(x,y, 50, 30);
      fill(0,255,0);
      rect(x,y,20,10);
      rect(x,y,10,20);
      
      // nuke
    
  } else if (choice == 4) {
      fill(250,200,150, 175);
      rectMode(CENTER);
      rect(x,y, 50, 30);
      fill(250,200,150);
      ellipse(x,y,10,10);
      // earth health
    } else  {
      fill(0,0,255,175);
      rectMode(CENTER);
      rect(x,y, 50, 30);
      fill(0,0,255);
      rect(x,y,20,10);
      rect(x,y,10,20);      
    }
  }
  int choice () {
    if (choice == 1) {
      return 1;
    } else if (choice == 2) {
      return 2;
    } else if (choice == 3) {
      return 3;
    } else if (choice == 4) {
      return 4;
    } else  {
      return 5;
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
