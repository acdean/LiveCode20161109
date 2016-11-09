import peasy.*;

float RAD1 = 100;
float RAD2 = 20;
int SEG1 = 24;
int SEG2 = 8;
boolean video = false;
boolean jiggle = true;

PeasyCam cam;
color c0, c1, dc0, dc1;
float rx0, ry0, dx0, dy0;
float rx1, ry1, dx1, dy1;
int COLOURS = 500;

void setup() {
  size(640, 360, P3D);
  cam = new PeasyCam(this, RAD1 * 3);
  c0 = color(random(192, 256), random(192, 256), random(192, 256));
  c1 = color(random(192, 256), random(192, 256), random(192, 256));
  rx0 = random(TWO_PI);
  ry0 = random(TWO_PI);
  rx1 = random(TWO_PI);
  ry1 = random(TWO_PI);
  dx0 = random(-.02, .02);
  dy0 = random(-.02, .02);
  dx1 = random(-.02, .02);
  dy1 = random(-.02, .02);
  dc0 = (int)random(-3, 3);
  dc1 = (int)random(-3, 3);
  colorMode(HSB, COLOURS, 100, 100);
}

void draw() {
  background(0, 0, 0);
  rotateX(frameCount * .03);
  rotateY(frameCount * .014);
  rx0 += dx0;
  ry0 += dy0;
  rx1 += dx1;
  ry1 += dy1;
  c0 = (c0 + dc0 + COLOURS) % COLOURS;
  c1 = (c1 + dc1 + COLOURS) % COLOURS;
  donut(50, 0, c0, rx0, ry0);
  donut(-50, 0, c1, rx1, ry1);
  
  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

void donut(float x0, float y0, color c, float rx, float ry) {
  pushMatrix();
  rotateX(rx);
  rotateY(ry);
  stroke(c, 100, 100);
  strokeWeight(8);
  for (int i = 0 ; i < SEG2 ; i++) {
    float ai = i * TWO_PI / SEG2;
    for (int j = 0 ; j < SEG1 ; j++) {
      float aj = j * TWO_PI / SEG1;
      if ((i % 2) == 0) {
        aj = (j + .5) * TWO_PI / SEG1;
      }
      float x = RAD1 + RAD2 * cos(ai);
      float y = RAD2 * sin(ai);
      pushMatrix();
      rotateY(aj);
      float randX = 0, randY = 0;
      if (jiggle) {
        randX = random(-5, 5);
        randY = random(-5, 5);
      }
      point(x0 + x + randX, y0 + y + randY);
      popMatrix();
    }
  }
  popMatrix();
}

void keyPressed() {
  if (key == 's') {
    saveFrame("snapshot####.png");
  }
}