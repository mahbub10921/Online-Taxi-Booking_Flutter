import 'package:first_flutter_project/service.dart';
import 'package:flutter/material.dart';

import 'Model/PostModel.dart';

class ListView extends StatefulWidget {
  const ListView({super.key});

  @override
  State<ListView> createState() => _ListViewState();

  static builder(
      {required int itemCount,
      required ListTile Function(dynamic context, dynamic index)
          itemBuilder}) {}
}

class _ListViewState extends State<ListView> {
  late List<PostModel>? _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void _getData() async {
      _userModel = (await ApiService().getPosts())!;
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(
            () {},
          ));
    }
  }

  Widget _getPostList(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example for Post'),
        actions: [
          IconButton(
              onPressed: () {
                // goBack(context);
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
                        // Navigator.pushAndRemoveUntil<dynamic>(
                        //   context,
                        //   MaterialPageRoute<dynamic>(
                        //     builder: (BuildContext context) =>
                        //         Detail(posts: _postsModel![index]),
                        //   ),
                        //   (route) => false,
                        // );
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
