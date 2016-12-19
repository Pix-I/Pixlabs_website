
Hand hand;



void setup()
{
  size(screen.width, screen.height);

  stroke(255, 255, 255);
  hand = new Hand(100,100,1500,1000,950);
  background(0, 0, 120, 30);
  fill(255);
  stroke(255,555,255);
  frameRate( 40 );
  smooth(8);


}

void draw(){
  //  noFill();
    hand.show();

}

class Hand{
    int maxX;
    int maxY;
    int minX;
    int minY;
    int yAxis;


    float length;
    Wrist wrist;
    Thumb thumb;
    Finger[] fingers;

    Hand(int tminX,int tminY,int tmaxX,int tmaxY, float tlength){
        maxX = tmaxX;
        maxY = tmaxY;
        minX = tminX;
        minY = tminY;
        length = tlength;
        yAxis = (tmaxY-tminY)/2-150;

        wrist = new Wrist(tmaxX-50,yAxis);

        thumb =  new Thumb(tmaxX-(0.30*length),yAxis+70,length/3);

        fingers = new Finger[4];
        fingers[0] =  new Finger(tmaxX-length/2,yAxis-75,length/2,44);
        fingers[1] =  new Finger(tmaxX-length/2+5,yAxis-75,length/2-10,46);
        fingers[2] =  new Finger(tmaxX-length/2+10,yAxis-75,length/2+5,43);
        fingers[3] =  new Finger(tmaxX-(length/2-40),yAxis-75,length/2-80,38);




    }

    void show(){
    thumb.show();
    line(thumb.x,thumb.y,wrist.x,wrist.y+30);
    wrist.show();
    int wristVar = 3;
    for(int i = 0;i<fingers.length;i++){
            wristVar = -wristVar;
            fingers[i].show();
            line(wrist.x,wrist.y-10+wristVar,fingers[i].x,fingers[i].y);
        }
    }
    void move(){
        wrist.move();
        thumb.move();
    }

}

class Bone{



}

class Wrist{
    float x;
    float y;

    Wrist(float xpos, float ypos){
        x = xpos;
        y = ypos;
    }

    void move(float originX,float originY){
        x = originX;
        y = originY;
    }

   void show(){
        noFill();
        ellipse(x,y,90,150);
    }
}



class Thumb {
    Point[] points = new Point[3];
    float x;
    float y;


    Thumb(float originX,float originY,float length){
        x = originX;
        y = originY;

        points[0] = new Point(originX,originY,120,90);
        points[1] = new Point(originX-length/2,originY,50);
        points[2] = new Point(originX-length,originY,38);

    }

    void move(){

    }

    void show(){
        for(int i = 0;i<points.length;i++){
            points[i].show();
        }
        for(int i = 0;i<points.length-1;i++){
            line(points[i].x,points[i].y,points[i+1].x,points[i+1].y);

        }
    }

}

class Point{
    float x;
    float y;
    float d1;
    float d2;
    Point(int originX,int originY,float diam){
       x = originX;
       y = originY;
       d1 = diam;
       d2 = diam;
    }

    Point(int originX,int originY,float diam1,float diam2){

       x = originX;
       y = originY;
       d1 = diam1;
       d2 = diam2;

    }

    void show(){
    noFill();
        ellipse(x,y,d1,d2);
    }

}

class Finger{
    float length;

    Point[] points =  new Point[4];
    float x;
    float y;


    Finger(float originX,float originY,float tlength,float diam){
        tlength = tlength*16/37;
        x = originX;
        y = originY;

        for(int i = 0;i<4;i++){
            points[i] = new Point(originX-i*tlength,originY+i*9,diam);
            diam =  diam*11/12;
            tlength =3.5/4*tlength;
        }

    }
    void show(){
        for(int i = 0;i<points.length;i++){
            points[i].show();
            }
            for(int i =0;i<points.length-1;i++){
            line(points[i].x,points[i].y,points[i+1].x,points[i+1].y);
        }

    }
    void move(){
    }

}
