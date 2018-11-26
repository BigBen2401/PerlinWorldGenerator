class Map {

  ArrayList<Object[]> terrain = new ArrayList<Object[]>(); //terrain[0] = {float threshold, int red, int green, int blue};
  color[][] tile = new color[800][600];
  ColourCode col = col_yesShade_noGrey;
  ArrayList<float[]> locations = new ArrayList<float[]>();

  Map() { //                 VVV These are the thresholds. (0-1)
    terrain.add(new Object[]{0.7, 255, 255, 255});//SNOW
    terrain.add(new Object[]{0.5, 255, 128, 000});//MOUNTAIN
    terrain.add(new Object[]{0.3, 000, 255, 000});//GRASS
    terrain.add(new Object[]{0.2, 000, 128, 255});//OCEAN
    terrain.add(new Object[]{0.0, 000, 000, 128});//DEEP_OCEAN
    terrain.add(new Object[]{9.9, 255, 000, 255});//LOCATIONS
    generate();
  }

  void generate() {
    ready = false;
    noiseSeed(NOISE_SEED);
    randomSeed(RANDOM_SEED);
    for (int i = -WIDTH/2; i < WIDTH/2; ++i) {
      for (int j = -HEIGHT/2; j < HEIGHT/2; ++j) {
        tile[i+WIDTH/2][j+HEIGHT/2] = colour(i*SCALE+XPOS, j*SCALE+YPOS);
      }
    }
    locations.clear();
    float[] f = new float[3];
    for (int i = 0; i < REQUIRED_LOCS; ++i) {
      f[0] = randomNormal(MEAN, DEVIATION);
      f[1] = random(f[0], WIDTH-f[0]);
      f[2] = random(f[0], HEIGHT-f[0]);
      boolean valid = true;
      for (float[] l : locations) {
        if (dist(f[1], f[2], l[1], l[2])<f[0]+l[0]) {
          valid = false;
        }
      }
      if (valid) locations.add(f.clone());
      else --i;
    }
    for (int i = 0; i < OPTIONAL_LOCS; ++i) {
      f[0] = randomNormal(MEAN, DEVIATION);
      f[1] = random(f[0]/2, WIDTH-f[0]/2);
      f[2] = random(f[0]/2, HEIGHT-f[0]/2);
      boolean valid = true;
      for (float[] l : locations) {
        if (dist(f[1], f[2], l[1], l[2])<f[0]+l[0]) {
          valid = false;
        }
      }
      if (valid) locations.add(f.clone());
    }
    ready = true;
  }

  color colour(float i, float j) {
    float noise = noise(i, j);
    for (Object[] o : terrain) {
      if (noise > (float)o[0]) return col.run(noise, o);
    }
    return color(0);
  }

  float randomNormal(float MU, float SIGMA) {
    float LIM = 3*SIGMA;
    return constrain(randomGaussian()*SIGMA+MU, MU-LIM, MU+LIM);
  }
}

interface ColourCode {
  color run(float noise, Object[] o);
  //GREY = 0.3R + 0.6G + 0.1B;
}

ColourCode col_noShade_noGrey = new ColourCode() {
  color run(float noise, Object[] o) {
    return color((int)o[1], (int)o[2], (int)o[3]);
  }
};
ColourCode col_noShade_yesGrey = new ColourCode() {
  color run(float noise, Object[] o) {
    return color(0.3*(int)o[1]+0.6*(int)o[2]+0.1*(int)o[3]);
  }
};
ColourCode col_yesShade_noGrey = new ColourCode() {
  color run(float noise, Object[] o) {
    return color((int)o[1]*noise, (int)o[2]*noise, (int)o[3]*noise);
  }
};
ColourCode col_yesShade_yesGrey = new ColourCode() {
  color run(float noise, Object[] o) {
    return color((0.3*(int)o[1]+0.6*(int)o[2]+0.1*(int)o[3])*noise);
  }
};
