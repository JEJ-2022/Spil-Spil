PShape t;
float x=100;
float y=100;
float Speed=2.5;


void setup() {
  size(600, 600, P3D);
  t = loadShape("T-95.obj");
  textAlign(CENTER);
}

void draw() {
  background(250);

  //println(mouseX+":"+mouseY);
  //lines();
  borders();

  lights();

  // flyttter tank i den retning som man sidst har trykket
  move();
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
  // den skal bare være tom ;)
  if (keyCode==ENTER) {
    restart();
  }
}

void move() {
  // flyyter tank hele tiden og ikke kun ved et enkelt tastetryk
  if (keyCode==UP) {
    y=y-Speed;
    
  }
  if (keyCode==DOWN) {
    y=y+Speed;
    //rotateX(3*PI/2);
  }
  if (keyCode==LEFT) {
    x=x-Speed;
  }
  if (keyCode==RIGHT) {
    x=x+Speed;
  }
}



void GameOver() {
  println(x);
  if (x>600 || x<0 || y>600 || y<0) {

    textSize(50);
    // SORT
    fill(0);
    // WTF :) X/2 og Y/2 ??? I skal bruge widt og height - x,y er positionen for jeres kampvogn
    // text("Game over", X/2, Y/2);
    text("Game over", width/2, height/2);
    
    textSize(25);
    //text("Press ENTER to restart", X/2-210, Y/2-210);
    text("Press ENTER to restart", width/2, height/2-210);
    noLoop();
  }
}

void restart() {
  if (x>600 || x<0 || y>600 || y<0) {
  x=100;
  y=100;
  // sæt draw til at loope igen / start spillet
  loop();
  }
}
