import processing.sound.*;

AudioIn in;
FFT fft;
int bands = 64;
float scale = 5000.0;

PImage img;

void setup()
{
  size(640, 480, P2D);
  noStroke();
  
  in = new AudioIn(this, 0);
  in.start();

  fft = new FFT(this, bands);
  fft.input(in);

  img = loadImage("logo.png");

  frameRate(60);
}

void draw()
{
  background(0);
  
  fft.analyze();
  float w = width / float(bands) / 2.0;

  for (int i = 0; i < bands; i++){
    fill(fft.spectrum[i] * scale + 10);
    rect(0 + i * w, 0, w, height);
    rect(width - i * w, 0, w, height);

    tint(fft.spectrum[i] * scale * 20);
    image(img, width / 4, height / 4, 320, 320);

  }
}
