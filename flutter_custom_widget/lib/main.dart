import 'dart:math';

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
  var model = UpdateItemModel(
      'assets/google.jpeg',
      'Google chrome v1.0.1',
      '40',
      '2023.1.11',
      'appDescription,appDescription,appDescription,appDescription,appDescription',
      '1.1.0');

  late VoidCallback onPressed = () {
    print('Update Pressed');
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Cake());
    // body: UpdateItem(model: model, onPressed: onPressed));
  }
}

class UpdateItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;

  UpdateItemModel(this.appIcon, this.appName, this.appSize, this.appDate,
      this.appDescription, this.appVersion);
}

class UpdateItem extends StatelessWidget {
  final UpdateItemModel model;
  final VoidCallback onPressed;

  const UpdateItem({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildTopRow(context), buildBottomRow(context)],
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                model.appIcon,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.appName, maxLines: 1),
            Text(model.appDate, maxLines: 1)
          ],
        )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: ElevatedButton(
            onPressed: onPressed,
            child: const Text('OPEN'),
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.appDescription),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('${model.appVersion} - ${model.appSize}'))
            ]));
  }
}

class WheelPainter extends CustomPainter {
  Paint getColoredPaint(Color color) {
    Paint paint = Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double wheelSize = min(size.width, size.height) / 2;
    double nbElem = 6;
    double radius = (2 * pi) / nbElem;
    Rect boundingRect = Rect.fromCircle(
        center: Offset(wheelSize, wheelSize), radius: wheelSize);
    canvas.drawArc(
        boundingRect, 0, radius, true, getColoredPaint(Colors.orange));
    canvas.drawArc(
        boundingRect, radius, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(
        boundingRect, radius * 2, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(
        boundingRect, radius * 3, radius, true, getColoredPaint(Colors.green));
    canvas.drawArc(
        boundingRect, radius * 4, radius, true, getColoredPaint(Colors.pink));
    canvas.drawArc(
        boundingRect, radius * 5, radius, true, getColoredPaint(Colors.white));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}

class Cake extends StatelessWidget {
  const Cake({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(400, 500),
      painter: WheelPainter(),
    );
  }
}
