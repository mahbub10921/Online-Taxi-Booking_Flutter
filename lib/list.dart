import 'package:first_flutter_project/Edit.dart';
import 'package:first_flutter_project/Model/route.dart';
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
  late List<PostModel>? _userModel = [];
  late List<Route1>? _userModel2 = [];

  void _getData() async {
    _userModel = (await ApiService().getPosts());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  void _getData2() async {
    _userModel2 = (await ApiService().getPosts2());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
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

                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => MyReg(),
                  ),
                  (route) => false,
                );
              },
              icon: Icon(Icons.arrow_back_ios_sharp))
        ],
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(_userModel![index].title.toString()),
                    subtitle: Text(_userModel![index].body.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                MyWidget(postmodel: _userModel![index]),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icon(Icons.more_vert),
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
