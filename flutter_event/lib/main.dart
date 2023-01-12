import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: RawGestureDetector(
            gestures: {
              MultipleTapGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                          MultipleTapGestureRecognizer>(
                      () => MultipleTapGestureRecognizer(),
                      (MultipleTapGestureRecognizer instance) {
                instance.onTap = () => print('parent tapped');
              })
            },
            child: Container(
              color: Colors.pink,
              child: Center(
                child: GestureDetector(
                  onTap: () => print('Child tapped'),
                  child: Container(
                    color: Colors.blueAccent,
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
              ),
            ))
        // body: GestureDetector(
        //   onTap: ()=>print('Parent tapped'),
        //   child: Container(
        //     color: Colors.pink,
        //     child: Center(
        //       child: GestureDetector(
        //         onTap: ()=>print('Child tapped'),
        //         child: Container(
        //           color: Colors.blueAccent,
        //           width: 200.0,
        //           height: 200.0,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // body: Stack(
        //   children: <Widget>[
        //     Positioned(
        //         top: _top,
        //         left: _left,
        //         child: GestureDetector(
        //           child: Container(
        //             color: Colors.red,
        //             width: 50,
        //             height: 50,
        //           ),
        //           onTap: () => print('Tap'), // 点击回调
        //           onDoubleTap: () => print('Double Tap'), // 双击回调
        //           onLongPress: () => print('Long Press'), // 长按回调
        //           onPanUpdate: (e) { // 拖动回调
        //             print('Pan Update');
        //             setState(() {
        //               _left += e.delta.dx;
        //               _top += e.delta.dy;
        //             });
        //           },
        //         ))
        //   ],
        // ),
        // body: Listener(
        //   child: Container(
        //     color: Colors.red,
        //     width: 300,
        //     height: 300
        //   ),
        //   onPointerDown: (event) => print('down $event'),
        //   onPointerMove: (event) => print('move $event'),
        //   onPointerUp: (event) => print('up $event'),
        // )
        );
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
