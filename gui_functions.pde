void setTerrainCol() {
  Object[] o = map.terrain.get(terrain_list.getSelectedIndex());
  o[1] = terrain_col_red.getValueI();
  o[2] = terrain_col_green.getValueI();
  o[3] = terrain_col_blue.getValueI();
}

void getTerrainCol() {
  Object[] o = map.terrain.get(terrain_list.getSelectedIndex());
  terrain_col_red.setValue((int)o[1]);
  terrain_col_green.setValue((int)o[2]);
  terrain_col_blue.setValue((int)o[3]);
}

int convertInt(GTextField txt) {
  String str = txt.getText();
  int seed = 0;
  if (str.matches("-?\\d+(\\.\\d+)?")) {
    seed = round(float(str));
  } else {
    for (char c : str.toCharArray()) {
      seed ^= c;
    }
  }
  seed = abs(seed);
  txt.setText(str(seed));
  return seed;
}

float convertFloat(GTextField txt) {
  String str = txt.getText();
  float seed = 0;
  if (str.matches("-?\\d+(\\.\\d+)?")) {
    seed = float(str);
  } else {
    int s = 0;
    for (char c : str.toCharArray()) {
      s ^= c;
    }
    seed = s;
  }
  seed = abs(seed);
  txt.setText(str(seed));
  return seed;
}

ColourCode setColourCode() {
  boolean SHADE = terrain_shade.isSelected();
  boolean GREY = terrain_grey.isSelected();
  if (SHADE) {
    if (GREY) return col_yesShade_yesGrey;
    else return col_yesShade_noGrey;
  } else {
    if (GREY) return col_noShade_yesGrey;
    else return col_noShade_noGrey;
  }
}

String[] getMeta(){
  String[] s = new String[29];
  s[0] = "Noise seed: "+NOISE_SEED;
  s[1] = "Shade terrain: "+terrain_shade.isSelected();
  s[2] = "Greyscale colours: "+terrain_grey.isSelected();
  s[3] = "Layer 1 - Red: "+map.terrain.get(0)[1];
  s[4] = "Layer 1 - Green: "+map.terrain.get(0)[2];
  s[5] = "Layer 1 - Blue: "+map.terrain.get(0)[3];
  s[6] = "Layer 2 - Red: "+map.terrain.get(1)[1];
  s[7] = "Layer 2 - Green: "+map.terrain.get(1)[2];
  s[8] = "Layer 2 - Blue: "+map.terrain.get(1)[3];
  s[9] = "Layer 3 - Red: "+map.terrain.get(2)[1];
  s[10] = "Layer 3 - Green: "+map.terrain.get(2)[2];
  s[11] = "Layer 3 - Blue: "+map.terrain.get(2)[3];
  s[12] = "Layer 4 - Red: "+map.terrain.get(3)[1];
  s[13] = "Layer 4 - Green: "+map.terrain.get(3)[2];
  s[14] = "Layer 4 - Blue: "+map.terrain.get(3)[3];
  s[15] = "Layer 5 - Red: "+map.terrain.get(4)[1];
  s[16] = "Layer 5 - Green: "+map.terrain.get(4)[2];
  s[17] = "Layer 5 - Blue: "+map.terrain.get(4)[3];
  s[18] = "Locations - Red: "+map.terrain.get(5)[1];
  s[19] = "Locations - Green: "+map.terrain.get(5)[2];
  s[20] = "Locations - Blue: "+map.terrain.get(5)[3];
  s[21] = "Random seed: "+RANDOM_SEED;
  s[22] = "Size mean: "+MEAN;
  s[23] = "Size deviation: "+DEVIATION;
  s[24] = "Required locations: "+REQUIRED_LOCS;
  s[25] = "Optional locations: "+OPTIONAL_LOCS;
  s[26] = "X pos: "+XPOS;
  s[27] = "Y pos: "+YPOS;
  s[28] = "Scale: "+SCALE;
  return s;
}
