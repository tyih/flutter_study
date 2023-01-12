
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'dart:async';

class CustomEvent {
  String msg;

  CustomEvent(this.msg);
}

EventBus eventBus = EventBus();

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String msg = '通知：';
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription = eventBus.on<CustomEvent>().listen((event) {
      print(event);
      setState(() {
        msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First page')),
      body: Text(msg),
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage())),
        child: null,
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: ElevatedButton(
        child: const Text('Fire Event'),
        onPressed: () => eventBus.fire(CustomEvent('how are you?')),
      ),
    );
  }
}
