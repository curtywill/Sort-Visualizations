// Curtiss Williams
// Bubble sort visualization that sorts rectangles based on hue
int cols, rows, a, b, size;
int spacing;
float[] grid;
void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100);
  a = b = 0;
  spacing = 8;
  cols = width/spacing;
  rows = height/spacing;
  size = rows * cols;
  grid = new float[size];
  // give every spot on the grid a random spot
  // dont go all the way to 360, makes end look like the beginning
  for (int i = 0; i < size; i++) grid[i] = random(0, 340);
  noLoop();
}

void mousePressed(){
  loop(); 
}

void draw() {
  background(0);
  noStroke();
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      int index = i+j*rows;
      fill(grid[index], 100, 100);
      square(i*spacing, j*spacing, spacing);
    }
  }
  if (a == size-1) {
    println("all done");
    noLoop();
  } else {
    for (b = 0; b < size-a-1; b++) {
      if (grid[b] > grid[b+1]) swap(b, b+1);
    }
    a++;
  }
}

void swap(int i, int j) {
  float temp = grid[i];
  grid[i] = grid[j];
  grid[j] = temp;
}
