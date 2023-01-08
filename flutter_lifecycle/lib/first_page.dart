
import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("first page initState");
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("单次frame绘制回调");
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      print("实时frame绘制回调");
    });
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("first page setState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("first page didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("first page build");
    return Scaffold(
      appBar: AppBar(title: Text("LifeCycle"),),
      body: Center(
        child: Column(
          children: [ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage())), child: Text("打开/关闭新页面"))],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant FirstPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("first page didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("first page deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("first page dispose");
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      print("first page state resumed");
    }
    if (state == AppLifecycleState.inactive) {
      print("first page state inactive");
    }
    if (state == AppLifecycleState.paused) {
      print("first page state paused");
    }
    super.didChangeAppLifecycleState(state);
  }
}