// Loan Hoang - Introduction to Interactive Media - Final Project 
// Space Ship Invasion controled by push button on Arduino

/* Resources used: 
Starfield by Dann Shiffman: https://www.youtube.com/watch?v=17WoOqgXsRM&t=2s
*/


import processing.serial.*;
Serial myPort;

import processing.sound.*;
SoundFile file; 



Star[] stars = new Star[400];                  // Array of stars
int rect_w = 70;
int rect_h = 30;

boolean start = false;

int input;


void setup() {
  size(600, 600);
  spaceship = loadImage("spaceship.png");       // load image for the space ship
  alienship = loadImage("alienship2.png");      // load image for the alien ship
  galaxy = loadImage("Galaxy.jpg");
  smooth();
  stroke(255);
  strokeWeight(5);

  
  for (int i=0; i<stars.length; i++)            // Init all stars
    stars[i] = new Star();


  
  file = new SoundFile(this, "Night-Winds.mp3"); //Opening music
  file.play();
  
  myPort = new Serial (this, Serial.list()[5], 9600);
  
  myPort.bufferUntil('\n');
  
}

void draw() {
  if (start == false) {                          //if the game has not started yet (the player has not yet pressed the button Start)

    
    translate(0.5*width, 0.5*height);           // Draw all stars wrt center of screen

    
    for (int i=0; i<stars.length; i++) {        // Update and draw all stars
      stars[i].update();
      stars[i].draw();
      stars[i].draw_text();
    }
  } else {                                      //if the game has started (the player has pressed the button Start), change the screen 
    image(galaxy, -600, 0); // Background for the play screen
    MyBoard.display();
    MyBullet.display();
    MyBlock.display();
  }
}


class Star {
                                               // Star coordinates in 3D
  float x;
  float y;
  float z;

  Star() {
    x = random(-5000, 5000);
    y = random(-5000, 5000);
    z = random(0, 2000);
  }

  void update() {
    z-=10;                                    // Move star closer to viewport
    if (z <= 0.0)                             // Reset star if it passes viewport
      reset();
  }

  void reset() {
    // Reset star to a position far away
    x = random(-5000, 5000);
    y = random(-5000, 5000);
    z = 2000.0;
  }

  void draw() {

                                             // Project star only viewport
    float offsetX = 100.0*(x/z);
    float offsetY = 100.0*(y/z);
    float scaleZ = 0.0001*(2000.0-z);


                                            // Draw this star
    pushMatrix();
    translate(offsetX, offsetY);
    scale(scaleZ);
    fill(255);
    ellipse(0, 0, 30, 30);
    popMatrix();
  }


  void draw_text() {
    PFont f;
    f= createFont("Revamped", 30);
    textFont(f);
    fill(random(0, 255), random(0, 255), random(0, 255));

    textAlign(CENTER);
    text("Space Ship Invasion", 0, 0);

    // Draw the "Start" button 
    PFont start; 
    start = createFont("Propaganda", 20); 
    textFont(start); 
    textAlign(CENTER); 

    fill(0);
    stroke(111);
    strokeWeight(1);
    rect(0, 43, rect_w, rect_h);
    rectMode(CENTER);
    fill(60, 124, 24);
    text("Start", 0, 50);
  }
}

void serialEvent(Serial myPort){                         // control the ship with push buttons
  String inString = myPort.readStringUntil('\n');
  if (inString != null){
    inString = trim(inString);
    input = int(inString);
    if (input == 1){                                    // button1: ship goes left 
      MyBoard.x += 1;
      MyBullet.x += 1;
      println(input);
    }
    else if (input == 2){                               // button2: ship goes right 
      MyBoard.x -= 1;
      MyBullet.x -= 1;
      println(input);
    }
    else if (input == 3){                               // button3: ship shoots the bullet 
      MyBullet.shot = true;
      println(input);
    }
    else if (input == 4){                               // button4: restart the game
      start = false;
    }
  }
  
}
