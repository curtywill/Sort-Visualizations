// Curtiss Williams
// Bottom-up mergesort visualization that sorts rectangles based on hue
// iterative mergesort algorithm from
// http://www.mathcs.emory.edu/~cheung/Courses/171/Syllabus/7-Sort/merge-sort5.html
int cols, rows, size, spacing, w, a;
float[] grid;
float[] temp;
void setup() {
  size(512, 512); // best if window size is a power of 2 because of the way algo works
  colorMode(HSB, 360, 100, 100);
  w = 1;
  a = 0;
  spacing = 8; // spacing should also be a power of 2
  cols = width/spacing;
  rows = height/spacing;
  size = rows * cols;
  grid = new float[size];
  temp = new float[size];
  // give every spot on the grid a random spot
  // dont go all the way to 360, makes end look like the beginning
  for (int i = 0; i < size; i++) grid[i] = random(0, 340);
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
  if (w == size) {
    println("all done");
    noLoop();
  } else {
    int left = a;
    int mid = a + w;
    int right = a + 2*w;
    Merge(left, mid, right);
    a += 2*w;
    if (a == size) {
      a = 0;
      w *= 2;
    }
  }
}

void Merge(int left, int mid, int right) {
  int i = left;
  int j = mid;
  int k = left;
  while ( i < mid || j < right ) {
    if (i < mid && j < right) {
      if (grid[i] < grid[j]) temp[k++] = grid[i++];
      else temp[k++] = grid[j++];
    } else if (i == mid) {
      temp[k++] = grid[j++];
    } else if (j == right) {
      temp[k++] = grid[i++];
    }
  }
  for (i = left; i < right; i++) grid[i] = temp[i];
}
