class Player {
  
float x, y, w, h;
float vx, vy;
float maxSpeed, accel;
float initialY;
float initialX;
ArrayList<Player> players;
  
  //Player constructor setting the location and speed of the player as well as creating a new ArrayList
  Player() {
    this.x = 750;
    this.y = 550;
    w = 50;
    h = 50;
    vx = 0;
    vy = 0;
    maxSpeed = 15;
    accel = 0.3;
    players = new ArrayList<Player>();
  }//End Constructor
  
  //addPlayer method to create a new player object
  public void addPlayer(Player player) {
    players.add(player);
  } //end add player method
  
  //createPlayer method - iterates through the addPlayer method a number of times realated to the parameter input in this case an integer and adds the object at the x and y returned by the constructor variables     
  public void createPlayer(int count) {
    for (int i = 0; i < count; i++) {
      Player newPlayer = new Player();
      addPlayer(newPlayer);
    }
    for (Player p : players) {
      p.display();
      x = p.x;
      y = p.y;
    }
  } //end createPlayer method
   
  //update method provides the ability for the player to move around the screen and when leaving the screen appearing on the opposite side so as to not disappear from view
  void update() {
    //increases and decreases the player speed based on the key input
      //horizontal check (left and right)
    if (LEFT) {
      //vx = -5;
      if (vx > -maxSpeed) {
        vx -= accel;
      }
    } else if (RIGHT) {
      //vx = 5;
      if (vx < maxSpeed) {
        vx += accel;
      }
    } else if (!LEFT && !RIGHT) {
     vx = 0;
    }//End horizontal key check
    
    //start vertical key check (up and down)
    if (UP) {
      //vy = -5;
      if (vy > -maxSpeed) {
        vy -= accel;
      }
    } else if (DOWN) {
      //vy = 5;
      if (vy < maxSpeed) {
        vy += accel;
      }
    } else if (!UP && !DOWN) {
     vy = 0;
    }//End vertical key check
    
    //Update position of player - increment the value of x & y by the values of vx & vy to allow movement of the player
    x += vx;
    y += vy;
    
    //check boundary to allow the player to leave the boundary edge and appear on the opposite boundary edge of the screen (similar to original Mario games)
    //Horizontal boundary wrap
    if (x < -w) {
      x = width;
    } else if (x > width) {
      x = -w;
    }
    //Vertical boundary wrap
    if (y < -h) {
      y = height;
    } else if (y > height) {
      y = -h;
    }  
  } // End update
  
  //create the player object and display fill colour
  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
    
  } //End display
  
  
} //End class
