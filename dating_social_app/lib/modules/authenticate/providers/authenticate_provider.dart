import 'package:dating_social_app/common/api/api_client.dart';
import 'package:dating_social_app/common/utils/ultil.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticateProvider {
  static Dio dio = Dio();

  Future<bool> userLogin(String username, String password) async {
    try{
      var response = await dio.post('${baseAPI}api/UserAuthenticate/UserLogin', data: {'username': username, 'password': password});
      var code = response.data["code"];
      if(code == 'Oke'){
        var token = response.data["data"]["token"];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return true;
      }
      else{
        showToast(response.data["des"]);
        return false;
      }
    }
    catch(e){
      return false;
    }
  }
}