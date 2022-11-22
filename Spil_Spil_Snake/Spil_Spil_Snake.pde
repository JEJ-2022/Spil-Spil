PShape t;
float x= 100;
float y=100;
float Speed=2.5;

void setup() {
  size(600, 600, P3D);
  t = loadShape("T-95.obj");


  textAlign(CENTER);
}

void draw() {
  background(250);

  //  frameRate(12); // skal skal være i setup!! men det er HARAM at bruge frameRate
  //println(mouseX+":"+mouseY);
  lines();
  borders();


  lights();

  drawTank();
  GameOver();
  
}

void drawTank() {
  shape(t, x, y);
}


void borders() {
  stroke(0);
  strokeWeight(2);
  line(0, 0, 0, 599);
  line(0, 599, 599, 599);
  line(599, 599, 599, 0);
  line(599, 0, 0, 0);
}
void lines() {
  strokeWeight(1);
  for (int i=0; i<height/20; i++) {
    line(0, i*20, width, i*20);
  }
  for (int i=0; i<width/20; i++) {
    line(i*20, 0, i*20, height);
  }
}

void keyPressed() {
  if (keyCode==UP) {
    y=y-Speed;
  }
  if (keyCode==DOWN) {
    y=y+Speed;
  }
  if (keyCode==LEFT) {
    x=x-Speed;
  }
  if (keyCode==RIGHT) {
    x=x+Speed;
  }
  
}
void GameOver(){
if (x>600 || x<0 || y>600 || y<0) {
    textSize(200);
    text("Game over", X/2, Y/2);
    textSize(100);
    text("Press SHIFT to restart", X/2-210, Y/2-210);
  }
}
