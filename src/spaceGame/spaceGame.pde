import processing.sound.*;


// SpaceGame
// by Matthew Drollinger | Dec. 2020
//EnemyShip s1;
Spaceship Grand_Finale;
Boss Mothership;
ArrayList<Gun> guns;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<PowerUp> powerups;
ArrayList<Boss> bosss;
ArrayList<EnemyShip> enemyships;
ArrayList<EnemyGun> enemyguns;
Timer timer, ptimer, ntimer, ltimer, wtimer, etimer, ftimer;
int score, earthHealth, level, wlevel, nukes, ndur, rlevel;
String ltext;
boolean start;
SoundFile shotgun;
void setup() {
  shotgun = new SoundFile(this, "bob.wav");
  wlevel = 1;
  level = 1;
  rlevel = 1600;
  earthHealth = 200;
  fullScreen();
  //size(1000,800);
  Grand_Finale = new Spaceship();
  guns = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  powerups = new ArrayList();
  enemyships = new ArrayList();
  enemyguns = new ArrayList();
  timer = new Timer(int((rlevel)));
  ptimer = new Timer(int((12000)));
  ntimer = new Timer(int((255)));
  ltimer = new Timer(int((1000)));
  wtimer = new Timer(int((1000)));
  etimer = new Timer(int((10000)));
  ftimer = new Timer(int((2500)));
  score = 0;
  timer.start();
  ptimer.start();
  ntimer.start();
  wtimer.start();
  etimer.start();
  ftimer.start();
  ndur= 255;
  
}
void draw() {
  noCursor();
    startScreen();
  if (start) {
    if(Grand_Finale.lives>0) {
      if(earthHealth>=0) {
          if (Grand_Finale.health<=0) {
    Grand_Finale.lives -=1;
    Grand_Finale.health+=100;
  }
    textSize(15);
    background(0);
  stars.add(new Star(int(random(width)), int(random(height))));
  if(frameCount % 1500 == 0) {
    level ++;
    rlevel-=50;
    score+=1000;
    ltext = "Level:" + level;
    ltimer.start();
     //// if( level == 10) {
   // ltext = "Alien Mothership arriving!";
   // rocks.removeAll(rocks);
  //  wtimer.start();
 // }

  }
  for (int i = 0; i < guns.size(); i++) {
    Gun gun = guns.get(i);
    gun.display();
    gun.shoot();
    // gun x rock collision
    for (int l = 0; l < rocks.size(); l++) {
      Rock rock = rocks.get(l);
      if (rock.gunHit(gun)) {
        guns.remove(gun);
        rock.health-=10;
        if (rock.health > 15) {
        rock.rad-=10;
        } else {
          rock.rad = 15;
        }
        score+=10;
        if (rock.health<=0) {
          rocks.remove(rock);
        }
      } 
    }
    for(int e = 0; e <enemyships.size(); e++) {
      EnemyShip enemyship = enemyships.get(e);
      if(enemyship.gunHit(gun)) {
        guns.remove(gun);
        enemyship.health-=10;
        score+=10;
      }
      if (enemyship.health<=0) {
        enemyships.remove(enemyship);
        
      }
    }
    
    if (gun.Top()) {
      guns.remove(gun);
    }
  }
    //for (int i = 0; i < guns.size(); i++) {
   /// Gun gun = guns.get(i);
   /// gun.display();
    //gun.shoot();
   // }
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.Bottom()) {
      stars.remove(star);
    }
  }

  if (timer.isFinished()) {
    // make a rock
    rocks.add(new Rock(int(random(width)), -50, color(random(70), random(70), random(70))));
    timer.start();

  }
  if (etimer.isFinished()) {
    enemyships.add(new EnemyShip(40,40, 100));
    etimer.start();
  }
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    // detect ship collision
    if (Grand_Finale.rockHit(rock)) {
      
      rock.health-=2;
      Grand_Finale.health -= 1;
       score+=2;
      if(Grand_Finale.health <=0) {
        rocks.remove(rock);
      }
    }
    if (rock.Bottom()) {
      rocks.remove(rock);
      earthHealth-=rock.health/2;
    }
    if (rock.health <= 0) {
      rocks.remove(rock);
    }
  }
  for (int f = 0; f <enemyships.size(); f++) {
    EnemyShip enemyship = enemyships.get(f);
    enemyship.display();
    enemyship.move();
        if (Grand_Finale.enemyHit(enemyship)) {
      
      enemyship.health-=1;
      Grand_Finale.health -= 1;
       score+=1;
      if(Grand_Finale.health <=0) {
        enemyships.remove(enemyship);
      }
    }
    if(ftimer.isFinished()) {
      enemyguns.add(new EnemyGun(enemyship.x, enemyship.y));
      ftimer.start();
    }
    if(enemyship.Bottom()) {
      gameOver();
    }
  }
  for( int z = 0; z<enemyguns.size(); z++) {
    EnemyGun enemygun = enemyguns.get(z);
    enemygun.display();
    enemygun.shoot();
    if(Grand_Finale.gunHit(enemygun)) {
      Grand_Finale.health-=10;
      enemyguns.remove(enemygun);
    }
    if(enemygun.Bottom()) {
      enemyguns.removeAll(enemyguns);
    }
  }
  if(ptimer.isFinished()) {
  powerups.add(new PowerUp(int(random(width)), -50));
     ptimer.start();
  }
   for (int i = 0; i < powerups.size(); i++) {
    PowerUp powerup = powerups.get(i);
    powerup.display();
    powerup.move();
    if(Grand_Finale.powerHit(powerup)) {
      if(powerup.choice() == 1) {
        Grand_Finale.ammo +=200;
        powerups.remove(powerup);
      } else if (powerup.choice() == 2) {
        wlevel+=1;
        powerups.remove(powerup);        
      } else if (powerup.choice() == 3) {
        Grand_Finale.health +=20;
        powerups.remove(powerup);        
      } else if (powerup.choice() == 4) {
        nukes +=1;
        powerups.remove(powerup);        
      } else  {
        earthHealth+=20;
        powerups.remove(powerup);
      }
    }
    if (powerup.Bottom()) {
      powerups.remove(powerup);
    }
   }
//if(level>=10) {
//  Mothership.move();
//  Mothership.display(Mothership.x, Mothership.y);
//}
  Grand_Finale.display (mouseX, mouseY); 
  //s1.display(100, 100);
  println(mouseX, mouseY);
  InfoPanel();
  hpBar();
  if(!ltimer.isFinished()) {
    textSize(40);
    fill(255,128);
    text(ltext, width/2, height/2);
    if (level == 10) {
      text("Use Nukes!", width/2, height/2 + 100);
    }
  }
    if(!ntimer.isFinished()) {
      if(nukes > 0) {
      fill(255, 255, 255);
      rectMode(CENTER);
      rect(width/2, height/2, width, height);
     // ndur-=3;
      }
    }
    //if(ntimer.isFinished()) {
    //  ndur = 255;
      
   // }
   } else {
     gameOver();   
  }
}else {
  gameOver();
}
} 
}

void hpBar() {
    rectMode(CENTER);
    noStroke();
   fill(255,0,0);
  rect(10,20,20,10);
  rect(10,20,10,20);
  if(Grand_Finale.health >=0) {
  rectMode(CORNER);
  noStroke();
  fill(255,0,0,128);
  rect(40,10, Grand_Finale.health * 1.5,20);
  PImage Earth = loadImage("Earth.png");
  image(Earth, -7, 30);
  fill(0,0,255,128);
  rect(40, 40, earthHealth * 1.5, 20);
  if(Grand_Finale.lives == 3) {
    fill(255,0,0,128);
rect(40, 70, 20, 30);
rect(70, 70, 20, 30);
rect(100,70, 20, 30);
  } else if(Grand_Finale.lives == 2) {
    fill(255,0,0,128);
rect(40, 70, 20, 30);
rect(70, 70, 20, 30);    
  } else if (Grand_Finale.lives == 1) {
    fill(255,0,0,128);
rect(40, 70, 20, 30);    
  }
  }
}

void mousePressed() {
  if (Grand_Finale.ammo > 0) {
    guns.add(new Gun(Grand_Finale.x, Grand_Finale.y, color(255, 255, 255)));
    Grand_Finale.ammo --;

  }
}
void InfoPanel() {
  fill(0, 0, 255, 75);
  rectMode(CORNER);
  rect(0, height-75, width, 75);
  fill(0, 0, 255);
  text("Health:" + Grand_Finale.health, 50, height -20);
  text("Ammo:" + Grand_Finale.ammo, 50, height - 40);
  text("Lives:" + Grand_Finale.lives, 200, height - 40);
  text("Score  " + score, 200, height - 20);
  text("Earth Health:" + earthHealth, 400, height-30);
  text("Nukes:" + nukes, 700, height -30);
}
void startScreen() {
background(0);
textAlign(CENTER);
textSize(20);
fill(255);
text("Aliens have sent asteroids towards Earth", width/2, height/2);
text("Destroy the asteroids and alien ships to keep Earth safe.", width/2, height/2+30);
text("Good Luck", width/2, height/2+60);
text("Ship information is contained in the HUD up top", width/2, height/2+90);
text("And in more detail in the bottom Info Panel", width/2, height/2+120);
text("Space or Click fires, X launches a nuke", width/2, height/2+150);
text("The mouse controls the spaceship", width/2, height/2+180);
text("Click to continue", width/2, height/2+210);
if (mousePressed) {
  start = true;
}
}
void gameOver() {
  background(0);
  textAlign(CENTER);
  textSize(20);
  fill(255);
  textSize(20);
  text("Goodbye Commander", width/2, height/2);
  text("We know you did your best", width/2, height/2+30);
  text("Final Score:" +score,width/2, height/2+60);
  noLoop();
  powerups.removeAll(powerups);
  rocks.removeAll(rocks);
}
void keyPressed() {
  if(key == 'x') {
    ntimer.start(); 
  }
}
void keyReleased() {
  if (key == 'x') {
    if(nukes >0) {
      for(int x = 0; x<1;  x +=1) {
      rocks.removeAll(rocks);
      stars.removeAll(stars);
      enemyships.removeAll(enemyships);
      nukes--;
      score+=100;
      }
    }
  }
  if (key == ' ') {
    if(Grand_Finale.ammo >0) {
       guns.add(new Gun(Grand_Finale.x, Grand_Finale.y, color(255, 255, 255)));
      Grand_Finale.ammo--;
     // shotgun.play();
        if (wlevel >= 2) {
        guns.add(new Gun( Grand_Finale.x, Grand_Finale.y-1, color(255,255,255)));
      } if (wlevel >= 3) {
        guns.add(new Gun( Grand_Finale.x, Grand_Finale.y-2, color(255,255,255)));    
      } if (wlevel >= 4) {
        guns.add(new Gun( Grand_Finale.x, Grand_Finale.y-3, color(255,255,255)));     
      } if (wlevel >= 5) {
        guns.add(new Gun( Grand_Finale.x, Grand_Finale.y-4, color(255,255,255)));
      }
    }
  }
}
