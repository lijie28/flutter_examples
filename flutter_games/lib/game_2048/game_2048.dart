import 'package:flutter/material.dart';

class Game2048 extends StatefulWidget {
  @override
  _Game2048State createState() => _Game2048State();
}

class _Game2048State extends State<Game2048> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final winWidth = size.width;
    final winHeight = size.height;

    DateTime _panStartTime;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("2048"),
      ),
      body: new Center(
        child: GestureDetector(
          child: Container(
            color: Colors.yellow,
            width: winWidth,
            height: winHeight,
          ),

          onPanDown: (e) {
            _panStartTime = DateTime.now();
//            print("按下的位置${e.globalPosition},$_panStartTime");
          }, //手指按下时会触发此回调
          //手指滑动结束
          onPanEnd: (e) {
            int diff = DateTime.now().difference(_panStartTime).inMilliseconds;
            if (diff > 1000) {
              return;
            }
//            print("手指滑动结束: $diff, " + e.velocity.toString());
            double x = e.velocity.pixelsPerSecond.dx;
            double y = e.velocity.pixelsPerSecond.dy;
            if (x.abs() > y.abs()) {
              if (x>0) {
                print("右");
              } else {
                print("左");
              }
            } else {
              if (y>0) {
                print("下");
              } else {
                print("上");
              }
            }
          },
        ),
      ),
    );
  }
}
