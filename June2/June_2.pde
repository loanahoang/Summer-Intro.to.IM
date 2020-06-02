void setup() {
  size(800, 600);
  
}

float x = 400 ;
float y = 300;
float xSpeed = random(8);
float ySpeed = random(5);

void draw(){
  //background(0);
  
//drawing the circle
  ellipse(x, y, 30, 30);
  fill(color(0)); 
  
  x += xSpeed;
  y += ySpeed;
  if (x >= width || x <= 0) {
    xSpeed = -xSpeed;
    background(random(255),random(255),random(255));
  }
  
  if (y >= height || y <= 0) {
    ySpeed = -ySpeed;
    background(random(255),random(255),random(255));
  }
// I don't know how to keep the changed background while making the it drawing the new cirlce at the same time
}
