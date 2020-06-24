import processing.serial.*;
Serial myPort;

PImage topdownviewpiano;

float  val;

int x = 180;
int y = 450;

boolean c1= false;
boolean c = false; 

boolean d = false;
boolean d1 = false;

boolean e = false;

boolean f = false;
boolean f1 = false;

boolean g = false;
boolean g1 = false;

boolean a = false;
boolean a1 = false;

boolean b = false;
boolean b1 = false;


void setup() {
  size(800, 532);
  frameRate(12);         //to see changes more clearly, appropriate frameRate found experimentally
  topdownviewpiano = loadImage("topdownviewpiano .jpg");

  // Importing Arduino
  myPort = new Serial (this, Serial.list()[5], 9600);

  myPort.bufferUntil('\n');
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim (inString);
    val = float(inString);
    if (val == 1) {            // c is playing 
      c = true;
      println(val);
    } else if (val ==  2) {    // d is playing 
      d = true;
      println(val);
    } else if (val == 3) {    // e is playing 
      e = true;
      println(val);
    } else if (val == 4) {    // f is playing 
      f = true;
      println(val);
    } else if (val == 5) {    // g is playing 
      g = true;
      println(val);
    } else if (val == 6) {    // a is playing 
      a = true;
      println(val);
    } else if (val == 7) {    // b is playing 
      b = true;
      println(val);
    } else if (val == 9) {
      c1 = true;
      println(val);
    } else if (val == 10) {
      d1 = true;
      println(val);
    } else if (val == 11) {
      f1 = true;
      println(val);
    } else if (val == 12) {
      g1 = true;
      println(val);
    } else if (val == 13) {
      a1 = true;
      println(val);
    } else if (val == 14) {
      b1 = true;
      println(val);
    }
  }
}

void draw() {
  image(topdownviewpiano, 0, 0);

  noStroke();
  fill(0);

  if (c == true) {
    ellipse(x, y, 40, 40);
    c = false;
  } else if (d == true) {
    ellipse(x + 75, y, 40, 40);
    d = false;
  } else if (e == true) {
    ellipse(x + 150, y, 40, 40);
    e = false;
  } else if (f == true) {
    ellipse(x + 225, y, 40, 40);
    f = false;
  } else if (g == true) {
    ellipse(x + 295, y, 40, 40);
    g = false;
  } else if (a == true) {
    ellipse(x + 365, y, 40, 40);
    a = false;
  } else if (b == true) {
    ellipse(x + 445, y, 40, 40);
    b = false;
  } else if (c1 == true) {
    fill(118, 130, 200);
    ellipse(208, 300, 20, 20); // c# is playing
    c1 = false;
  } else if (d1 == true) {
    fill(118, 130, 200);
    ellipse(295, 300, 20, 20); // d# is playing
    d1 = false;
  } else if (f1 == true) {
    fill(118, 130, 200);
    ellipse(425, 300, 20, 20); // f# is playing
    f1 = false;
  } else if (g1 == true) {
    fill(118, 130, 200);
    ellipse(510, 300, 20, 20); // g# is playing
    g1 = false;
  } else if (a1 == true) {
    fill(118, 130, 200);
    ellipse(600, 300, 20, 20); // a# is playing
    a1 = false;
  } else if (b1 == true) {
    ellipse(x + 520, y, 40, 40); // b# = C is playing
    b1 = false;
  }
}
