import 'package:flutter/material.dart';
import 'count_container.dart';
import 'notification_widget.dart';
import 'event_bus_page.dart';

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
  String _msg = '通知：';

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: Text(widget.title),
    //   ),
    //   body: CountPage() // This trailing comma makes auto-formatting nicer for build methods.
    // );
    // return NotificationListener<CustomNotification>(
    //     onNotification: (notification) {
    //       setState(() {
    //         print(notification.msg);
    //         _msg += '${notification.msg}  ';
    //       });
    //       return false;
    //     },
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [Text(_msg), const CustomChild()],
    //     ));
    return const FirstPage();
  }
}
