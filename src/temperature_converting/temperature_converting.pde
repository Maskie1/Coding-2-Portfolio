boolean play;
void setup() {
  size(1000, 500);
  play = false;
  frameRate(10);
}
void draw() {

  background(0, 0, 200);
  statuscheck(50);
  textSize(30);
  fill(200, 0, 0);
  textAlign(CENTER);
  text("Temperature comparison\nby Matthew Drollinger", width/2, 40);
  textSize(12);
  text("Move mouse left or right to change the temperature.", width/2, 120);
  
  stroke(12);
  
  line(400, 250, width, 250);
  fill(255);
  textSize(12);
  text("Cel", 380, 250);
  for (int i=400; i <width; i+=50) {
    line(i, 246, i, 254);
    textSize(8);
    textAlign(CENTER);
    fill(255);

    if (mouseX<400) {
      text(2*i-800, i, 246);
      ellipse(400, 250, 5, 5);
      text("Far   "+convertToFar(0), 400, 235);
    } else {
      text(2*i-800, i, 246);
      ellipse(mouseX, 250, 5, 5);
      text("Far   "+convertToFar(2*mouseX-800), mouseX, 235);
    }
  }
}
float convertToCel(float val) {
  return (val-432)*(5.0/9.0);
}
float convertToFar(float val) {
  return (val)*1.8 + 32;
}
void statuscheck(int i) {
  textSize(20);
  noStroke();
  if ( convertToFar(2*mouseX-800) <= 60) {
    zoog_worker(150, 200);
    fill(0, 170, 240);
    rectMode(LEFT);
    rect(100, 100, 200, 300);
    zoog_worker(150, 200);
    text("Status : COLD", 150, 75);
  } else if ( convertToFar(2*mouseX-800) >=60 & convertToFar(2*mouseX-800) <=95) {
    zoog_worker(150, 200);
    fill(0, 255, 0);
    rectMode(LEFT);
    rect(100, 100, 200, 300);
    zoog_worker(150, 200);
    text("Status : NORMAL", 150, 75);
  } else if ( convertToFar(2*mouseX-800) >=95 & convertToFar(2*mouseX-800)<=200) {
    fill(255, 175, 0);
    rectMode(LEFT);
    rect(100, 100, 200, 300);
    textAlign(CENTER);
    text("Status : HOT", 150, 75);
    zoog_worker(150, 200);
  } else if ( convertToFar(2*mouseX-800) >=200 & convertToFar(2*mouseX-800)<=800) {
rectMode(LEFT);
    fill(255, 0, 0);
    rect(100, 100, 200, 300);
    fill(128);
    rectMode(CENTER);
    noStroke();
    rect(150, 230, 15, 75);
    rect(150, 230, 60, 15);
    stroke(12);
    line(100, 267, 200, 267);
    text("Status : R.I.P. Zoog 1, 2020", 150, 75);
  } else if (convertToFar(2*mouseX-800) >=800 & convertToFar(2*mouseX-800)<=1300){
    fill(255,0,0);
    rectMode(LEFT);
    rect(100, 100, 200, 300);
    fill(255,250,0);
    triangle(150,150, 180,200, 120,200);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("!",  150, 195);
    textSize(20);
    text("WARNING", 150, 75);
  } else {
    if (i>= 0)
    for ( int x=0; x<=width; x+=10) {
      for (int y=0; y<=height; y+=10) {
                if (x >=100) {
          if (y>=100) {
            rectMode(CENTER);
            fill(random(255));
            rect(x, y, 10, 10);
            fill(255);
            
            
          }
          if (convertToFar(2*mouseX-800)>2000) {
          exit();
        }
        }
      }
    }
  }
}





//if(mousePressed) {
//    if (play == false){
//      play = true;
//    } else {
//     play = false;
//   }
//  }
void zoog_worker(int x, int y) {
  // set center mode
  ellipseMode (CENTER);
  rectMode(CENTER);


  // Draw Zoog's body
  stroke(0);
  fill(0, 200, 130);
  rect(x, y, 20, 100);
  line(x-10, y+20, x+10, y+20);
  // Draw zoogs head
  stroke(0);
  fill(255);
  ellipse(x, y-30, 60, 60);
  // Draw Zoog's eyes
  fill(0);
  ellipse(x-19, y-30, 16, 32);
  ellipse(x+19, y-30, 16, 32);

  //Draw Zoof's legs
  stroke(0);
  line(x-10, y+50, x-20, y+60);
  line(x+10, y+50, x+20, y+60);
  //zoog walk
}
