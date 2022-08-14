int time;
int RADIUS = 100;
int DEGREES = 360;

//Variables for the time;
int second = second();
int minute = minute();
int hour = hour();


void setup() {
 size(500, 500);
 //setting the frameRate to 1, therefore its only updating once a second
 frameRate(1);
 background(255);
  //centering the starting point of the canvas
  translate(width/2,height/2);
  
  //drawing the clock
  fill(53);
  circle(0, 0, RADIUS*3.25);
  
  //setting seconds, minutes and hours
  second = second();
  minute = minute();
  hour = hour();
 
 //setting textSize
 textSize(24);
 //making string with a digital clock by using the set variables
 String clock = hour + ":" + minute + ":" + second;
 //outputting the digital clock to the screen
 text(clock,  - textWidth(clock)/2, -200);
 
 //coloring every object white
 fill(255);
 
 strokeWeight(3);
 stroke(255);
  
  //drawing each of the hands using drawHand method
  drawHand(hour, RADIUS, 0);
  drawHand(minute, RADIUS * 1.5, 1);
  //setting strokeweight for the secondhand to be smaller
  strokeWeight(1);
  drawHand(second, RADIUS * 1.25, 1);
  
  //middle dot
  fill(255);
  circle(0, 0, 5);
  
  //minutdots
  drawPointerMarks(RADIUS * 1.5);
}

void draw() {
  clear();
  background(255);
  //centering the starting point of the canvas
  translate(width/2,height/2);

  //drawing the clock
  fill(53);
  circle(0, 0, RADIUS*3.25);

  //setting seconds, minutes and hours
  second = second();
  minute = minute();
  hour = hour();
 
 //setting textSize
 textSize(24);
 //making string with a digital clock by using the set variables
 String clock = hour + ":" + minute + ":" + second;
 //outputting the digital clock to the screen
 text(clock,  - textWidth(clock)/2, -200);
 
 //coloring every object white
 fill(255);
 
 strokeWeight(3);
 stroke(255);
  
  //drawing each of the hands using drawHand method
  drawHand(hour, RADIUS, 0);
  drawHand(minute, RADIUS * 1.5, 1);
  //setting strokeweight for the secondhand to be smaller
  strokeWeight(1);
  drawHand(second, RADIUS * 1.25, 1);
  
  
  //middle dot
  fill(255);
  circle(0, 0, 5);
  
  //minutdots
  drawPointerMarks(RADIUS * 1.5);
}

//drawHand method that draws a hand on the clock depending on the input
void drawHand(int hour, float rad, int type) {
  //setting the how many parts the cirle should be divided into 
  //depending on which type of hand it is
  int div = 0;
  if (type == 0) {div = 12;}
  else if (type == 1) {div = 60;}
  
  //calculating the angle of the hand
  float angle = 360 / div * hour;
  
  //calculating the coordinates for x and y 
  //by using cos and sin to the angle(in radians) times the radius
  float x = rad * cos(radians(angle) - HALF_PI);
  float y = rad * sin(radians(angle) - HALF_PI);
  
  //drawing the lines
  line(0, 0, x, y);
}

void drawPointerMarks(float rad) {
  int pointsAngle = 360 / 60;
    
  for (int i = 0; i < 360; i += pointsAngle) {
    float x = rad * cos(radians(i) - HALF_PI);
    float y = rad * sin(radians(i) - HALF_PI);
    
    if(i % 5 == 0) {
      circle(x, y, 5);
    } 
    else {
      circle(x, y, 2.5);
    }
  }
}
