import 'package:first_flutter_project/home.dart';
import 'package:first_flutter_project/list.dart';
import 'package:first_flutter_project/regisTrationForm.dart';
import 'package:first_flutter_project/register.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyWidget());
}

// class MyApp2 extends StatelessWidget {
//   const MyApp2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//     );
//   }
// }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "p5",
      routes: {
        "p1": ((context) => MyLogin()),
        "p2": ((context) => MyRegister()),
        "p3": ((context) => Search()),
        "p4": ((context) => MyWidget22()),
        "p5": ((context) => MyReg()),
        "p6": ((context) => ListViewl()),
        "p7": ((context) => SearchPage()),
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Dako"),
            titleSpacing: 5,
            toolbarHeight: 60,
            toolbarOpacity: 1,
            centerTitle: true,
            elevation: 15,
            actions: [
              IconButton(
                  onPressed: () {
                    print("Mahbub");
                  },
                  icon: const Icon(Icons.account_box)),
            ],
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              onPressed: () {
                print('hello');
              },
              icon: const Icon(Icons.menu),
            ),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                print('click me');
              },
              child: const Text('Click me'),
            ),
          ),
        ),
      ),
    );
  }
}

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: email,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: password,
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Log in',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 70, 61, 59)),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      if (!email.text.contains("@") &&
                                          !email.text.contains(".")) {
                                        Fluttertoast.showToast(
                                            msg: 'Email is not correct');
                                      }

                                      Navigator.pushNamedAndRemoveUntil(
                                          context, "p2", (route) => true);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "p2", (route) => true);
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class practise extends StatelessWidget {
  const practise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Icon',
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Icon',
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Icon",
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(width: 5),
                    ],
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

class Ro extends StatelessWidget {
  const Ro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types

class Myy extends StatelessWidget {
  const Myy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/one.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/three.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/two.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/three.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/one.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/three.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: double.infinity,
                              width: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/two.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/three.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/one.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/two.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/three.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/one.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/two.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/three.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/one.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blueAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/two.jpg"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/three.jpg"),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class swipe extends StatelessWidget {
  const swipe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}

class Search extends StatelessWidget {
  Search({super.key});
  List<String> listItems = [
    'Basabo',
    'Banani',
    'Mohammadpur',
    'khilgaon',
    'Banasree'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('set your Location'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return listItems.where((String item) {
                return item.contains(textEditingValue.text.toLowerCase());
              });
            },
          ),
        ),
      ),
    );
  }
}
