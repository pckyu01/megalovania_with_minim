class Effect
{
  
  float posX[];
  float posY[];
  int max = 10;
  float n;
  
  void lines()
  {
    for(int i = 0; i < mg.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, mg.bufferSize(), 0, width );
      float x2 = map( i+1, 0, mg.bufferSize(), 0, width );
      line( x1, 150 + mg.left.get(i)*100, x2, 150 + mg.left.get(i+1)*100 );
      line( x1, 650 + mg.right.get(i)*100, x2, 650 + mg.right.get(i+1)*100 );
    }
  }
  
  void boxes()
  {
    fill(255);
    
    //left side
    rect(0, 100, mg.left.level()*width*1.5, 50);
    rect(0, 200, mg.left.level()*width/2, 50);
    rect(0, 300, mg.left.level()*width, 50);
    rect(0, 400, mg.right.level()*width*1.5, 50);
    rect(0, 500, mg.right.level()*width/2, 50);
    rect(0, 600, mg.right.level()*width, 50);
    // right side
    rect(width, 100, -1*mg.left.level()*width/2, 50);
    rect(width, 200, -1*mg.left.level()*width*1.5, 50);
    rect(width, 300, -1*mg.left.level()*width, 50);
    rect(width, 400, -1*mg.right.level()*width/2, 50);
    rect(width, 500, -1*mg.right.level()*width*1.5, 50);
    rect(width, 600, -1*mg.left.level()*width, 50);
  }
  
  void beat()
  {
    posX = new float[max];
    posY = new float[max];
    for(int i = 0; i < max; i++)
    {
      posX[i] = random(0, width);
      posY[i] = random(0, height);
    }
  }
  
  void display()
  {
    float w;
    float h;
    noFill();
    stroke(255);
    for(int i = 0; i < max; i++)
    {
      n = random(0.5, 2);
      if(t <= 16000)
      {
        w = mg.left.level()*width*n;
      }
      else
      {
        w = mg.left.level()*width/n/3;
      }
      h = w;
      if(w <= 30)
      {
        posX[i] = random(0, width);
        posY[i] = random(0, height);
      }
      
      if(w >= 50)
      {
        if(t < 16000)
        {
          rectMode(CENTER);
          rect(posX[i], posY[i], w, h);
        }
        else
        {
          ellipse(posX[i], posY[i], w, h);
          line(posX[i], posY[i], 698, 339);
        }
      }
    }
  }
}