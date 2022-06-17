// Curtiss Williams
// Insertion sort visualization that sorts rectangles based on hue
int cols, rows, a, b, size, spacing;
float temp;
float[] grid;
void setup() {
  size(512, 512);
  colorMode(HSB, 360, 100, 100);
  a = 1;
  b = 0;
  spacing = 8;
  cols = width/spacing;
  rows = height/spacing;
  size = rows * cols;
  grid = new float[size];
  // give every spot on the grid a random spot
  // dont go all the way to 360, makes end look like the beginning
  for(int i = 0; i < size; i++) grid[i] = random(0,340);
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
  if (a == size) {
    println("all done");
    noLoop();
  } else {
    temp = grid[a];
    b = a - 1;
    while (b >= 0 && temp <= grid[b]) {
      grid[b+1] = grid[b];
      b--;
    }
    grid[b+1] = temp;
    a++;
  }
}

void swap(int i, int j) {
  float temp = grid[i];
  grid[i] = grid[j];
  grid[j] = temp;
}
