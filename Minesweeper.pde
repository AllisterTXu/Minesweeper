import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public final static int NUM_COLS = 20;
public final static int NUM_ROWS = 20;
public final static int NUM_BOMBS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines; //ArrayList of just the minesweeper buttons that are mined
private ArrayList<MSButton> MSButtonList = new ArrayList<MSButton>();
private ArrayList<MSButton> bombs = new ArrayList<MSButton>();
private boolean gameOver = false;
private int unmarkedBombs = NUM_BOMBS;
private int unclickedTiles = (NUM_ROWS*NUM_COLS)-(NUM_BOMBS);

void setup()
{
  size(400, 400);
  textAlign(CENTER, CENTER);

  // make the manager
  Interactive.make(this);

  buttons = new MSButton[NUM_ROWS][NUM_COLS];
  for (int r = 0; r < NUM_ROWS; r++) {
    for (int c = 0; c < NUM_COLS; c++) {
      buttons[r][c] = new MSButton(r, c);
    }
  }
  for (int b = 0; b < NUM_BOMBS; b++) {
    setMines();
  }
}
public void setMines()
{
  int row = (int)(Math.random()*20);
  int col = (int)(Math.random()*20);
  if (!bombs.contains(buttons[row][col])) bombs.add(buttons[row][col]);
  //else setMines();
}

public void draw ()
{
  if (gameOver == false) {
    background(255);
  }
  background( 0 );
  if (isWon() == true)
    displayWinningMessage();
}
public boolean isWon()
{
  if (unclickedTiles == 0) return true;
  else if (unmarkedBombs != 0) return false;
  else if (unmarkedBombs == 0)
  {
    for (int i = 0; i < bombs.size(); i++)
      if (!bombs.get(i).isFlagged())
        return false;
  }
  return true;
}
public void displayLosingMessage()
{
  //your code here
}
public void displayWinningMessage()
{
  //your code here
}
public boolean isValid(int r, int c)
{
  if(r >= 0 && r < NUM_ROWS && c >= 0 && c < NUM_COLS) return true;
  return false;
}
public int countMines(int row, int col)
{
  int numMines = 0;
  //your code here
  return numMines;
}
public class MSButton
{
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean clicked, flagged;
  private String myLabel;

  public MSButton ( int row, int col )
  {
    width = 400/NUM_COLS;
    height = 400/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width;
    y = myRow*height;
    myLabel = "";
    flagged = clicked = false;
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () 
  {
    clicked = true;
    //your code here
  }
  public void draw () 
  {    
    if (flagged)
      fill(0);
    else if ( clicked && mines.contains(this) ) 
      fill(255, 0, 0);
    else if (clicked)
      fill( 200 );
    else 
    fill( 100 );

    rect(x, y, width, height);
    fill(0);
    textSize(12);
    text(myLabel, x+width/2, y+height/2);
  }
  public void setLabel(String newLabel)
  {
    myLabel = newLabel;
  }
  public void setLabel(int newLabel)
  {
    myLabel = ""+ newLabel;
  }
  public boolean isFlagged()
  {
    return flagged;
  }
  public boolean isClicked() {
    return clicked;
  }
}
