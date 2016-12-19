int left = 400;
Movingdots dots;

void setup()
{
  stroke(255, 255, 255);
  size(screen.width, screen.height);

  background(0, 0, 120, 30);
  fill(255);
  stroke(255,555,255);
  frameRate( 40 );
  dots = new Movingdots(9,500,150,screen.width-150,screen.height-500);
}

void draw(){
   background(0, 0, 120, 30);
   fill(255);
   dots.move();
   dots.show();
 }

   class Movingdots{
     int maxXRange;
     int maxYRange;
     int minXRange;
     int minYRange;

     Dot[] dots;
     Movingdots(int numberOfDots,int tminXRange,int tminYRange,int tmaxXRange, int tmaxYRange){
       maxXRange = tmaxXRange;
       maxYRange = tmaxYRange;
       minXRange = tminXRange;
       minYRange = tminYRange;
       dots = new Dot[numberOfDots];
       for(int i = 0;i<dots.length;i++)
       {
         dots[i] = new Dot(minXRange +(maxXRange-minXRange)/dots.length*i,minYRange +(int) random(maxYRange-minYRange),tminYRange,tmaxYRange);
        }
     }
     void show() {

       strokeWeight(0);
       for(Dot dot : dots){
         dot.show();
       }
       strokeWeight(1);
       for(int i = 0;i<dots.length-1;i++){
         line(dots[i].posX,dots[i].posY,dots[i+1].posX,dots[i+1].posY);
       }
     }
     void move(){
       for(Dot dot: dots){
         dot.move();
       }
     }
   }

 class Dot{
   float posX;
   float posY;
   float minY;
   float maxY;
   Orientation ori = new Orientation();
   int orientationCD = 5;
   Dot(float tx, float ty,float tminY,float tmaxY){
     posX = tx;
     posY =ty;
     minY = tminY;
     maxY = tmaxY;
   }
   void show(){
      ellipse(posX, posY, 5, 5);
   }
   void move(){
    if(orientationCD<0){
      ori = new Orientation();
    orientationCD = (int) random(40,100);
    if(posY+orientationCD*ori.y<minY || posY+orientationCD*ori.y>maxY){
      ori.y = -ori.y;
    }

  }
    posY+=ori.y;
    orientationCD--;

  }

}

class Orientation{
  float y = random(-1,1);
}
