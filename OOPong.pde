Ball ball;
Paddle paddleLeft;
Paddle paddleRight;
int scoreLeft = 0;
int scoreRight = 0;
color bg;
void setup(){
  size(800,600);
  ball = new Ball(400, 300, 50);
  paddleLeft = new Paddle(15, height/2, 30,200);
  paddleRight = new Paddle(width-15, height/2, 30,200);
  ball.speedX = 5;
  ball.speedY = random(-3,3);
}

void draw(){
  background(0); // Clear the window
  bg = color(random(255), random(255), random(255));
  ball.move();
  ball.display();
  ball.ballBounce();
  paddleLeft.move();
  paddleLeft.display();
  paddleLeft.strictPaddleLeft();
  paddleRight.move();
  paddleRight.display();
  paddleRight.strcitPaddleRight();
  collide();
  scoreboard();
  number();
}

void number() {
  textSize(40);
  textAlign(CENTER);
  text(scoreRight, width/2+30, 30);
  text(scoreLeft, width/2-30, 30); 
}

void collide() {
   if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
  }

  if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
  }
}

void scoreboard() {
  if (ball.right() > width) {
    scoreLeft = scoreLeft + 1;
    ball.speedX = -ball.speedX;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.speedX = -ball.speedX;
    ball.x = width/2;
    ball.y = height/2;
  }
}



void keyPressed(){
  if(keyCode == UP){
    paddleRight.speedY=-3;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=3;
  }
  if(key == 'w' || key == 'W'){
    paddleLeft.speedY=-3;
  }
  if(key == 's' || key == 'S'){
    paddleLeft.speedY=3;
  }
}

void keyReleased(){
  if(keyCode == UP){
    paddleRight.speedY=0;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=0;
  }
  if(key == 'w' || key == 'W'){
    paddleLeft.speedY=0;
  }
  if(key == 's' || key == 'S'){
    paddleLeft.speedY=0;
  }
}
