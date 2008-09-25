import FaceDetect.*;

class HeadTracker 
{
  float x, y, z;
  boolean headFound;
  FaceDetect fd;
  int[][] faces;

  HeadTracker() 
  {
    x = 0.0;
    y = 0.0;
    z = 0.0;
    headFound = false;
    init();
  }

  void init()
  {
    fd = new FaceDetect();
    fd.start(width, height, 1);

    float camZ = ((height / 2.0) / tan(PI * 60.0 / 360.0));
    float fov = (PI / 3.0);
    float aspect = (width / height);
    float near = (camZ / 60.0);
    float far = (camZ * 60.0);
    perspective(fov, aspect, near, far);
  }

  void run()
  {
    faces = fd.detect();
    if (faces.length > 0) {
      headFound = true;
      for(int i=0;i<faces.length;i++) {
        x = faces[i][0];
        y = faces[i][1];
        z = (faces[i][2] * 2);
      }
    }
  }
}