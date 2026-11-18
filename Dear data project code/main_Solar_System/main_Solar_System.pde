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
}

void draw()
{
  for (int i=0; i<farStarCount; i++) //goes through every farStarCount value
  {
    fill(255); //makes star white
    ellipse(farStarX[i], farStarY[i], 0.1, 0.1); // creates the star using the random x and y values, with a size of 0.1 hight and width
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
    float FriPct = (float) FriCount / Total_Count;
    float LecPct = (float) LecCount / Total_Count;
    float TutPct = (float) TutCount / Total_Count;
    float MePct = (float) MeCount/ Total_Count;
    float FamPct = (float) FamCount / Total_Count;
    float CWPct = (float) CWCount / Total_Count;
    float LSPct = (float) LSCount / Total_Count;
    
  // Prints the full percentage value
    println("Friends: " + FriPct*100 + "%");
    println("Lecturers: " + LecPct*100 + "%");
    println("Tutorials: " + TutPct*100 + "%");
    println("Me: " + MePct*100 + "%");
    println("Family: " + FamPct*100 + "%");
    println("Co-workers: " + CWPct*100 + "%");
    println("Lunch Staff: " + LSPct*100 + "%");
}