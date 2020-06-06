void setup() {
  size(800, 800); 
  background(255);
  frameRate(8);
}

void draw() {
  background(255); 

  translate(width/2, height/2);        

  for (int a = 0; a < 360; a+=2) {  

    float x = random(50, 100);
    float xx = random(200, 300);

    pushMatrix();                      
    rotate(radians(a));
    rect(x, 10, xx, 10);
    noStroke();
    fill(random(0, 255), 100, 100);
    popMatrix();
  }
}
