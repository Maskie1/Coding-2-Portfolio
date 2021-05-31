// Matthew Drollinger computer timeline project Septermber 14, 2020
boolean hover;
PFont font1;
void setup () {
  size(1100, 400);
  hover = false;
}
void draw () {
  background(0, 100, 200);
  fill(128);
  rect(850, 100, 200, 200);
  println(mouseX);
  histEvent(75, 190, 120, 30, "Colossus(1944)", "Colossus was the first\nfully electronical computer,\nunlike previous computers\nwhich were partially mechanical.\nColossus had 2400 valves,\nand was operated directly\noff of printed tape.", true);
  histEvent(162, 285, 90, 30, "ENIAC(1946)", "ENIAC was the first\nuniversal electronic computer.\nWhile Colossus could only\nperform one task,\nENIAC would do whatever it was\ntold to according to\nits programming.", false);
  histEvent(249, 190, 150, 30, "Manchester Baby(1948)", "This machine was truly \nuniversal. While ENIAC was\ntechnically universal, it would\ntake several days to switch\nthe operation being performed\nbecause of its design.\nThe Manchester baby also\nwas the first\ncomputer with internal\nmemory.", true);
  histEvent(336, 285, 110, 30, "UNIVAC 1(1951)", "This computer, made by\nthe creators of ENIAC,\nwas the first commercially\nbuilt computer. It was\nmeant for buisiness,\nalthough only the richest\ncompanies could afford\none.", false);
  histEvent(423, 190, 110, 30, "PDP 8(1965)", "This was the first\ncommercially succesful \nmini-computer. Built by DEC,\nthis computer sold over\n50000 units, and\nwas a fraction of the cost of\nbig computers.", true);
  histEvent(510, 285, 110, 30, "IBM 5150(1981)", "This is considered the first PC.\nAll modern PC's start here.\nThis computer was much\nmore affordable than \nearlier computers, and \ncemented the idea\nof a personal computer\nin the public eye.", false);
  histEvent(597, 190, 150, 30, "Commodore 64(1982)", "This is the single best selling \ncomputer of all time. \nIt was very affordable,\ncould be plugged into a TV, \nand had good graphical \ncapabilities for the time.", true);
  histEvent(654, 285, 170, 30, "Apple Macintosh(1984)", "This computer revolutionized \nthe computer interface, adding \na GUI, a mouse, and being \nable to click on graphical \nbuttons instead of typing \nout obscure \nletters.", false);
  drawRef();
}
void drawRef() {
  // title
  textAlign(CENTER);
  textSize(36);
  fill(100, 0, 120);
  text("Historic Computer Timeline", width/2, 50);
  textSize(15);
  fill(0);
  text("Made by Matthew Drollinger", width/2, 70);
  textSize(12);
  fill(0);
  text("this is a list of 8\nhistoric computers, arranged in order of completion.\nHover your mouse over one to learn\nmore.", width/2, 85);

  //Descriptive text

  // timeline
  stroke(0, 255, 0);
  strokeWeight(5);
  line(100, 250, 800, 250);
  stroke(0, 0, 0);

  // decoration


  // tickmarks
}

void histEvent(int x, int y, int a, int b, String title, String description, Boolean top) {
  // draw a rectangle
  strokeWeight(1);
  fill(100, 200, 255);
  rect(x, y, a, b, 5);
  //draw the connecting line
  stroke(0, 0, 0);
  textAlign(CENTER);
  if (top) {
    line(x+a/2, y+b, x +a/2+ 20, 250);
  } else {
    line(x+a/2, y, x+a/2+20, 250);
  }
  textSize(12);
  // draw the title of the historic event
  textAlign(CENTER, CENTER);
  fill(0);
  text(title, x +a/2, y +  b/2);
  // detect the mouse over
  hover = (mouseX > x && mouseX < x + a && mouseY > y && mouseY < y + b);
  if (hover) {
    textAlign(LEFT);
    text(description, 860, 120);
    fill(50, 50, 200);
    rect(x, y, a, b, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(title, x +a/2, y +  b/2);
  } else {
    fill(100, 100, 255);
  }
}
