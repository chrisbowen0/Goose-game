Gaggle gaggle;
Player p;
Egg e;

PVector eye;
boolean LEFT, RIGHT, UP, DOWN;
boolean gameOver = false;
ArrayList<Egg> eggs;
ArrayList<Player> players;

void setup() { //method to setup the initial start state of the program
  size(850, 650); //size of the playable area/window size
  gaggle = new Gaggle();
  p = new Player();
  e = new Egg();
  gaggle.addGoose(new Goose(width/2, height/2));
  e.createEggs(4); //iterate through create eggs method (4 times) to create 4 eggs
  p.createPlayer(1); //iterate through createPlayer method (1 time) to create 1 player
  LEFT = false;
  RIGHT = false;
  UP = false;
  DOWN = false;
}//end setup

//method to update the display of the program
void draw() {
  background(50, 150, 200);
  
  if (gameOver) {
    displayGameOver();
    return; //stop executing game (rest of draw)
  }
  
  //for loop that iterates through players ArrayList and returns a player
  for (int i = p.players.size() - 1; i >= 0; i--) {
       p.players.get(i);
       p.display(); //displays player
       p.update();  //gives movement controls to player and checks boundary for player
     }
     
  //for loop that iterates through Geese ArrayList and returns an Goose. It also changes the gameOver variable to true if the player and Goose collide
  for (int i = gaggle.geese.size() - 1; i >= 0; i--) {
    Goose goose = gaggle.geese.get(i);
    gaggle.displayAll();
    gaggle.updateAll();
      if (isColliding(p, goose)) { //checks if the player and Goose collide together to trigger gameOver
        gameOver = true;
      }
  } 
  
  //iterate through eggs arraylist to create eggs
     for (int i = e.eggs.size() - 1; i >= 0; i--) { // Iterate backwards through eggs arraylist
       Egg egg = e.eggs.get(i);
       egg.display(); // Display each egg
     // Check for collision with the player
  if (isColliding(p, egg)) {
    e.eggs.remove(i); // Remove the egg if collected
   }
 }
     
    //iterate through eggs ArrayList and create more eggs when all eggs have been collected and increase the speed of the goose by calling the increaseSpeed method
    if (e.eggs.isEmpty()) {
       e.createEggs(4);
      for (Goose gaggle : gaggle.geese) {
         gaggle.increaseSpeed();         
      }
    }
    
}//end of draw

//Display Game Over and restart message
  void displayGameOver() {
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(30);
    text("Press R to Restart", width/2, height/2 + 50);
  }

 // Collision detection function for eggs and player allowing the eggs to be collected by the player
  boolean isColliding(Player p, Egg e) {
   // Get the player's rectangle
   float playerLeft = p.x;
   float playerRight = p.x + p.w;
   float playerTop = p.y;
   float playerBottom = p.y + p.h;
  
   // Get the egg's position and dimensions based on the current egg dimensions set within the egg class
   float eggLeft = e.x - 12.5; 
   float eggRight = e.x + 12.5; 
   float eggTop = e.y - 16; 
   float eggBottom = e.y + 16; 

   // Check for overlap of egg and player
   return (playerLeft < eggRight && playerRight > eggLeft && playerTop < eggBottom && playerBottom > eggTop);
  }
  
  
   boolean isColliding(Player p, Goose gaggle) {
     //Get Player position
     float playerLeft = p.x;
     float playerRight = p.x + p.w;
     float playerTop = p.y;
     float playerBottom = p.y + p.h;
   
   //Get Goose position
     float enemyLeft = gaggle.x;
     float enemyRight = gaggle.x + gaggle.w;
     float enemyTop = gaggle.y;
     float enemyBottom = gaggle.y + gaggle.h;
     
     //Check for overlap of Goose and player
     return (playerLeft < enemyRight && playerRight > enemyLeft && playerTop < enemyBottom && playerBottom > enemyTop);  
   }

//Check for keyboard input and change booleans for movement to true based on the input, also check if gameOver state is true and if r has been pressed to trigger resetGame method
void keyPressed() {
  
  if (keyCode == 37) { //Left key on keyboard
    LEFT = true;
  }
  if (keyCode == 38) { //Up key on keyboard
    UP = true;
  }
  if (keyCode == 39) { //Right key on keyboard
    RIGHT = true;
  }
  if (keyCode == 40) { //Down key on keyboard
    DOWN = true;
  }
  if (gameOver && keyCode == 82) { //Checks if gameOver = true and if 'R' key on keyboard has been pressed
    resetGame();
  }
} //end of keyPressed method

//Checks for key release and updates direction booleans
void keyReleased() {
  if (keyCode == 37) { //Left key on keyboard
    LEFT = false;
}
  if (keyCode == 38) { //Up key on keyboard
    UP = false;
}
  if (keyCode == 39) { //Right key on keyboard
    RIGHT = false;
}
if (keyCode == 40) { //Down key on keyboard
  DOWN = false;
}
}

//reset game state and restart from beginning
void resetGame() {
      gaggle.geese.clear();
      gaggle.addGoose(new Goose(width/2, height/2));
      p.players.clear();
      p.createPlayer(1);
      if (e.eggs == null) {
        e.createEggs(4);
      } else {
        e.eggs.clear();
        e.createEggs(4);
      }
      gameOver = false;
} //end resetGame method
