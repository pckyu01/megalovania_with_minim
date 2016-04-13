// made by Chunkyu Park
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer mg; //whole music 2:36 == 156 seconds \
BeatDetect bd;
AudioBuffer ab;
Effect ef;

PImage Sans;
PImage Sans_g;
PImage Sans_p;
int t;


void setup()
{
  fullScreen();
  
  minim = new Minim(this);
  ef = new Effect();
  
  Sans = loadImage("Sans.gif");
  Sans_g = loadImage("Sans_genoside.gif");
  Sans_p = loadImage("Sans_pause.png");
  mg = minim.loadFile("megalovania.mp3");
  mg.loop();
  
  ef.beat();
}

void draw()
{
  t = mg.position();
  background(0);
  imageMode(CENTER);
  noStroke();
  smooth();
  if(mg.isPlaying() == true)
  {
    if(t <= 16000)
    {
      image(Sans, width/2, height/2);
      ef.boxes();
      ef.display();
    }
    else
    {
      image(Sans_g, width/2, height/2);
      stroke(255);
      ef.lines();
      ef.display();
    }
  }
  else
  {
    image(Sans_p, width/2, height/2);
  }
}

void mouseClicked()
{
  if(mg.isPlaying() == true)
  {
    mg.pause();
  }
  else
  {
    mg.play();
    ef.beat();
  }
}