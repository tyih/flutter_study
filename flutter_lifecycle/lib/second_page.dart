
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  SecondPage({Key? key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("second page initState");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("second page setState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("second page didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("second page build");
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Child(count: _counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant SecondPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("second page didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("second page deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("second page dispose");
  }
}

class Child extends StatefulWidget {
  final int count;
  Child({Key? key, required this.count}) : super(key: key);

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("child build");
    return Text("点击按钮 数字变化 count: ${widget.count}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("child initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("child didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Child oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("child didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("child deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("child dispose");
  }
}