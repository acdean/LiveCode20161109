import peasy.*;

float RAD1 = 100;
float RAD2 = 20;
int SEG1 = 36;
int SEG2 = 12;

PeasyCam cam;

void setup() {
  size(640, 360, P3D);
  cam = new PeasyCam(this, RAD1 * 2);
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  strokeWeight(4);
  beginShape(POINTS);
  for (int i = 0 ; i < SEG2 ; i++) {
    float ai = i * TWO_PI / SEG2;
    for (int j = 0 ; j < SEG1 ; j++) {
      float aj = j * TWO_PI / SEG1;
      float x = RAD1 + RAD2 * cos(ai);
      float y = RAD2 * sin(ai);
      rotateY(ai);
      point(x, y);
    }
  }
  endShape();
}