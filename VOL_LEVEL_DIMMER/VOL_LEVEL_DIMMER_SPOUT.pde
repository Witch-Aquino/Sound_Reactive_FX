import processing.sound.*;
import spout.*;
int args;

Spout spout;

AudioIn in;
Amplitude rms;

PImage img;

void setup()
{
  size(640, 480, OPENGL);
  noStroke();
  colorMode(HSB, 360, 100, 100);

  Sound s = new Sound(this);
  s.inputDevice(args); // 音声入力デバイスを引数指定

  in = new AudioIn(this, 0);
  in.start();
  rms = new Amplitude(this);
  rms.input(in);

  spout = new Spout(this);
  spout.createSender("VOL_LEVEL_DIMMER_SPOUT");


  frameRate(60);
}

void draw()
{
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);

  background(0, 0, diameter * 2 + 10);
  delay(10);
  spout.sendTexture();
}
