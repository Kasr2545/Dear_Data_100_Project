class Stars{
  float decimal;       // This is used to store the deimal calculation from main
  float maxDiameter=350; // This sets the max diameter for all stars
  float x, y;          // This is x and y coordinates for the satr
  color col;           // This is so a colour can be created and then stored
  float StarDiameter;    // This si where the actual radius of each star will be stored  

  Stars(float decimal, float x, float y) {
    // 'this.' makes it so it refers to the current object instance.
    this.decimal=decimal;
    this.x=x;
    this.y=y;

    // this will dictate colour of sun based on its size
    StarDiameter = (decimal * maxDiameter)/2;

    //if statemnt to determine colour for Star object instance
    if (decimal <= 0.1)
    {
      // This is a crimson red to represent dwarf stars as they are small
      col = color(255, 25, 35);
    } else if (decimal<=0.3)
    {
      // This colour is more of the standard Goldish/Yellow-Orange Sun
      col = color(255, 185, 0);
    } else
    {
      // This Colour is more of a azure blue
      col = color(0, 128, 255);
    }
  }

  // This is a method to give the Star a glowing effect.
  void glow()
  {
    pushStyle();                               // Saves the current drawing settings
    // outer glow - It tkes the RGB values from 'col'
    fill(red(col), green(col), blue(col), 35);  // 5 makes high transparancy
    circle(x, y, StarDiameter * 2.5);            // makes it so radius is 2.5x larger than original

    // middle glow - It tkes the RGB values from 'col'
    fill(red(col), green(col), blue(col), 50);  // 15 makes it less transparant compared to 5
    circle(x, y, StarDiameter * 1.6);            // makes it so radius is 1.6x larger than original

    // inner glow - It tkes the RGB values from 'col'
    fill(red(col), green(col), blue(col), 70); // 35 makes it less transparant compared to 15
    circle(x, y, StarDiameter * 1.2);            // makes it so radius is 1.2x larger than original
    popStyle();                                // Restores any previous settings
  }

  // This method renders the Star.
  void display() {
    noStroke();               // Removes any outlines
    glow();                   // Calls on the glow method
    fill(col);                // It makes the Star the colour using col from if loop
    circle(x, y, StarDiameter); // This renders the image for The star
  }
}
