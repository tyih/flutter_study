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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Container(color: Colors.yellow, width: 300, height: 300),
            const Positioned(
                left: 18.0, top: 100.0, child: Text('Stack提供了层叠布局的容器')),
            Positioned(
                left: 18.0,
                top: 100.0,
                child: Container(
                  color: Colors.green,
                  width: 50,
                  height: 50,
                ))
          ],
        ));
    // body: Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   mainAxisSize: MainAxisSize.min,
    //   children: <Widget>[
    //     Container(color: Colors.yellow, width: 60, height: 80),
    //     Container(color: Colors.red, width: 100, height: 180),
    //     Container(color: Colors.black, width: 60, height: 80),
    //     Container(color: Colors.green, width: 60, height: 80)
    //   ],
    // ));
    // body: Row(
    //   children: <Widget>[
    //     Expanded(flex:1, child: Container(color: Colors.yellow, width: 60, height: 80)),
    //     Container(color: Colors.red, width: 100, height: 180),
    //     Container(color: Colors.black, width: 60, height: 80),
    //     Expanded(flex:1, child: Container(color: Colors.green, width: 60, height: 80))
    //   ],
    // ));
    // body: const Center(
    //   child: Text('单子Widget布局容器Center将其子Widget居中排列'),
    // ));
    // body: const Padding(
    //   padding: EdgeInsets.all(20.0),
    //   child: Text('如果只要将子Widget设定间距，可以使用单子容器控件Padding进行内容填充'),
    // ));
    // body: Container(
    //   padding: const EdgeInsets.all(10), // 内边距
    //   margin: const EdgeInsets.all(10.0), // 外边距
    //   width: 180.0,
    //   height: 240.0,
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration( // Container样式
    //       color: Colors.red,
    //       borderRadius: BorderRadius.circular(10.0)),
    //   child: const Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外'),
    // ));
  }
}
