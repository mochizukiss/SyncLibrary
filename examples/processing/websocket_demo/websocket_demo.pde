import websockets.*;

WebsocketClient wsc;

int point_x=400;
int point_y=400;

//サーバー名
String websocketServerName = "websockect-mochizuki";

void settings() {
  size(800, 800); 
  wsc= new WebsocketClient(this, "ws://"+websocketServerName + ".herokuapp.com");
}

void draw() {
    ellipse(point_x, point_y, 20, 20);
}


void mousePressed() {
  wsc.sendMessage(mouseX+","+mouseY);
}

void webSocketEvent(String msg) {
  println(msg); //送られてきたメッセージの表示
  String[] point = split(msg, ','); //メッセージの分離：カンマ(,)区切り
  
  point_x=int(point[0]);
  point_y=int(point[1]);

}
