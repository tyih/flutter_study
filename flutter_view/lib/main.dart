import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 文本控件
    var text = const Text(
        '这是文本控件,用来显示一段特定样式的字符串，类似Android里的TextView或iOS中的UILabel',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red));

    // 富文本
    TextStyle blackStyle = const TextStyle(
        fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black);
    TextStyle redStyle = const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red);

    var richText = Text.rich(TextSpan(children: <TextSpan>[
      TextSpan(text: '文本控件用来显示一段特定样式的字符串', style: redStyle),
      TextSpan(text: 'Android', style: blackStyle),
      TextSpan(text: '中的', style: redStyle),
      TextSpan(text: 'TextView', style: blackStyle)
    ]));

    // 图片
    var image = FadeInImage.assetNetwork(
        placeholder: 'assets/loading.gif',
        image: 'https://res.gwm.com.cn/2023/01/09/1825944_115_1920.jpg');
    var image0 = const FadeInImage(
      fadeOutDuration: Duration(seconds: 1),
      fadeOutCurve: Curves.easeOutQuad,
      fadeInDuration: Duration(seconds: 2),
      fadeInCurve: Curves.easeInQuad,
      // placeholderErrorBuilder: _placeholderErrorBuilder,
      placeholder: AssetImage(
        'assets/loading.gif',
      ),
      image: NetworkImage(
          'https://res.gwm.com.cn/2023/01/09/1825944_115_1920.jpg'),
    );

    var image1 =
        Image.network('https://res.gwm.com.cn/2023/01/09/1825944_115_1920.jpg');

    var image2 = const FadeInImageDemo();

    /*使用第三方cached_network_image*/
    var image3 = CachedNetworkImage(
        imageUrl: 'https://res.gwm.com.cn/2023/01/09/1825944_115_1920.jpg',
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error));

    // 按钮
    var floatingBtn = FloatingActionButton(
      onPressed: () => print('FloatingActionButton pressed'),
      child: const Text('FloatingActionButton'),
    );

    var textBtn = TextButton(
        onPressed: () => print('TextButton pressed'),
        child: const Text('TextButton'));

    var elevateBtn = ElevatedButton(
        onPressed: () => print('ElevatedButton pressed'),
        child: const Text('ElevatedButton'));

    var btns = Column(children: [floatingBtn, textBtn, elevateBtn]);

    // 按钮样式定制
    var textBtnCustom = FloatingActionButton(
        backgroundColor: Colors.yellow,
        shape:
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        hoverColor: Colors.red,
        onPressed: () => print('Text Button pressed!'),
        child: Row(
          children: const <Widget>[
            Icon(Icons.add, color: Colors.black,),
            Text(
              'Add',
              style: TextStyle(color: Colors.black),
            )
          ],
        ));

    return Scaffold(
        appBar: AppBar(
          title: const Text('App Bar'),
        ),
        body: Center(
          child: textBtnCustom,
        ));
  }
}

class FadeInImageDemo extends StatelessWidget {
  final headUrl = 'https://res.gwm.com.cn/2023/01/09/1825944_115_1920.jpg';

  const FadeInImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeOutDuration: const Duration(seconds: 1),
      fadeOutCurve: Curves.easeOutQuad,
      fadeInDuration: const Duration(seconds: 2),
      fadeInCurve: Curves.easeInQuad,
      placeholderErrorBuilder: _placeholderErrorBuilder,
      placeholder: const AssetImage(
        'assets/loading.gif',
      ),
      image: NetworkImage(headUrl),
    );
  }

  Widget _placeholderErrorBuilder(
      BuildContext context, Object error, StackTrace? stackTrace) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }
}
