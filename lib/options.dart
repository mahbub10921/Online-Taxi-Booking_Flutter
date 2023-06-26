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
          child: SizedBox(
            child: Container(
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('assets/one.jpg'),
                        ), // Replace 'assets/image.png' with your image path
                        SizedBox(
                            height:
                                5), // Adjust the spacing between image and text
                        Text(
                          'Dako X \n Fare:250',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('assets/one.jpg'),
                        ), // Replace 'assets/image.png' with your image path
                        SizedBox(
                            height:
                                5), // Adjust the spacing between image and text
                        Text(
                          'Dako XL \n Fare:350',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('assets/one.jpg'),
                        ), // Replace 'assets/image.png' with your image path
                        SizedBox(
                            height:
                                5), // Adjust the spacing between image and text
                        Text(
                          'Dako Premium \n Fare:400',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('assets/one.jpg'),
                        ), // Replace 'assets/image.png' with your image path
                        SizedBox(
                            height:
                                5), // Adjust the spacing between image and text
                        Text(
                          'Rent by km \n Fare:350',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
