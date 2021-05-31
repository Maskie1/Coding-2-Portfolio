class Button2 {
int x, y, w, h, rad;
String text;
boolean hover, effect;

Button2(int tempX, int tempY, int tempW, int tempH, String tempText ) {
  x = tempX;
  y = tempY;
  w = tempW;
  h = tempH;
  text = tempText;
  hover = false;
}

void display() {
fill(0,255,0);
if (mousePressed) { 
if (hover) {
  fill(0,200,0);
}
}


  rectMode(CENTER);

  // the outer rectangle of the button

  rect(x, y, w, h);



  

  fill(0,0,255);
  text(text,x-40,y+5);
}
void hover() {
  if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY>= y-h/2 && mouseY <= y+ h/2) {
    hover = true;
  }else {
    hover = false;
  }
  
}
void mouseReleased() {
  effect = false;
}
}
