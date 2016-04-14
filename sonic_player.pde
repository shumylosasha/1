Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;

void setup()
{
  size (600, 600);
  maxim = new Maxim(this);
  player1 = maxim.loadFile("atmos1.wav");
  player2 = maxim.loadFile("bells.wav");
  player1.setLooping(true);
  player2.setLooping(true);
  player1.volume(0.25);
  background(0);
  rectMode(CENTER);
}

void draw()
{
//  
}

void mouseDragged ()
{
  player1.play();
  player2.play();
  
  float red = map (mouseX, 0, width, 0, 255);
  float blue = map (mouseX, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 1, 10);
  
  noStroke();
  fill (0, alpha);
  rect(width/2, height/2, width, height);
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  //line(pmouseX, pmouseY,mouseX, mouseY);
  //brush1(mouseX, mouseY,speed, speed,lineWidth);
  //brush2(mouseX, mouseY,speed, speed,lineWidth);
  //brush3(mouseX, mouseY,speed, speed,lineWidth);
  //brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush9(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  //brush6(mouseX, mouseY,speed, speed,lineWidth);
  //brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  
  player1.setFilter((float)mouseY/height*5000, mouseX/width);
  player2.ramp (1.,1000);
  player2.speed((float)mouseX/width/2);
  
}

void mouseReleased()
{
 player2.ramp(0.,1000); 
}
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


void brush1(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x, y);
  ellipse(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}


void brush2(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brush3(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();

  return;
}



void brush4(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  //line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  //line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}

void brush9(float x, float y, float px, float py, float lineWidth)
{
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0,0,random(50),random(50));
  rotate(random(px));
  line(0,0,random(50),random(50));
  rotate(random(px));
  line(0,0,random(50),random(50));
  
  popMatrix();
  return;
}

void brush5(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}

void brush6(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-x),height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(height/2-((height/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),height/2+((height/2)-x),px,py);
  ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  return;
}

void brush7(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}

