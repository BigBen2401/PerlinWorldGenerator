class Preview extends PApplet {

  Preview() {
  }

  void settings() {
    size(WIDTH, HEIGHT);
  }

  void setup() {
    noStroke();
  }

  void draw() {
    if (ready) {
      loadPixels();
      for (int i = 0; i < WIDTH; ++i) {
        for (int j = 0; j < HEIGHT; ++j) {
          pixels[j*WIDTH+i] = map.tile[i][j];
        }
      }
      updatePixels();
      fill(map.col.run(1, map.terrain.get(5)));
      for (float[] f : map.locations) {
        ellipse(f[1], f[2], f[0], f[0]);
      }
    } else {
      background(0);
      fill(255);
      textSize(40);
      textAlign(CENTER, CENTER);
      text("LOADING", 0, 0, WIDTH, HEIGHT);
    }
  }

  void keyPressed() {
    key = Character.toLowerCase(key);
    if (!(noise_seed.hasFocus()||random_seed.hasFocus()
      ||mean_normal.hasFocus()||deviation_normal.hasFocus()
      ||min_normal.hasFocus()||max_normal.hasFocus())) {
      if (key == 'w') YPOS -= SCALE*100;
      if (key == 'a') XPOS -= SCALE*100;
      if (key == 's') YPOS += SCALE*100;
      if (key == 'd') XPOS += SCALE*100;
      if (key == '.') SCALE -= 0.001;
      if (key == ',') SCALE += 0.001;
      SCALE = constrain(SCALE, 0.001, MAX_FLOAT);
      keyboard_pos.setText("Pos: ("+nf(XPOS, 1, 1)+","+nf(YPOS, 1, 1)+")");
      keyboard_scale.setText("Scale: x"+nf(SCALE, 1, 3));
      map.generate();
    }
  }
}

void circle(int radius, CircleCode cc) {
  for (int i = -radius; i <= radius; ++i) {
    for (int j = -radius; j <= radius; ++j) {
      if (i*i+j*j<radius*radius) cc.run(i, j);
    }
  }
}

interface CircleCode {
  public void run(int i, int j);
}
