Die[] dice = new Die[9];
int total = 0;

void setup() {
  noLoop();
  size(400, 400);
  int cols = 3; // Number of columns of dice
  int rows = 3; // Number of rows of dice
  float spacingX = width / (cols + 1);
  float spacingY = height / (rows + 1);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int index = i * cols + j;
      float x = (i + 1) * spacingX;
      float y = (j + 1) * spacingY;
      dice[index] = new Die(x, y);
    }
  }
}

void draw() {
  background((int) (Math.random() * 256),(int) (Math.random() * 256),(int) (Math.random() * 256));
  total = 0;
  for (Die die : dice) {
    die.roll();
    die.show();
    total += die.value;
  }
  displayTotal();
}

void displayTotal() {
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Total: " + total, width / 2, height - 20);
}

void mousePressed() {
  redraw();
}

class Die {
  int x, y;
  int value;

  Die(float x, float y) {
    this.x = (int) x;
    this.y = (int) y;
    this.value = 1;
  }

  void roll() {
    value = (int) (Math.random() * 6) + 1;
  }

  void show() {
    rectMode(CENTER);
    stroke(0);
    fill((int) (Math.random() * 256),(int) (Math.random() * 256),(int) (Math.random() * 256));
    rect(x, y, 50, 50, 10);
    fill(0); 
    float dotOffset = 10;
    float dotSize = 5;

    // Display dots based on the value
    if (value == 1 || value == 3 || value == 5) {
      ellipse(x, y, dotSize, dotSize); // Center dot
    }
    if (value >= 2) {
      ellipse(x - dotOffset, y - dotOffset, dotSize, dotSize); // Top left dot
      ellipse(x + dotOffset, y + dotOffset, dotSize, dotSize); // Bottom right dot
    }
    if (value >= 4) {
      ellipse(x - dotOffset, y + dotOffset, dotSize, dotSize); // Bottom left dot
      ellipse(x + dotOffset, y - dotOffset, dotSize, dotSize); // Top right dot
    }
    if (value == 6) {
      ellipse(x - dotOffset, y, dotSize, dotSize); // Middle left dot
      ellipse(x + dotOffset, y, dotSize, dotSize); // Middle right dot
    }
  }
}
