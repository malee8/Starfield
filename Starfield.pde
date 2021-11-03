Particle[]group=new Particle[1500];
int gravity;
int filled=0;
void setup() {
  size(1000, 1000);
  for (int i=0; i<group.length; i++) {
    group[i]=new Particle();
  }
  group[group.length-1]=new BlackDot();
}
void draw() {
  background(25);
  for (int i=0; i<group.length; i++) {
    group[i].move();
    group[i].show();
  }
}
class Particle {
  double myX, myY, myColor1, myColor2, myColor3, myAngle, mySpeed, mySize;
  Particle() {
    myX=500;
    myY=500;
    myColor1=Math.random()*256;
    myColor2=Math.random()*256;
    myColor3=Math.random()*256;
    myAngle=Math.random()*2*Math.PI;
    mySpeed=Math.random()*15;
    mySize=Math.random()*10+5;
  }
  void move() {
    myColor1=Math.random()*256;
    myColor2=Math.random()*256;
    myColor3=Math.random()*256;
    if (myX>1000||myY>1000||myX<0||myY<0) {
      gravity=gravity+1;
    }
    myX=myX-Math.cos(myAngle)*mySpeed;
    myY=myY-Math.sin(myAngle)*mySpeed;
    myAngle=myAngle-.03;
    if ((myX>499&&myX<501)&&(myY>499&&myY<501)) {
      filled=filled+1;
      System.out.println(filled);
    }
    if (filled>1550) {
      myX=500;
      myY=500;
      gravity=0;
      filled=0;
    }
  }
  void show() {
    fill((float)myColor1, (float)myColor2, (float)myColor3);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
class BlackDot extends Particle {
  BlackDot() {
    myX=500;
    myY=500;
    myColor1=0;
    myColor2=0;
    myColor3=0;
    mySpeed=0;
    mySize=50;
  }
  void move() {
    if (gravity==0) {
      mySize=200;
      myColor1=255;
      gravity=1;
    } else {
      mySize=50;
      myColor1=0;
    }
  }
}
