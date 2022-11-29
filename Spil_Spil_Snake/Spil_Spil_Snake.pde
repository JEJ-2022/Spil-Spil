PShape t;
float x = 100;//tankens x-position
float y = 100;//tankens y-position
float speed = 2;
int score = 0;
//int[] eTank = new int[2];
float ex = x;//eTanks x-position
float ey = y;//eTanks y-position

void setup() {
  size(600, 600, P3D);
  t = loadShape("T-95.obj");
  textAlign(CENTER);
  gameInit();
}

void draw() {
  background(250);

  //println(mouseX+":"+mouseY);
  //lines();
  borders();
  displayenemyTank();
  
  lights();

  // flyttter tank i den retning som man sidst har trykket
  move();
  drawTank();
  GameOver();
  tankCollision();
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
    y=y-speed;
  }
  if (keyCode==DOWN) {
    y=y+speed;
    //rotateX(3*PI/2);
  }
  if (keyCode==LEFT) {
    x=x-speed;
  }
  if (keyCode==RIGHT) {
    x=x+speed;
  }
}



void GameOver() {
  //println(x);
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

void placeEnemyTank(){
  ex=(int(random(20,width/20)))*20;
  ey=(int(random(20,height/20)))*20;
}

void displayenemyTank(){
fill(255,0,0);
rectMode(CENTER);
rect(ex,ey,20,20);
}

void tankCollision(){
  
  println(ex, ey, x, y);
if(ex == x && ey == y){
  text("GJ", height/2, width/2);
  
  placeEnemyTank();
  }
}

void gameInit(){
  
 placeEnemyTank();
}
