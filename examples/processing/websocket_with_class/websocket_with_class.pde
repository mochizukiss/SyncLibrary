import websockets.*;

WebsocketClient wsc;

class Point {
  private int x;
  private int y;
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void drawCircle() {
    circle(this.x, this.y, 20);
  }
}

ArrayList<Point> points = new ArrayList<Point>();

String websocketServerName = "replace-it-with-your-heroku-app-name";

void settings(){
  size(800, 800); 
  wsc= new WebsocketClient(this, "ws://"+websocketServerName + ".herokuapp.com");
}

void draw(){
  for (int i=0;i<points.size();i++) {
    points.get(i).drawCircle();
  }
}


void mousePressed() {
  wsc.sendMessage(mouseX+","+mouseY);
}

void webSocketEvent(String msg){
  String[] point = split(msg, ',');
  points.add(new Point(int(point[0]), int(point[1])));
  println(msg);
}
