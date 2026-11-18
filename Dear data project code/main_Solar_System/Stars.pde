class Stars{
  float decimal;       // This is used to store the deimal calculation from main
  float diameter=1000; // This sets the max diameter for all stars
  float x, y;          // This is x and y coordinates for the satr
  color col;           // This is so a colour can be created and then stored
  float StarRadius;    // This si where the actual radius of each star will be stored  

  Stars(float decimal, float x, float y) {
    // 'this.' makes it so it refers to the current object instance.
    this.decimal=decimal;
    this.x=x;
    this.y=y;

    // this will dictate colour of sun based on its size
    StarRadius = (decimal * diameter)/3;

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
}
