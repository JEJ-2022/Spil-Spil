
void setup(){
  size(600,600);
  textAlign(CENTER);
}

void draw(){
  background(250);
  frameRate(12);
  println(mouseX+":"+mouseY);
  lines();
  borders();
  
}
void borders(){
  stroke(0);
  strokeWeight(2);
  line(0,0,0,599);
  line(0,599,599,599);
  line(599,599,599,0);
  line(599,0,0,0);
}
void lines(){
  strokeWeight(1);
for(int i=0; i<height/20; i++){
  line(0,i*20,width,i*20);}
for(int i=0; i<width/20; i++){
  line(i*20,0,i*20,height);}
}
