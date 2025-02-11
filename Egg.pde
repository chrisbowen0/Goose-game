class Egg {
  
ArrayList<Egg> eggs;
float eggX, eggY;
float x, y;
   
 //egg constructor  
 public Egg() {
    
   this.x = random(25, 800); //this sets the x location of the egg to a random location between 0 and 900 along the x axis
   this.y = random(25, 600); //this sets the y location of the egg to a random location between 0 and 700 along the y axis
   this.eggX = x;
   this.eggY = y;
   eggs = new ArrayList<Egg>();
 } 
 
 //add egg method which adds an egg to the ArrayList Eggs  
 public void addEgg(Egg egg) {
   eggs.add(egg);
 } //end add egg method
  
 //create egg method that creates a number of eggs related to the parameter input (4) 
 public void createEggs(int eggClutch) {
   for (int i = 0; i < eggClutch; i++) {
     Egg newEgg = new Egg();
     addEgg(newEgg);
   }
   for (Egg egg : eggs) {
     egg.display();
   }
 }   
   
   //create egg shape and colour
 void display() {
   fill(255, 192, 203);
   ellipse(x, y, 25, 32);
 }
  
  
  
} // End of class
