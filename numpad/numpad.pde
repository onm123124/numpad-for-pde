/* Program Notes: Geometry is portrait (smaller width)
 Demonstrates num pad as Nested FOR Loops
 Start with width, then error-check height
 */

// Global Variables
int appWidth, appHeight; // CAUTION: decimals are truncated in ints, not floats or doubles
float widthSquare, heightSquare;
float x0, x1, x2;
float y0, y1, y2, y3, y4;
String currentNumber = " ";
boolean isMousePressed = false; // Flag to track mouse button state

void setup() {
  size(400, 700);
  appWidth = width;
  appHeight = height;

  // Population of rect() variables
  widthSquare = appWidth * 1/4;
  heightSquare = widthSquare;
  x0 = widthSquare * 1/2;
  x1 = widthSquare * 3/2;
  x2 = widthSquare * 5/2;
  y0 = widthSquare * 5/2;
  y1 = widthSquare * 7/2;
  y2 = widthSquare * 9/2;
  y3 = widthSquare * 11/2;
  y4 = widthSquare * 14/2;
}

void draw() {
  background(255); // Clear the background

  // Draw rectangles
  drawNumbers();

  // Display the currentNumber with some spacing above the number pad
  textSize(26);
  fill(0);
  textAlign(CENTER, CENTER);
  text(currentNumber, appWidth / 2, y0 - widthSquare / 2);
}

void drawNumbers() {
  fill(255);
  rect(x0, y0, widthSquare, heightSquare);
  rect(x0, y1, widthSquare, heightSquare);
  rect(x0, y2, widthSquare, heightSquare);
  rect(x0, y3, widthSquare, heightSquare);
  rect(x1, y0, widthSquare, heightSquare);
  rect(x1, y1, widthSquare, heightSquare);
  rect(x1, y2, widthSquare, heightSquare);
  rect(x1, y3, widthSquare, heightSquare);
  rect(x2, y0, widthSquare, heightSquare);
  rect(x2, y1, widthSquare, heightSquare);
  rect(x2, y2, widthSquare, heightSquare);
  rect(x2, y3, widthSquare, heightSquare);
  
}

void mousePressed() {
  // Check if the mouse button was just pressed
  if (!isMousePressed) {
    isMousePressed = true;
    
    if ( mouseX>x0 && mouseX<x0+widthSquare && mouseY>y0 && mouseY<y0+widthSquare ) {
      currentNumber += "1 ";
    } else if ( mouseX>x1 && mouseX<x1+widthSquare && mouseY>y0 && mouseY<y0+widthSquare ) {
      currentNumber += "2 ";
    } else if ( mouseX>x2 && mouseX<x2+widthSquare && mouseY>y0 && mouseY<y0+widthSquare ) {
      currentNumber += "3 ";
    } else if ( mouseX>x0 && mouseX<x0+widthSquare && mouseY>y1 && mouseY<y1+widthSquare ) {
      currentNumber += "4 ";
    } else if ( mouseX>x1 && mouseX<x1+widthSquare && mouseY>y1 && mouseY<y1+widthSquare ) {
      currentNumber += "5 ";
    } else if ( mouseX>x2 && mouseX<x2+widthSquare && mouseY>y1 && mouseY<y1+widthSquare ) {
      currentNumber += "6 ";
    } else if ( mouseX>x0 && mouseX<x0+widthSquare && mouseY>y2 && mouseY<y2+widthSquare ) {
      currentNumber += "7 ";
    } else if ( mouseX>x1 && mouseX<x1+widthSquare && mouseY>y2 && mouseY<y2+widthSquare ) {
      currentNumber += "8 ";
    } else if ( mouseX>x2 && mouseX<x2+widthSquare && mouseY>y2 && mouseY<y2+widthSquare ) {
      currentNumber += "9 ";
    } else if ( mouseX>x1 && mouseX<x1+widthSquare && mouseY>y3 && mouseY<y3+widthSquare ) {
      currentNumber += "0 ";
    } else if ( mouseX>x0 && mouseX<x0+widthSquare && mouseY>y3 && mouseY<y3+widthSquare ) {
      currentNumber = " "; // Clear all
    } else if ( mouseX>x2 && mouseX<x2+widthSquare && mouseY>y3 && mouseY<y3+widthSquare ) {
      currentNumber = " "; // Delete
    }  else if ( mouseX>x2 && mouseX<x2+widthSquare && mouseY>y3 && mouseY<y3+widthSquare ) {
      if (currentNumber.length() > 1) {
        currentNumber = currentNumber.substring(0, currentNumber.length() - 1) + " " + currentNumber.charAt(currentNumber.length() - 1); // Delete
      }
    }
  }
}

void mouseReleased() {
  // Reset the flag when the mouse button is released
  isMousePressed = false;
}

void keyPressed() {
  // Handle key presses to update currentNumber (if needed)
  // ...
}
