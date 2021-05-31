class Barbed_Wire{
  int x, y, r, health;
  boolean Col;
  
  Barbed_Wire(int x, int y) {
  
  this.x=x;
  this.y=y;
  r = 20;
  health = 200;
}
void display() {
  rectMode(CENTER);
  fill(255,0,0);
  rect(x,y, 90, 40);
}
boolean colDet1(Enemy1 enemy1) {
  float distance = dist(x,y,enemy1.x,enemy1.y);
  if (distance < r) {
    return true;
    
  } else {
    return false;
  }
}
boolean colDet2(Enemy2 enemy2) {
  float distance = dist(x,y,enemy2.x, enemy2.y);
  if (distance <r) {
  return true;
} else {
  return false;
}
}
}
