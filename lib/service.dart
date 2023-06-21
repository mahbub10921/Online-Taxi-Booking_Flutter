import 'dart:developer';

import 'package:first_flutter_project/Model/PostModel.dart';
import 'package:http/http.dart' as http;
import '';
import 'Model/route.dart';

class ApiService {
  Future<void> deletePosts(int? id) async {
    try {
      var url = Uri.parse('http://192.168.20.38:8080/api/posts/' + '${id}');
      var response = await http.delete(url);

      // Response res = await delete('$apiUrl/$id');

      if (response.statusCode == 200) {
        print("Case deleted");
      } else {
        throw "Failed to delete a case.";
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Route1>?> getPosts2() async {
    try {
      var url = Uri.parse('http://192.168.20.45:8080/api/route');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Route1> _model2 = postsFromJson2(response.body) as List<Route1>;
        return _model2;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<PostModel>?> getPosts() async {
    try {
      var url = Uri.parse('http://192.168.20.38:8080/api/posts');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PostModel> _model =
            postsFromJson(response.body) as List<PostModel>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
