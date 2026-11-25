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

// these are variables for the different planets
int UCount;
int HCount;
int SCount;
int ICount;
int WCount;
int Planets_Total_Count;

//this is where the percentage value is stored
float UPct;
float HPct;
float SPct;
float IPct;
float WPct;

// This arrya stores objects called Planets in an array called planetList
ArrayList <Planets> planetList = new ArrayList<Planets>();



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


  size(1500, 800); // sets screen size
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



//These variables are used to switch between screens
boolean screenView=false;// this variable holds the value of which screen i am on, false= StarPage, true=planet detail
Stars hoveredStar=null; //the star the mouse is hovering on
Stars selectedStar=null; //stores the star that was clicked on

void draw()
{
  background(0); //Sets background to black
  for (int i=0; i<farStarCount; i++) //goes through every farStarCount value
  {
    fill(255); //makes star white
    ellipse(farStarX[i], farStarY[i], 1.5, 1.5); // creates the star using the random x and y values, with a size of 0.1 hight and width
  }

  hoveredStar=null; // this resets the hoveredStar to null so it can be updated each frame
  if (screenView)
  {
   drawPlanetPage(); 
  }
  else
  {
    displayHoverStar();
  }
}



//This method is call methods for displating star on screen and check if the star is hoverd on
void displayHoverStar()
{
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
  
   // Checks whether the mouse is hovering over each Star object
  // Passes the Star object, its name and its percentage value
  // into the checkHoverOnStar() method.
  checkHoverOnStar(FriStar, "Friends", FriPct);
  checkHoverOnStar(LecStar, "Lecturers", LecPct);
  checkHoverOnStar(TutStar, "Tutorials", TutPct);
  checkHoverOnStar(MeStar, "Me", MePct);
  checkHoverOnStar(FamStar, "Family", FamPct);
  checkHoverOnStar(CWStar, "Co-workers", CWPct);
  checkHoverOnStar(LSStar, "Lunch Staff", LSPct);
}




// this is a new object for stars which will be printed on the drawPlanet Page
Stars newPageStar=null; 
// This is a new object for planets which will be printed on the drawPlanet page
Planets newPagePlanet=null;

//Back button from drawPlanetPage to displayHoverStar
float buttonXPos=10, buttonYPos=10;//the position of the buttons
float Xwidth=135, Yheight=50;// stores the size of the button
String selectedStarName="";//thsi will store the name of star to be used on newPlanet Page

void drawPlanetPage()
{
  newPageStar.display();//so the star can be displayed on the new page
  newPagePlanet.update(); // this will updates the planets position
  newPagePlanet.display(newPageStar.x,newPageStar.y);
  pushStyle();//Thsi allows us to create new style that effects everythign withing push and pop style
  
    pushStyle();
  // Box
  noFill();
  stroke(255);
  strokeWeight(4);
  rect(650,15,200,60);
  
  // star name
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text(selectedStarName, width/2, 60);
  
  popStyle();

  //this makes the box
  noFill();
  stroke(0,255,0);
  strokeWeight(2);
  rect(buttonXPos, buttonYPos, Xwidth, Yheight);
  
  //thsi out puts text
  fill(0, 255, 0);            // MUST call fill() because noFill() turns text invisible!
  textSize(50);               // Sets text size
  textAlign(LEFT);  // Anchor text from left side
  text("BACK",20,50); // Centres from x=20 and y=50
  popStyle();
}


// this method will chekc to see if the star has been clicked on
void mousePressed()
{
  if(mouseButton==LEFT && screenView==false && hoveredStar!=null)
  {
    selectedStar=hoveredStar; // This makes it so the stored star s, is the selected Star
    selectedStarName=StarName;// sotres star name
    screenView=true; // Makes screenView true so the drawPlaentPage can be called if if staement
    newPageStar= new Stars(selectedStar.decimal, width/2, height/2); // using the constructor method We can create the star for the new page
    newPagePlanet= new Planets(newPageStar.StarDiameter+60, 20, 0, 0.02, (255)); // using the constructor method for planets to create planets on new star page
  }
  else if(mouseButton==LEFT && screenView==true && mouseX>=buttonXPos && mouseX<=buttonXPos+Xwidth && mouseY>=buttonYPos && mouseY<=buttonYPos+Yheight)//Checks to see if mouse x is within the back button
  {
    screenView=false; // this makes it so it switches back to displayHoverStar
    selectedStar= null; // sets it to nothign
    newPageStar = null; // sets it to nothing
    selectedStarName="";// sets it to nothing
  }
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
    //println("Star Name: "+name); // Checks to see if the corect star name is being printed
    //println(StarPct*100+"%"); // Checks to see if the corect star percentage is being printed
    StarInfoBlock(s,StarName, StarPct);// Calling the Star infro block, so it shwos the correct info for each star when hovered on
    hoveredStar=s;// this makes it so s is stored in a global variable so it can be use dby othe rmehtods

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
  rect(1130,20,350,150); // Makes the rectangle
 
  
  // 2. Draw centered text inside it
  fill(0, 255, 0);            // MUST call fill() because noFill() turns text invisible!
  textSize(24);               // Sets text 
  textAlign(LEFT);  // Anchor text from its center
  text("Star Name: " + StarName, 1140, 50); // Center of the rect: (200, 200)
  text("Percentage: " + nf(StarPct*100,0,2) +"%", 1140, 80); // 
  text("Coordiantes: " + "("+x+","+y+")",1140, 110);
  
  popStyle();//this restores the previous settings so the white stars in background do not have green onlines only the box
}