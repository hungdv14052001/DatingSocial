import 'package:dating_social_app/common/api/api_client.dart';
import 'package:dating_social_app/common/utils/ultil.dart';
import 'package:dating_social_app/models/post.dart';
import 'package:dating_social_app/models/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider {
  static Dio _dio = Dio();

  Future<User> getProfile() async {
    late User user = User();

    try {
      // get token
      final prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString('token');
      // call api
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      var response = await _dio.get('${baseAPI}api/UserInformation/GetProfile?userId=1');
      var code = response.data["code"];
      if (code == 'Oke') {
        var data = response.data["data"];
        user = User.fromJson(data);
      } else {
        showToast(response.data["des"]);
        user = User();
      }
    } catch (e) {
      user = User();
      print(e);
    }
    return user;
  }

  Future<List<Post>> getPostListInHomePage() async {
    late List<Post> postList = <Post>[];

    try {
      // get token
      final prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString('token');
      // call api
      _dio.options.headers["Authorization"] = "Bearer ${token}";
      var response = await _dio.get('${baseAPI}api/UserHandle/GetPostListInHomePage');
      var code = response.data["code"];
      if (code == 'Oke') {
        var data = response.data["data"] as List;
        postList = data.map((post) => Post.fromJson(post)).toList();
      } else {
        showToast(response.data["des"]);
        // user = User();
      }
    } catch (e) {
      postList = [];
      print(e);
    }
    return postList;
  }
}
