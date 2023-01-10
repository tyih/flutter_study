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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState2();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listView1 = ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text('Mail'),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Message'),
        ),
      ],
    );

    var listView2 = ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 140,
      children: [
        Container(color: Colors.black),
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.yellow),
        Container(color: Colors.orange)
      ],
    );

    // 适用于子Widget较多，视觉效果呈现某种规律性的场景
    var listView3 = ListView.builder(
        itemExtent: 44.0,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('title $index'), subtitle: Text('body $index')));

    // 带分割线，与ListView.builder场景类似
    var listView4 = ListView.separated(
        itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('title $index'), subtitle: Text('body $index')),
        separatorBuilder: (BuildContext context, int index) => index % 2 == 0
            ? const Divider(color: Colors.green)
            : const Divider(color: Colors.red),
        itemCount: 150);

    // CustomScrollView
    var customScrollView = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: const Text('CustomScrollView Demo'),
          floating: true,
          flexibleSpace: Image.network(
              'https://emall.bydauto.com.cn/uploads/lunBoImg/1659884123550863.png'),
          expandedHeight: 300,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 110))
      ],
    );

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: customScrollView));
  }
}

/*
* 使用ScrollController进行滚动信息的监听
* */
class _MyHomePageState2 extends State<MyHomePage> {
  late ScrollController _controller; // ListView控制器
  bool isToTop = false;

  @override
  void initState() {
    _controller = ScrollController();
    // _controller.addListener(() {
    //   if (_controller.offset > 500) {
    //     setState(() {
    //       isToTop = true;
    //     });
    //   } else if (_controller.offset < 300) {
    //     setState(() {
    //       isToTop = false;
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     home: Scaffold(
    //   backgroundColor: Colors.orange,
    //   appBar: AppBar(title: const Text('ScrollController Demo')),
    //   body: Center(
    //       child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       ElevatedButton(
    //           onPressed: (isToTop
    //               ? () {
    //                   if (isToTop) {
    //                     _controller.animateTo(.0,
    //                         duration: const Duration(milliseconds: 200),
    //                         curve: Curves.ease);
    //                   }
    //                 }
    //               : null),
    //           child: const Text('Top')),
    //       Expanded(
    //         child: Container(
    //             decoration: const BoxDecoration(color: Colors.green),
    //             child: ListView.builder(
    //                 controller: _controller,
    //                 itemCount: 150,
    //                 itemBuilder: (context, index) => ListTile(
    //                       title: Text("Index: $index"),
    //                     ))),
    //       )
    //     ],
    //   )),
    //   floatingActionButton: ElevatedButton(
    //       onPressed: (isToTop
    //           ? () {
    //               if (isToTop) {
    //                 _controller.animateTo(.0,
    //                     duration: const Duration(milliseconds: 200),
    //                     curve: Curves.ease);
    //               }
    //             }
    //           : null),
    //       child: const Text('Top')),
    // ));

    // ScrollNotification
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: const Text('ScrollController Demo')),
      body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            double p = scrollNotification.metrics.pixels;
            print('listview offset is $p');

            if (scrollNotification is ScrollStartNotification) {
              print('Scroll start');
            } else if (scrollNotification is ScrollUpdateNotification) {
              print('Scroll update');
            } else if (scrollNotification is ScrollEndNotification) {
              print('Scroll end');

              setState(() {
                if (p > 300) {
                  setState(() {
                    isToTop = true;
                  });
                } else {
                  setState(() {
                    isToTop = false;
                  });
                }
              });
            }
            return false;
          },
          child: ListView.builder(
              controller: _controller,
              itemCount: 150,
              itemBuilder: (context, index) => ListTile(
                    title: Text("Index: $index"),
                  ))),
      floatingActionButton: ElevatedButton(
          onPressed: (isToTop
              ? () {
                  if (isToTop) {
                    _controller.animateTo(.0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  }
                }
              : null),
          child: const Text('Top')),
    ));
  }

  @override
  void dispose() {
    _controller.dispose(); // 销毁控制器
    super.dispose();
  }
}
