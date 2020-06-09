

int HEIGHT = 800;
int WIDTH = 800;
float board_width = 100;
float board_height = 100;
int circle_size = 30;
float block_size = 100;
int bullet_speed = 10;

class board {
  float x, y, xDimension, yDimension;

  board() {
    xDimension = board_width;
    yDimension = board_height;
  }

  void display() {
    x = mouseX-board_width/2;
    y = HEIGHT-board_height;
    fill(255);
    image(spaceship, x, y, xDimension, xDimension);
    println("board display");
  }
}

class bullet {
  float x, y;
  boolean shot = false;

  bullet(float xpos, float ypos) {
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
    circle(x, y, circle_size);
    if (shot == true) {
      update();
    }
    if (y <= 0) {
      reset();
    }
    if (y-circle_size/2 <= MyBlock.y+block_size) {
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

class block {
  float x, y;

  block(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }

  void display() {
    fill(200);
    image(alienship, x, y, block_size, block_size);
  }

  void reset() {
    x = random(70, WIDTH-100);
    y = random(70, HEIGHT/2);
  }
}

board MyBoard = new board();
bullet MyBullet = new bullet(mouseX, HEIGHT-board_height-circle_size/2);
block MyBlock = new block(random(block_size, WIDTH-block_size), random(block_size, HEIGHT/2));
