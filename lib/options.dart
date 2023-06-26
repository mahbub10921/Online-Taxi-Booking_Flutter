import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Option(),
    );
  }
}

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Available Options')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Container(
                  color: Colors.amberAccent,
                  height: 100,
                  width: 2,
                  
                  child: Text('Dako X'),
                  
                ),
                Container(
                  color: Colors.cyan,
                  height: 200,
                  width: 200,
                ),
                Container(
                  color: Colors.teal,
                  height: 200,
                  width: 200,
                ),
                Container(
                  color: Colors.amberAccent,
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
