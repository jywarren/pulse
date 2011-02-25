import processing.video.*;

Capture video;
boolean cheatScreen;


float[] bright;
char[] chars;

PFont font;
float fontSize = 1.5;
PFont fontA;

public void setup() {
  size(640, 480, P2D);
  // Or run full screen, more fun! Use with Sketch -> Present
  //size(screen.width, screen.height, OPENGL);

  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, 80, 60, 35);

}

public void captureEvent(Capture c) {
  c.read();
}

int res = 11;
int r2;

void draw() {
  background(0);

  float sum = 0.000;
  float pixcount = 0.000;

  int index = 0;
  for (int y = 1; y < int (video.height); y+=res) {

    for (int x = 0; x < int (video.width); x+=res) {
        int pixelColor = video.pixels[index];
        // Faster method of calculating r, g, b than red(), green(), blue() 
        int r = (pixelColor >> 16) & 0xff;
        int g = (pixelColor >> 8) & 0xff;
        int b = pixelColor & 0xff;

        r2 = r;

        sum += r;
        pixcount += 255;
        index++;
    }
  }

  fill(255,0,0);
  rect(0,0,width,int (height*(sum/pixcount)));
  fill(255,255,255);
  text(r2,22,22);
  text((sum/pixcount),22,122);
}

