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
int s = 0;
int timerValue = 0; // Timer value in seconds
boolean isTimerRunning = false; // Flag to track whether the timer is running
boolean startTimer1 = false;
int startTime= 0;// Start time of the timer in milliseconds
float circleSize = 50; // Initial size of the circle
boolean isCircleVisible = false; // Flag to track whether the circle should be visible
int circleStartTime = 0; // Start time of the circle timer


void setup() {
  size(400, 700);
  appWidth = width;
  appHeight = height;
  
 frameRate(1);

  //
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

  int milliseconds = millis();
  s = milliseconds / 1000;
  
  // Draw rectangles
  drawNumbers();
  
  int h = hour();      // Get the current hour
  int m = minute();    // Get the current minute
  String ampm = "AM";  // Default to AM

  // Convert to 12-hour format and determine AM/PM
  if (h >= 12) {
    ampm = "PM";
    if (h > 12) {
      h -= 12;
    }
  }

  // Ensure 2-digit display for hours and minutes
  String hourString = nf(h, 2);
  String minuteString = nf(m, 2);
  fill(0);
  text(hourString + ":" + minuteString + " " + ampm, width / 2, y4 + heightSquare * 1.5);

  // Display the currentNumber with some spacing above the number pad
  textSize(26);
  fill(0);
  textAlign(CENTER, CENTER);

  if (isTimerRunning) {
    // Calculate the remaining time based on the total time and elapsed time
    int elapsedMillis = millis() - startTime;
    int remainingMillis = max(timerValue * 1000 - elapsedMillis, 0);

    int remainingSeconds = remainingMillis / 1000;
    currentNumber = str(remainingSeconds);

    // Calculate circle size based on remaining time
    float maxSize = widthSquare;
    circleSize = map(remainingMillis, 0, timerValue * 1000, 0, maxSize);
  }

  text(currentNumber, appWidth / 2, y4 = widthSquare / 2);

  // Update the timer
  startTimer();
  updateCircle();
}

void drawNumbers() {
  textSize(32);
  textAlign(CENTER, CENTER);

  // Draw buttons with labels
  drawButton(x0, y0, widthSquare, heightSquare, "1");
  drawButton(x1, y0, widthSquare, heightSquare, "2");
  drawButton(x2, y0, widthSquare, heightSquare, "3");
  drawButton(x0, y1, widthSquare, heightSquare, "4");
  drawButton(x1, y1, widthSquare, heightSquare, "5");
  drawButton(x2, y1, widthSquare, heightSquare, "6");
  drawButton(x0, y2, widthSquare, heightSquare, "7");
  drawButton(x1, y2, widthSquare, heightSquare, "8");
  drawButton(x2, y2, widthSquare, heightSquare, "9");
  drawButton(x1, y3, widthSquare, heightSquare, "0");

  // Draw Clear and Done buttons
  drawButton(x0, y3, widthSquare, heightSquare, "Clear");
  drawButton(x2, y3, widthSquare, heightSquare, "Done");
}

void drawButton(float posX, float posY, float buttonWidth, float buttonHeight, String label) {
  fill(255);
  rect(posX, posY, buttonWidth, buttonHeight);
  fill(0);
  text(label, posX + buttonWidth / 2, posY + buttonHeight / 2);
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
     
      startTimer1 = true;
    } else if ( mouseX>x2 && mouseX<x2+widthSquare && mouseY>y3 && mouseY<y3+widthSquare ) {
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
  // Check if a key was pressed
  if (key >= '0' && key <= '9') {
    currentNumber += key;
  } else if (key == BACKSPACE) {
    if (currentNumber.length() > 0) {
      currentNumber = currentNumber.substring(0, currentNumber.length() - 1); // Delete the last character
    }
  } else if (key == ' ') {
    currentNumber = " "; // Clear all
  }
}
void startTimer() {
  if (startTimer1) {
    String[] numbers = splitTokens(currentNumber, " "); // Split the string by spaces
    int totalTimerValue = 0;

    for (String num : numbers) {
      try {
        int value = Integer.parseInt(num);
        totalTimerValue += value;
      } catch (NumberFormatException e) {
        println("Invalid number: " + num);
      }
    }

    println("Timer started with total time: " + totalTimerValue + " seconds");
    isTimerRunning = true;
    timerValue = totalTimerValue;
    startTime = millis(); // Store the start time
    isCircleVisible = true; // Show the circle
    circleSize = 50; // Initial circle size
    circleStartTime = millis(); // Start time of the circle timer
  }

  if (isTimerRunning) {
    // Calculate the remaining time based on the total time and elapsed time
    int elapsedMillis = millis() - startTime;
    int remainingMillis = max(timerValue * 1000 - elapsedMillis, 0);

    if (remainingMillis == 0) {
      println("Timer done");
      isTimerRunning = false;
      currentNumber = "";
      isCircleVisible = false; // Hide the circle when the timer is done
    }
  }
}


void updateCircle() {
  if (isCircleVisible) {
    float elapsedTime = millis() - circleStartTime;
    float remainingTime = (timerValue * 1000) - elapsedTime;
    float maxSize = widthSquare;

    // Calculate the circle size based on the remaining time and elapsed time
    circleSize = map(remainingTime, 0, timerValue * 1000, 0, maxSize);

    fill(0, 0, 255); // Blue color
    noStroke();
    ellipse(width / 2, height / 5, circleSize, circleSize);
  }
}
