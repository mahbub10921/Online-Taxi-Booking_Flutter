import 'dart:convert';
// import 'dart:html';

import 'package:first_flutter_project/Model/PostModel.dart';
import 'package:first_flutter_project/Model/newRegist.dart';
import 'package:first_flutter_project/list.dart';
import 'package:first_flutter_project/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyReg extends StatelessWidget {
  const MyReg({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyRegister(),
    );
  }
}

class MyRegister extends StatefulWidget {
  final PostModel? postt;
  const MyRegister({this.postt});

  @override
  // ignore: library_private_types_in_public_api
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _number = '';
  String _vehicleRegis = '';
  String _model = '';
  String _category = '';

  int _selectedCategory = 0;

  List<DropdownMenuItem<int>> categoryList = [];
  void onLoadCategory() {
    categoryList = [];
    categoryList.add(const DropdownMenuItem(child: Text('4 seat'), value: 0));
    categoryList.add(const DropdownMenuItem(child: Text('7 seat'), value: 1));
  }

  Future<void> onPressedSubmit() async {
    print("okkkkkkkkkk");

    NewRegis newRegis = new NewRegis();
    newRegis.name = _name;
    newRegis.email = _email;
    newRegis.category = _category;
    newRegis.model = _model;
    newRegis.number = _number;
    newRegis.regis = _vehicleRegis;
    newRegis.password = _password;

    (await ApiService().createNewReg(newRegis));

    print("save hoice");
    _name = "";
    _email = "";
    _category = "";
    _model = "";
    _number = "";
  }

  // String url = 'http://192.168.20.38:8080/api/posts';
  // //var reqBody = {"username": _email, "name": _name, "password": _password};
  // var re = {"title": _name, "body": _email};
  // var response = await http.post(Uri.parse(url),
  //     headers: {"Content-Type": "application/json"}, body: jsonEncode(re));

  // var jsonResponse = jsonDecode(response.body);

  // if (jsonResponse['status']) {
  //   print('data submit');
  // } else {
  //   print('wrong');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Name",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _name = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _email = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Phone",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _number = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _password = value.toString();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Vehicle Registration No.",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _vehicleRegis = value.toString();
                            },
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Vehicle Model",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _model = value.toString();
                            },
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Vehicle Category",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (value) {
                              _category = value.toString();
                            },
                          ),
                          // DropdownButton(
                          //   borderRadius: BorderRadius.circular(10),
                          //   hint: const Text('Select Category'),
                          //   items: categoryList,
                          //   value: _selectedCategory,
                          //   onChanged: (value) {
                          //     _selectedCategory = int.parse(value.toString());
                          //   },
                          //   isExpanded: true,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      onPressedSubmit();
                                      Navigator.pushAndRemoveUntil<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                // MyWidget22(post1: _userModel![index]),
                                                ListViewl()),
                                        (route) => false,
                                      );
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
                                  Navigator.pushNamed(context, 'login');
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
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
