import processing.opengl.*;

HeadTracker tracker;

void setup() 
{
  size(1024, 768, OPENGL);
  noStroke();
  hint(ENABLE_OPENGL_4X_SMOOTH);
  tracker = new HeadTracker();
}

void draw() 
{
  lights();
  background(0);
  tracker.run();
  if (tracker.headFound)
    render();
}

void render()
{
  fill(255, 12, 0);
  translate(tracker.x, (height / 2), tracker.z);
  //translate(tracker.x, tracker.y, tracker.z);
  rotateX(-(PI / 6));
  box(45);
  translate(-90, 0, -50);
  box(55);
  translate(170, 0, 90);
  box(55);
}