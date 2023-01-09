
import 'package:flutter/material.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with WidgetsBindingObserver {

  // 当Widget第一次插入Widget树时被调用。对于每一个State对象，Flutter只会调用该回调一次
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

  /*
  * 初始化时，在initState之后立刻调用
  * 当State的依赖关系发生变化时，会触发此接口被调用
  * */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("first page didChangeDependencies");
  }

  // 绘制界面
  @override
  Widget build(BuildContext context) {
    print("first page build");
    return Scaffold(
      appBar: AppBar(title: Text("LifeCycle"),),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SecondPage())
                ),
                child: Text("打开/关闭新页面")
            )
          ],
        ),
      ),
    );
  }

  // 状态改变的时候会调用该方法，比如父类调用了setState
  @override
  void didUpdateWidget(covariant FirstPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("first page didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用该方法
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("first page deactivate");
  }

  // 当State对象从树中被永久移除时调用，通常在此回调中释放资源
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("first page dispose");
    WidgetsBinding.instance.removeObserver(this); // 移除监听器
  }

  // 监听App生命周期回调
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
    if (state == AppLifecycleState.detached) {
      print("first page state detached");
    }
    super.didChangeAppLifecycleState(state);
  }
}