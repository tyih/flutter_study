import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('First Page')),
        body: ElevatedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SecondScreen())),
          child: const Text('First Page'),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Page')),
        body: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Second Page')));
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Column(
        children: <Widget>[
          Text('Message from first page: $msg'),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Third page say Bye'),
              child: const Text('Third page pop'))
        ],
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unknown Page'),
      ),
      body: ElevatedButton(
          child: const Text('Back'), onPressed: () => Navigator.pop(context)),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      routes: {
        'second_page': (context) => SecondScreen(),
        'third_page': (context) => ThirdScreen()
      },
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => UnknownScreen()),
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
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen())),
              child: Text('基本路由')),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'second_page'),
              child: Text('命名路由')),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'third_page',
                          arguments: 'First page say Hey')
                      .then((msg) {
                    setState(() {
                      _msg = msg as String;
                    });
                  }),
              child: Text('命名路由（参数&回调）')),
          Text('Message from Third page: $_msg'),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'unknown_page'),
              child: Text('命名路由异常处理'))
        ],
      ),
    );
  }
}
