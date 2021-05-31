//Global variables
int x, y;
void setup() {
  size(400, 400);
  frameRate(10);
  x=10;
  y=10;
}
void draw() {
  fill(0);
  keyPressed();
  myName();
  noLoop();
}
void mousePressed() {
  saveFrame("image-######.png");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight(10);
    } else if (keyCode == UP) {
      if (keyCode == RIGHT) {
        moveRightUp(10);
      } else {
        moveUp(10);
      }
    }  if (keyCode == DOWN) {
      moveDown(10);
    } else if (keyCode == LEFT) {
      moveLeft(10);
    }
  }
}

//method to draw a line to the right
void moveRight(int rep) {


  for (int i = 0; i<rep; i = i + 1) {
    point(x+i, y);
  }
  x=x+rep;
}
void moveDown(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x, y+i);
  }
  y = y + rep;
}
void moveUp(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x, y-i);
  }  
  y = y - rep;
}
void moveLeft(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x-i, y);
  }
  x = x-rep;
}
void moveRightUp(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x+i, y-i);
  }
  x=x+rep;
  y = y-rep;
}
void moveLeftUp(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x-i, y-i);
  }
  x=x-rep;
  y = y-rep;
}
void moveRightDown(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x+i, y+i);
  }
  x=x+rep;
  y = y+rep;
}
void moveLeftDown(int rep) {
  for (int i = 0; i<rep; i = i + 1) {
    point(x-i, y+i);
  }
  x=x-rep;
  y = y+rep;
}
void myName() {
  moveDown(200);
  moveRight(400);
  moveLeft(350);
  moveRightUp(30);
  moveRightDown(30);
  moveRightUp(30);
  moveRightDown(30);
  moveRight(30);
  moveRightUp(30);
  moveRightDown(15);
  moveLeft(30);
  moveRight(30);
  moveRightDown(15);
  moveRight(20);
  moveUp(50);
  moveRight(20);
  moveLeft(40);
  moveRight(20);
  moveDown(50);
  moveRight(50);
  moveUp(50);
  moveRight(20);
  moveLeft(40);
  moveRight(20);
  moveDown(50);
}
