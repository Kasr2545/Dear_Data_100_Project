//This is where the values in table is stored
Table table;

// creates variables for white stars in the back ground
int farStarCount=1000;
float[] farStarX = new float[farStarCount]; // store random numbers to be used as x-axis Values.
float[] farStarY = new float[farStarCount]; // store random numbers to be used as y-axis Values.

// these are all count variables for the different stars
String FriCount;
String LecCount;
String TutCount;
String MeCount;
String FamCount;
String CWCount;
String DICount;
String LSCount;

void setup()
{
  // this is the data being loaded into a varibale called table
  table = loadTable("Dear Data Project.csv", "header");
  if (table != null) {
    println("CSV loaded successfully!");
    println("Number of rows: " + table.getRowCount());
    println("Number of columns: " + table.getColumnCount());
  } else {
    println("Failed to load CSV!");
  }


  size(1820, 800); // sets screen size
  noStroke(); // removes all outlines
  background(0); //makes background black for 'SPACE'

  for (int i =0; i< farStarCount; i++) // goes from 0-999
  {
    farStarX[i]=random(width); //generates random Y position for farStarX[i]
    farStarY[i]=random(height); //generates random Y position for farStarY[i]
  }
}

void draw()
{
  for (int i=0; i<farStarCount; i++) //goes through every farStarCount value
  {
    fill(255); //makes star white
    ellipse(farStarX[i], farStarY[i], 0.1, 0.1); // creates the star using the random x and y values, with a size of 0.1 hight and width
  }
}
