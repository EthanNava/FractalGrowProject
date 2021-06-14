
class Cell {
  
  PVector position;
  PVector nearestPos;
  PVector center = new PVector(width/2,height/2);
  float radius;
  color c = color(random(150,255),random(150),0,100);
  
 Cell(float x, float y, float radius, float nx, float ny){
   this.position = new PVector(x, y);
   this.radius = radius;
   this.nearestPos = new PVector(nx, ny);
 }
 
 void render(){
   noStroke();
   fill(c);
   ellipse(this.position.x,this.position.y,this.radius*2,this.radius*2);
   stroke(255);
   strokeWeight(map(PVector.dist(position,center),0,540,1,10));
   line(this.position.x,this.position.y,this.nearestPos.x,this.nearestPos.y);
   
   /*
   pushMatrix();
   translate(this.nearestPos.x,this.nearestPos.y);
   ellipse((this.position.x-this.nearestPos.x)*0.5,(this.position.y-this.nearestPos.y)*0.5,this.radius*2,this.radius*2);
   line(0,0,(this.position.x-this.nearestPos.x)*0.5,(this.position.y-this.nearestPos.y)*0.5);
   popMatrix();
   */
   //NO FUNCIONA ellipse((this.position.x-this.nearestPos.x+this.nearestPos.x+this.position.x)*0.5,(this.position.y-this.nearestPos.y+this.nearestPos.y+this.position.y)*0.5,this.radius*2,this.radius*2);
   //MENOS ellipse(this.nearestPos.x+(this.nearestPos.x+(this.position.x-this.nearestPos.x))*0.5,this.nearestPos.y+(this.nearestPos.y+(this.position.y-this.nearestPos.y))*0.5,this.radius*2,this.radius*2);
 }
 
 
 
}
