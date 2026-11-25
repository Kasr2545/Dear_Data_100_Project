class Planets{
    float orbital_distance; // gap between planets centre and stars centre
    float angle; //where the planet is on its orbital circle
    float speed; // how much the angle grows each frame to mak eplanet move
    float diameter; // the width of the planet
    color col; // the planets colour

    //this is the constructor method for Planets
    //takes in 5 parameters
    Planets(float orbital_distance, float diameter,float angle, float speed, color col)
    {
        // 'this.' makes it so all the varibles below refers to the current Planets instance
        this.orbital_distance=orbital_distance;
        this.diameter=diameter;
        this.angle=angle;
        this.speed=speed;
        this.col=col;
    }

    // this updtaes the angle for the planet using its speed so planet can move
    void update()
    {
        angle=angle+speed; 
    }

    // it will take in parameters of the suns x and y pos to determine the planets position from sun
    void display(float centreX, float centreY)
    {
    float planetX=centreX+orbital_distance*cos(angle);// planetX changes as angle updates changing overval of cos(angle)
    float planetY=centreY+orbital_distance*sin(angle);// planetY changes as angle updates changing overval of sin(angle)
    noStroke();//removes any outline
    fill(col);//sets the planet base colour
    circle(planetX, planetY, diameter);// planet is renderd
    }

}
