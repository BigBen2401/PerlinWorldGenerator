# PerlinWorldGenerator
A program that uses Perlin Noise to generate a world map.

The terrain is created by using Perlin Noise, with thresholds to determine different types of terrain.
The terrain can be scrolled and zoomed in/out using the keyboard.

Spaces for locations can be added, using a Normal Distribution for the size.
Spaces cannot overlap or be partially offscreen.
The program is guaranteed to generate \<Required\> spaces, and then tries to generate \<Optional\> additional spaces.
Note that spaces are added separately to the terrain, and so do not scroll or zoom with it.

This program uses the [G4P library](http://www.lagers.org.uk/g4p) to create a GUI.
This can be found and installed within Processing's Contribution Manager.

# GUI
- Terrain
  - `Noise seed` (Text Field) - The seed used to generate terrain.
  - `Shade terrain` (Checkbox) - While on, the terrain colours vary in brightness based on altitude.
  - `Greyscale colours` (Checkbox) - While on, all colours are converted to greyscale.
  - `Colours` (Drop List and Sliders) - Configures the colours of the layers of terrain, as well as spaces for locations.
- Locations
  - `Random seed` (Text Field) - The seed used to add spaces for locations.
  - `Size mean & Size deviation` (Text Fields) - The mean and standard deviation used for the size of the spaces.
  - `Required locations & Optional locations` (Text Fields) - The amount of spaces to add.
- `Generate` (Button) - Generates the map with the current settings.

# KEYS
- `WASD` - Scrolls the terrain up/left/down/right.
- `.,` - Zooms the terrain in/out. 
- `\` - Saves a text file containing all of the current settings. (Only on the Config window)

# KNOWN ISSUES
- Artifacts appear when pressing keys while on the Preview window. These are purely visual, and can be removed by clicking the Generate button.
- Due to limitations, the program itself cannot save images of the map. Either take a screenshot manually, or use the text file to recreate the map.
- There is no way within the GUI to change the thresholds for terrain types. These have to be edited in the code. They are located in the Map() constructor, as the first number in each of the arrays.
