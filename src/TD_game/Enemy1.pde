class Enemy1 {
  // Member variables
  float x, y, speed, health, dmg, v;
  // constructor
  Enemy1(float x, float y, float health) {
    this.x=x;
    this.y=y;
    this.health=health;
      v = int(random(1,3));
    
    speed = 2;
    
    health = 100;
    dmg = 5;
    x = 0; 
    y = 0;
    
 }
 void move() {

if (y>566) {
  y-= speed;
} else if (v== 1 && x>150 && y>500) {
  x-= speed;
} else if (v == 2 &&x <451 && y > 500) {
  x+= speed;
} else if (v==1 && y>250) {
  y-= speed;
}else if (v==2 && y>250) {
  y-= speed;
} else if (v== 1 && x <303 ) {
  x+=speed;
} else if (v==2 && x > 303) {
  x-=speed;
} else if (y<=250 && y>75) {
  y-=speed;
}
 }
 void display() {
   fill(0,255,0);
   circle(x,y,10);
 }
}
