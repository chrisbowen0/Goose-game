class Goose {
  
color bodyColor;
color beakColor;
color legColor;
float initialY;
float initialX;
float x, y, w, h;
float vx, vy;
float maxSpeed, accel;
boolean MOVELEFT, MOVEUP, MOVERIGHT, MOVEDOWN;

 //Goose constructor setting colour of shapes, start location and adding the move booleans for movement
 Goose(float x, float y) {
   this.x = 50;
   this.y = 50;
   this.initialY = y;
   this.initialX = x;
   this.bodyColor = color(255, 255, 255);
   this.beakColor = color(255, 165, 0);
   this.legColor = color(255, 165, 0);
   this.w = 50;
   this.h = 50;
   this.vx = 0;
   this.vy = 0;
   maxSpeed = 1;
   accel = 0.3;
   MOVELEFT = false;
   MOVEUP = false;
   MOVERIGHT = false;
   MOVEDOWN = false;
 }  
  
  //update method to check location of goose and player and tell the Goose to move and follow player
 void update() {
   
   //this vairable calculates the distance between center of the goose and the player objects
   float distApart = dist(x+w/2, y+h/2, p.x+p.w/2, p.y+p.h/2);
   
    /*if statement to allow goose to follow player, checking how far the Goose is away from the player and if it's within the range follows using the distApart variable which calculates the 
    distance between the player and the Goose objects */
    
     if (distApart < 860) {
       if (x < p.x) {  //this tells the Goose if it should move left or right based on the location of the player object
         MOVERIGHT = true;
         MOVELEFT = false;
       }
       if (x > p.x) {
         MOVERIGHT = false;
         MOVELEFT = true;
       }
       if (y < p.y) {   //this tells the Goose if it should move up or down based on the location of the player object
         MOVEUP = false;
         MOVEDOWN = true;
       }
       if (y > p.y) {
         MOVEUP = true;
         MOVEDOWN = false;
       } 
       } else {  //this stops the Goose from moving when it is outside of the distApart distance (when the above if statements don't trigger)
         MOVELEFT = false;
         MOVEUP = false;
         MOVERIGHT = false;
         MOVEDOWN = false;
         vx = 0;
         vy = 0;
       }
     
     //if statement that checks the direction booleans and based on the boolean that is true adjusts movement direction eg MOVERIGHT = true - the Goose moves right
     if (MOVELEFT) {
       vx = -maxSpeed;
     }
     if (MOVERIGHT) {
       vx = maxSpeed;
     } //end of horizontal check
     if (MOVEUP) {
       vy = -maxSpeed;
     }
     if (MOVEDOWN) {
       vy = maxSpeed;
     }
     x += vx;
     y += vy;
 }//end update
 
 //increaseSpeed method - this is used in the main class when a player has collected enough eggs the maxSpeed of the Goose is increased (see Draw method)
 void increaseSpeed() {
   maxSpeed += 0.3;
 }//end increaseSpeed
    
 //Display method to create the Goose object  
 void display() {
   //draw the body
   stroke(0); //set line colour
   strokeWeight(1); //set thickness of line
   fill(bodyColor); //set body colour based on variable bodyColor
   ellipse(x, y, 80, 40); //create ellipse shape with x & y the center of the shape and 80 = width whilst 40 = height of the shape
    
   //draw the head
   ellipse(x + 25, y - 15, 30, 30); //shame as the ellipse above howver by adding 25 or subtracting 15 I can adjust the location of the ellipse to make a Goose head
   
   //draw the beak
   fill(beakColor);
   triangle(x + 38, y - 15, x + 48, y - 10, x + 48, y - 20);
    
   //draw the legs
   stroke(legColor);
   strokeWeight(6); //set thickness of lines
   line(x - 10, y + 15, x - 10, y + 35); //left leg
   line(x + 10, y + 15, x + 10, y + 35); //right leg
    
   PVector playerVector = new PVector(p.x, p.y); //creates a vector that represents the player position on the screen
    
   PVector eye = new PVector(x + 30, y - 20); //creates a vector for an eye object we created below with x & y setting the location the object will be fixed to
   
   PVector pupil = eye.copy().add(playerVector.copy().sub(eye).setMag(3)); /* calculates the position within the eye the pupil is centered around and
                                                                             which direction it should point in this case towards the player vector I created above */
   
   //Create eye shape, color, line thickness/colour etc
   fill(255);
   stroke(0);
   strokeWeight(1);
   ellipse(eye.x, eye.y, 10, 10);
   
   //Create pupil shape, color, line thickness/colour etc
   fill(0);
   stroke(0);
   strokeWeight(1);
   ellipse(pupil.x, pupil.y, 4, 4);   
    
 }//End display
   
}//End Goose class
