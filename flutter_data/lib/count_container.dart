import 'package:flutter/material.dart';

class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>()
          as CountContainer;

  final _CountPageState model;
  final Function() increment;

  const CountContainer(
      {Key? key,
      required this.model,
      required this.increment,
      required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) => model != oldWidget.model;
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget demo'),
      ),
      body: Text(
          'You have pushed the button this many times: ${state.model.count}'),
      floatingActionButton:
          ElevatedButton(onPressed: state.increment, child: null),
    );
  }
}

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;

  void _incrementCounter() => setState(() {
        count++;
      });

  @override
  Widget build(BuildContext context) {
    return CountContainer(
        model: this, increment: _incrementCounter, child: Counter());
  }
}
