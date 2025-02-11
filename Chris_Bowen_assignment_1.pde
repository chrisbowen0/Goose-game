class Gaggle {

ArrayList<Goose> geese;
  
  Gaggle() { //Gaggle constructor to create a new ArrayList
    geese = new ArrayList<Goose>();
    
  } //end Gaggle constructor
  
  void addGoose(Goose goose) { // addGoose method adds a new Goose to the Geese ArrayList
    geese.add(goose);
  } //end addGoose method
  
  void displayAll() { //method to iterate over the geese ArrayList and call the display method for each Goose in the Arraylist
    for (Goose goose : geese) {
      goose.display();
    }
  }//End displayAll method
  
  void updateAll() { //method to iterate over the geese ArrayList and call the update method for each Goose in the ArrayList
    for (Goose goose : geese) {
      goose.update();
    }
  } // End update all method

}//End class
