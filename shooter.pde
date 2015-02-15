boolean shot = false;
boolean isMoveDown = true;
float x = 0;
int posY=0;
int v = 1;
PImage pic;


void setup(){
size(500, 400);
smooth();
noStroke();
pic = loadImage("l.jpg");
}


void draw(){ 
 int m = millis();
 //counting time var
 float t = 40 - m*0.001;
background(255);
image(pic, 0, 0);
textSize(10);
fill(#ffffff);
text("Click to start shooting", 280, 370);
text("Press UP ARROW to stop shooting", 280, 380);
textSize(20);
text(t, 50, 380);
// Print score
textSize(20);
  text(v-1, 300, 20);
 
   rectMode(CENTER);
  fill(255, 0, 0);
   //Left box
  rect(5, mouseY, 10, 50);
  

  // Start shooting on mouse Click
  if (shot) {
    fill(255);
    ellipse(x, mouseY, 20, 10);
      x+=20;}

// If ellipse is out of window its back to start
  if (x>width) {
   x=0; }
   
move();
   
// Add score 
  if (x >390 && mouseY>(posY-20) && mouseY < (posY+20)) {
  v++;
}
textAlign(CENTER);
if(v>35){
background(0, 255,255);
fill(#000000);
text("YOU WIN", width/2, height/2);
}
if(t <=0 && v < 35 ){
  v=0;
background(0);
fill(#ffffff);
text("YOU LOSE", width/2, height/2);
}
}

//start shooting
void mouseClicked() {
      shot = true;
      }
      
//stop shooting      
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      shot=false;
    }}}
    
    //move target
void move() {
if(isMoveDown == true) {
posY +=v+5;
}
else {
posY -=v+5;
}

if(posY>height)
{
isMoveDown = false;}

if(posY<0)
{
isMoveDown = true;}
ellipse(380, posY, v+10, v+10);
}

