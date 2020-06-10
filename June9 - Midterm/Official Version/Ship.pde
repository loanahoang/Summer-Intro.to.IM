PImage spaceship; 
PImage alienship; 
PImage galaxy;

int HEIGHT = 600;
int WIDTH = 600;
float board_width = 200;
float board_height = 200;
int circle_size = 20;
float block_size = 100;
int bullet_speed = 8;


class Board {
  float x, y, xDimension, yDimension;

  Board() {
    xDimension = board_width;
    yDimension = board_height;
  }

  void display() {
    x = mouseX-board_width/2;
    y = HEIGHT-board_height;
    image(spaceship, x, y, xDimension, xDimension);
  }
}

class Bullet {
  float x, y;
  boolean shot = false;

  Bullet(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }

  void display() {
    fill(111);
    if (mousePressed == true) {
      shot = true;
    }
    if (shot == false) {
      x = mouseX;
    }
    circle(x, y + 100, circle_size);
    if (shot == true) {
      update();
    }
    if (y <= 0) {
      reset();
    }
    if (y-circle_size/2 +120 <= MyBlock.y+block_size) {
      if (x+circle_size/2 >= MyBlock.x && x-circle_size/2 <= MyBlock.x+block_size) {
        reset();
      }
    }
  }

  void update() {
    y -= bullet_speed;
  }

  void reset() {
    shot = false;
    x = mouseX;
    y = HEIGHT-board_width-circle_size/2;
    MyBlock.reset();
  }
}

class Block {
  float x, y;

  Block(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }

  void display() {
    //fill(200);
    image(alienship, x, y, block_size, block_size);
  }

  void reset() {
    x = random(70, WIDTH-100);
    y = random(70, HEIGHT/2);
  }
}

Board MyBoard = new Board();
Bullet MyBullet = new Bullet(mouseX, HEIGHT-board_height-circle_size/2);
Block MyBlock = new Block(random(block_size, WIDTH-block_size), random(block_size, HEIGHT/2));
