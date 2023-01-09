
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  SecondPage({Key? key}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  int _counter = 0;

  // 当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用一次
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

  /*
  * 初始化时，在initState之后立刻调用
  * 当State的依赖关系发生变化时，会触发此接口被调用
  * */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("second page didChangeDependencies");
  }

  // 绘制界面
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

  // 状态改变时会调用该方法，比如父类调用了setState
  @override
  void didUpdateWidget(covariant SecondPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("second page didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("second page deactivate");
  }

  // 当State对象从树中被永久移除时调用，通常在此回调中释放资源
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

  // 绘制界面
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("child build");
    return Text("点击按钮 数字变化 count: ${widget.count}");
  }

  // 当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("child initState");
  }

  // 初始化时，在initState之后立刻调用
  // 当State的依赖关系发生变化时，会触发此接口被调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("child didChangeDependencies");
  }

  // 状态改变的时候会调用此方法，比如父类调用了setState
  @override
  void didUpdateWidget(covariant Child oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("child didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("child deactivate");
  }

  // 当State对象从树中被永久移除时调用，通常在此回调中释放资源
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("child dispose");
  }
}