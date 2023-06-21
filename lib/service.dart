import 'dart:developer';

import 'package:first_flutter_project/Model/PostModel.dart';
import 'package:http/http.dart' as http;
import '';

class ApiService {
  Future<List<PostModel>?> getUser() async {}

  Future<List<PostModel>?> getPosts() async {
    try {
      var url = Uri.parse("");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PostModel> _model =
            postModelFromJson(response.body) as List<PostModel>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
