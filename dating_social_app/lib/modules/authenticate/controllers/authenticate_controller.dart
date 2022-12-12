import 'package:dating_social_app/common/utils/ultil.dart';
import 'package:dating_social_app/modules/authenticate/providers/authenticate_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticateController extends GetxController{
  AuthenticateProvider provider = AuthenticateProvider();
  var isLoading = true.obs;
  var controllerUsername = TextEditingController();
  var controllerPassword = TextEditingController();
  var isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> userLogin(String username, String password) async {
    try {
      var result = await provider.userLogin(username, password);
      isLogin = result.obs;
      if(result){
        showToast('Login successful!');
        final prefs = await SharedPreferences.getInstance();
        var token = await prefs.getString('token');
        print(token);
      }
      return result;
    } catch (ex) {
      throw ex;
    }
  }

}