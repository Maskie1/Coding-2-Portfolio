PImage Map;
Enemy1 p;
Enemy2 l;
ArrayList<Enemy1> enemy1s;
ArrayList<Enemy2> enemy2s;
Button z, a, b, y;
Button2 c,d, e, f;
Timer enemy1, enemy2;
Laser_Wall la;
Barbed_Wire ba;
int damage, health, maxHealth, money, ammo;
String x;
Boolean n, r;


void setup () {
  Map = loadImage("RealMap.png");
  size(610, 800);
  background(0);
  enemy1s = new ArrayList();
  enemy2s = new ArrayList();
  z = new Button(550, 50, 90, 40, "Upgrades");
  a = new Button(60, 50, 90, 40, "Towers");
  b = new Button(550, 500, 90, 40, "Resupply");
  c = new Button2(550, 90, 90, 40, "Damage");
  d = new Button2(550, 130, 90, 40, "Max Health");
  e = new Button2(60, 90, 90, 40, " Barbed Wire");
  f = new Button2( 60, 130, 90, 40, " Laser Wall");
  la = new Laser_Wall(302,150);
  ba = new Barbed_Wire(302, 750);
  
  enemy1 = new Timer(int((2500)));
    enemy2 = new Timer(int((3500)));
health = 100;
money = 100;
damage = 1;
maxHealth = 100;
enemy1.start();
enemy2.start();
n = false;
r = false;
}




void draw () {
  if (enemy1.isFinished()) {
    stroke(0,0,255);
    fill(0,0,255);
    enemy1s.add(new Enemy1(302,850,60));
    enemy1.start();
  }
    if (enemy2.isFinished()) {
    stroke(0,0,255);
    fill(0,0,255);
    enemy2s.add(new Enemy2(302,850,100));
    enemy2.start();
  }
  image(Map, 0, 0);
  noCursor();
  stroke(0,255,0);
  line();
  circle(300, 65, 10);
  if (mousePressed) {
    fill(0,255,0); 
    line(300, 65, mouseX, mouseY);

    fill(255,150,50);
    circle(mouseX, mouseY, 20);
  
    
  }
  for (int i = 0; i <enemy1s.size(); i++) {
    Enemy1 enemy1 = enemy1s.get(i);
    enemy1.display();
    enemy1.move();
    if (n == true) {
  if (la.colDet1(enemy1)) {
    enemy1.speed = 0;
    enemy1.health-=1;
    la.health-=1;
  } else {
    enemy1.speed = 2;
  }
  }
       fill(0,255,0,200);
   rect(enemy1.x,enemy1.y-12,enemy1.health/3,3);
   if (mousePressed) {
    if (int(dist(mouseX,mouseY,enemy1.x,enemy1.y)) <20) {
      enemy1.health-=damage;
    }
   }
    if (enemy1.y <=76) {
      enemy1s.remove(enemy1);
     health -=1;
    }
    if (enemy1.health<=0) {
      enemy1s.remove(enemy1);
      money+=1;
    }
  }
    for (int f = 0; f <enemy2s.size(); f++) {
    Enemy2 enemy2 = enemy2s.get(f);
    enemy2.display();
    enemy2.move();
        if (r == true) {
  if (ba.colDet2(enemy2)) {
    enemy2.speed = 0;
    enemy2.health-=1;
    la.health-=1;
  } else {
    enemy2.speed = 2;
  }
        }
    fill(0,255,0,200);
   rect(enemy2.x,enemy2.y-12,enemy2.health/3,3);
   if (mousePressed) {
    if (int(dist(mouseX,mouseY,enemy2.x,enemy2.y)) <20) {
      enemy2.health-=damage;
    }
   }
    if (enemy2.y<=76) {
      enemy2s.remove(enemy2);
      health-=2;
    }
    if (enemy2.health<=0) {
      enemy2s.remove(enemy2);
      money+=2;
  }
    }
  textSize(20);
  fill(0,0,255);
  stroke(0,0,255);
  text ("Funds: " + money, 30, 650);
  text (" Health: " + health +"/"+maxHealth, 24, 680);
  text (" Damage: " + damage, 25, 710);
textSize(12);
  z.display();
  z.hover();
  a.display();
  a.hover();
  if (z.effect && damage <3) {
      c.display();
    c.hover();
  }
  if (z.effect) {
    d.display();
    d.hover();
  } if (a.effect) {
  e.display();
  e.hover();
  f.display();
  f.hover();
  }
  if (health<=0) {
    gameOver();
  }

   if (c.hover == false) {
    c.effect = false;
  }
  if (c.effect) {
  money -=100;
  damage+=1;
  c.hover = false;
} c.effect = false; 
  if (d.hover == false) {
    d.effect = false;
  }
  if (d.effect) {
    money -=100;
    maxHealth+=20;
    d.hover = false;
  }d.effect = false;
  if (f.hover == false) {
    f.effect = false;
  }
  if (f.effect) {
    money -=100;
n = true;
    f.hover = false;
  }f.effect = false;
  if (la.health <=0) {
    n = false;
  }
  if (n == true) {
    la.display();
  }
    if (e.hover == false) {
    e.effect = false;
  }
  if (e.effect) {
    money -=100;
r = true;
    e.hover = false;
  }e.effect = false;
  if (ba.health <=0) {
    r = false;
  }
  if (r == true) {
    ba.display();
  }
}
void gameOver(){
  background(0);
  textAlign(CENTER);
  textSize(20);
  fill(255);
  text("GAME OVER", width/2, height/2);
  noLoop();
}
void line() {

 line(mouseX,mouseY+5, mouseX, mouseY+15);
  line(mouseX,mouseY-5, mouseX, mouseY-15);
   line(mouseX+5,mouseY, mouseX+15, mouseY);
      line(mouseX-5,mouseY, mouseX-15, mouseY);
}
void mousePressed() {
}
void mouseReleased() {
  z.effect = false;
  a.effect = false;
  b.effect= false;
  if (c.hover && money >=100) {
    c.effect = true;
  }
  if (d.hover && money >=100) {
  d.effect = true;
  }
  if (f.hover && money >=100) {
    f.effect = true;
  }if (e.hover && money >=100) {
    e.effect = true;
  }
}
