import 'package:first_flutter_project/Edit.dart';
import 'package:first_flutter_project/Model/newRegist.dart';
import 'package:first_flutter_project/Model/route.dart';
import 'package:first_flutter_project/regisTrationForm.dart';
import 'package:first_flutter_project/register.dart';
import 'package:first_flutter_project/service.dart';
import 'package:flutter/material.dart';

import 'Model/PostModel.dart';

class ListViewl extends StatefulWidget {
  const ListViewl({super.key});

  @override
  State<ListViewl> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewl> {
  late List<PostModel>? getpost1 = [];
  late List<NewRegis>? getReg = [];
  late List<Route1>? getRoute = [];

  void _getData() async {
    getpost1 = (await ApiService().getPosts());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  void _getNewReg() async {
    getReg = (await ApiService().getNewReg());
    print("----------------response.body------------------");

    print(getReg);

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  void _getData2() async {
    getRoute = (await ApiService().getPosts2());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData2();
  }

  Widget _getPostList(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example for Post'),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context, "p5", (route) => false);

                // Navigator.pushAndRemoveUntil<dynamic>(
                //   context,
                //   MaterialPageRoute<dynamic>(
                //     builder: (BuildContext context) => MyReg(),
                //   ),
                //   (route) => false,
                // );
              },
              icon: Icon(Icons.arrow_back_ios_sharp))
        ],
      ),
      body: getRoute == null || getRoute!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
              // child: Text("No Data!!"),
            )
          : Center(
              child: ListView.builder(
                itemCount: getRoute!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(getRoute![index].location.toString()),
                    subtitle: (Text(getRoute![index].latitude.toString())),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  // MyWidget22(post1: _userModel![index]),
                                  MyWidget22()),
                          (route) => false,
                        );
                      },
                      icon: Icon(Icons.update),
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getPostList(context);
  }
}
