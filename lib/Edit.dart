import 'package:first_flutter_project/Model/PostModel.dart';
import 'package:first_flutter_project/Model/newRegist.dart';

import 'package:first_flutter_project/list.dart';
import 'package:first_flutter_project/service.dart';
import 'package:first_flutter_project/update.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  // final PostModel? postmodel;
  final NewRegis? newregis;

  const MyWidget({super.key, this.newregis});

  Widget getPost(context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 1.0),
            Text(
              "Id : " + newregis!.id.toString(),
              style: TextStyle(fontSize: 15, fontFamily: "bolt-semibold"),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 1.0), // give it width

            Text(
              newregis!.name.toString(),
              style: TextStyle(fontSize: 10, fontFamily: "bolt-semibold"),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 1.0), // give it width

            TextButton(
                onPressed: () async {
                  (await ApiService().deletePosts(newregis!.id));
                  // print("Delete Call!");
                },
                child: Icon(Icons.delete)),
            TextButton(
                onPressed: () {
                  print("Update Call!");
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => (MyWidget22()),
                    ),
                    (route) => false,
                  );
                },
                child: Icon(Icons.update)),
          ],
          // Text(_postsModel![index].body.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // (userModel != null) ? userModel!.name : posts!.title.toString(),
          // product!.name.toString(),
          newregis!.password.toString(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context, "/home", (route) => false);

                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ListViewl(),
                  ),
                  (route) => false,
                );
              },
              icon: Icon(Icons.list_alt))
        ],
      ),
      body: getPost(context),
    );
    ;
  }
}
