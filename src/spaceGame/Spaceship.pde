class Spaceship {
  // Member variables
  int x, y, health, lives, ammo, rad;
  // constructor
  Spaceship() {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    ammo = 1000;
    rad = 25;
  }

  //display method
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    noStroke();
    rectMode(CENTER);
    fill(255, 0, 0);
    triangle(x, y-20, x+25, y+10, x-25, y+10);
    fill(0, 0, 255);
    rect(x, y, 20, 50);

    //rect(x, y+30, 40, 20);

    triangle(x+10, y+25, x-10, y+25, x, y+32);
    rect(x, y-30, 3, 40);

    triangle(x, y-40, x+10, y-25, x-10, y-25);

    fill(0, 0, 255);

    stroke(0, 0, 255);

    line(x-25, y+10, x-25, y-15);

    line(x+25, y+10, x+ 25, y- 15);
  }

  // Detect rock  x spaceship  
  boolean rockHit(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y);

    if (distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }
    boolean powerHit(PowerUp powerup) {
    float distance = dist(x, y, powerup.x, powerup.y);

    if (distance < rad + powerup.rad) {
      return true;
    } else {
      return false;
    }
  }
  void weapons_ps() {
}
  boolean enemyHit(EnemyShip enemyship) {
    float distance = dist(x, y, enemyship.x, enemyship.y);

    if (distance < rad + enemyship.rad) {
      return true;
    } else {
      return false;
    }
  }
  boolean gunHit(EnemyGun  enemygun) {
    float distance = dist(x, y, enemygun.x, enemygun.y);

    if (distance < rad + enemygun.rad) {
      return true;
    } else {
      return false;
    }
  }
}
