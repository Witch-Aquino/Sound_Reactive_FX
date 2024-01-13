import ddf.minim.*;

Minim minim;
AudioInput in;

PImage img;

void setup()
{
  size(640, 480, OPENGL);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 640);
  
  img = loadImage("logo.png");
  
  frameRate(60);
}

void draw()
{
  background(0);
  
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    stroke(255);
    line( i, height / 2 + in.left.get(i)*100, i + 2, height / 2 + in.left.get(i + 1) * 100 );
    line( i, height / 2 + in.left.get(i)*200, i + 2, height / 2 + in.left.get(i + 1) * 200 );
    line( i, height / 2 + in.left.get(i)*300, i + 2, height / 2 + in.left.get(i + 1) * 300 );

    if (in.left.get(i) > 0.4)
    {
      tint(255);
      image(img, width / 4, height / 4, 320, 320);
    }
  }
  minim = new Minim(this);
  
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}
