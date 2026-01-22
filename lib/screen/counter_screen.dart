import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App using Bloc")),
      body: Column(
        children: [
          Center(child: Text("0", style: TextStyle(fontSize: 200))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // increment event triggering
                },
                child: Text("Increment"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // decrement event triggering
                },
                child: Text("decrement"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
