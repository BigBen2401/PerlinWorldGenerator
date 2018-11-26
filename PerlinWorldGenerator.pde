import g4p_controls.*;

final int WIDTH = 800, HEIGHT = 600;
float XPOS = 10000, YPOS = 10000;
float SCALE = 0.01;
boolean SHADE = true, GREY = false;
int NOISE_SEED = 0, RANDOM_SEED = 0;
float DEVIATION = 10, MEAN = 50;
float REQUIRED_LOCS = 0, OPTIONAL_LOCS = 0;

Preview preview;
Map map;
boolean ready = false;

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  preview = new Preview();
  PApplet.runSketch(new String[] {""}, preview);
  map = new Map();
  createGUI();
  stroke(0);
  noFill();
}

void draw() {
  background(255);
  rect(24, 24, 351, 51);
  rect(424, 24, 351, 51);
  rect(424, 224, 151, 51);
  rect(624, 224, 151, 51);
  rect(424, 324, 151, 51);
  rect(624, 324, 151, 51);
  line(400, 0, 400, 600);
  line(400, 400, 800, 400);
}

void keyPressed() {
  preview.key = key;
  preview.keyPressed();
  if (key == '\\') selectOutput("Select a file to write to:", "fileSelected");
}

void fileSelected(File selection) {
  if (selection == null) return;
  saveStrings(selection.getAbsolutePath()+".txt", getMeta());
}
