//This is where the values in table is stored
Table table;

// creates variables for white stars in the back ground
int farStarCount=1000;
float[] farStarX = new float[farStarCount]; // store random numbers to be used as x-axis Values.
float[] farStarY = new float[farStarCount]; // store random numbers to be used as y-axis Values.

// these are all count variables for the different stars
int FriCount;
int LecCount;
int TutCount;
int MeCount;
int FamCount;
int CWCount;
int LSCount;
int Total_Count;

//this is where the percentage value is stored
float FriPct;
float LecPct;
float TutPct;
float MePct;
float FamPct;
float CWPct;
float LSPct;

// This declares that thier is a object 'XXXStar', and it is an object instance of the class Star.
Stars FriStar;
Stars LecStar;
Stars TutStar;
Stars MeStar;
Stars FamStar;
Stars CWStar;
Stars LSStar;

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

  calculateStarPercentages(); //calls on the method to calculate the percentage values for each data point

  // This calls the constructor method for Star and stored it in a Star object.
  MeStar  = new Stars(MePct, 250, 400);
  FamStar = new Stars(FamPct, 650, 400);
  FriStar = new Stars(FriPct, 850, 400);
  LecStar = new Stars(LecPct, 1000, 400);
  TutStar = new Stars(TutPct, 1160, 400);
  CWStar  = new Stars(CWPct, 1300, 400);
  LSStar  = new Stars(LSPct, 1400, 400);
}

void draw()
{
  background(0); //Sets background to black
  for (int i=0; i<farStarCount; i++) //goes through every farStarCount value
  {
    fill(255); //makes star white
    ellipse(farStarX[i], farStarY[i], 0.1, 0.1); // creates the star using the random x and y values, with a size of 0.1 hight and width
  }

  // calls the display() method for each Star object
  // each object executes the same method using its own instance variables
  // such as its percentage and x/y coordinates.
  FriStar.display();
  LecStar.display();
  TutStar.display();
  MeStar.display();
  FamStar.display();
  CWStar.display();
  LSStar.display();
}

//calculates the percentage value for the number of times a data point appears in the initiator column
void calculateStarPercentages()
{
  //looks through each row
  for (int i = 1; i < table.getRowCount(); i++)
  {
    TableRow row = table.getRow(i); //this retrieves the data from the whole row
    //println(row.getString(0)) // this prints the data we want from that row
    
    String initiator = row.getString(0); //this will store the data from the column row into initator for each loop
    
    // this if loop, compares to see what data appears and adds it to its corresponding count value and adds to total 
    if (initiator.equals("Fri"))
    {
      FriCount++;
      Total_Count++;
    }
    else if (initiator.equals("Lec"))
    {
      LecCount++;
      Total_Count++;
    }
    else if (initiator.equals("Tut"))
    {
      TutCount++;
      Total_Count++;
    }
    else if (initiator.equals("Me"))
    {
      MeCount++;
      Total_Count++;
    }
    else if (initiator.equals("Fam"))
    {
      FamCount++;
      Total_Count++;
    }
    else if (initiator.equals("CW"))
    {
      CWCount++;
      Total_Count++;
    }
    else if (initiator.equals("LS"))
    {
      LSCount++;
      Total_Count++;
    }
  }
  
  // This prints the amount of each data point
    println("Friends: " + FriCount);
    println("Lecturers: " + LecCount);
    println("Tutorials: " + TutCount);
    println("Me: " + MeCount);
    println("Family: " + FamCount);
    println("Co-workers: " + CWCount);
    println("Lunch Staff: " + LSCount);
    println("Total Data Items: " + Total_Count);
    
  // Calculates the percentage value in decimal format between 0-1 
  FriPct = (float)FriCount / Total_Count;
  LecPct = (float)LecCount / Total_Count;
  TutPct = (float)TutCount / Total_Count;
  MePct = (float)MeCount / Total_Count;
  FamPct = (float)FamCount / Total_Count;
  CWPct = (float)CWCount / Total_Count;
  LSPct = (float)LSCount / Total_Count;
    
  // Prints the full percentage value
    println("Friends: " + FriPct*100 + "%");
    println("Lecturers: " + LecPct*100 + "%");
    println("Tutorials: " + TutPct*100 + "%");
    println("Me: " + MePct*100 + "%");
    println("Family: " + FamPct*100 + "%");
    println("Co-workers: " + CWPct*100 + "%");
    println("Lunch Staff: " + LSPct*100 + "%");
    
}

boolean hovering=false; //Will check ifmouse is hovering over star
String StarName; // Will store the name of the star the mouse is hovering on
float StarPct; // Will store the percentage value of the star

// method takes in three parameters, The star object which is passed into s
// StarName is passed into name
// StarPct is passed into pct
void checkHoverOnStar(Stars s, String name, float pct)
{
  float mx=mouseX; // Stores mouse x poistion
  float my=mouseY; // Stores mouse y position

  float x, y; // Stores the Star objects coordinates

  x= s.x; // Storing the x position of star s
  y= s.y; // Storing the y position of star s

  float d = dist(x, y, mx, my); // this calculates the distance between the Stars midpoint and mouse x,y

  float radius = max(s.StarDiameter/2,3); // stores the star's radius, also makes it so the the Hover radius is never smaller than 3px wide
  if (d<=radius)
  {
    StarName = name;
    StarPct= pct;
    hovering=true; // sets hovering to true if the mouse is within the radius of the star
    //println("Star Name: "+name); // Checks to see if the corect star name is being printed
    //println(StarPct*100+"%"); // Checks to see if the corect star percentage is being printed
  }
}

void StarInfoBlock(Stars s, String name, float pct)
{
  float x,y; // store stars s x and y pos
  x=s.x; //Stores suns x pos
  y=s.y; // stoes suns y pos
  StarName= name; // stores name of star
  StarPct = pct;
  
  pushStyle();// this doen so the white stars in background do not have gree onlines only the box
  
  // draws rectange with green outline
  noFill();//makes mbackground transparent
  stroke(0,255,0);//Makes outlien green 
  strokeWeight(4);// creates outlien thinkness
  rect(1170,20,350,150); // Makes the rectangle
 
  
  // 2. Draw centered text inside it
  fill(0, 255, 0);            // MUST call fill() because noFill() turns text invisible!
  textSize(24);               // Sets text 
  textAlign(LEFT);  // Anchor text from its center
  text("Star Name: " + StarName, 1180, 50); // Center of the rect: (200, 200)
  text("Percentage: " + nf(StarPct*100,0,2) +"%", 1180, 80); // 
  text("Coordiantes: " + "("+x+","+y+")",1180, 110);
  
  popStyle();//this restores the previous settings so the white stars in background do not have green onlines only the box
}