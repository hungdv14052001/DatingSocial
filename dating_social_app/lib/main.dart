import 'package:dating_social_app/main_app.dart';
import 'package:dating_social_app/models/user.dart';
import 'package:dating_social_app/modules/authenticate/views/login_page.dart';
import 'package:dating_social_app/modules/homepage/controllers/home_controller.dart';
import 'package:dating_social_app/providers/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final mainAppController = Get.put(MainAppController());
  isLogin = await mainAppController.GetWidgetByToken();
  runApp(const MyApp());
}

var isLogin = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: isLogin ? MainApp() : const LoginPage(),
    );
  }
}

class MainAppController extends GetxController {
  MainProvider mainProvider = MainProvider();
  var isLoading = true.obs;
  var checkToken = false.obs;
  var user = User().obs;
  @override
  void onInit() async {
    super.onInit();
  }

  Future<bool> GetWidgetByToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (token != null) {
        var result = await mainProvider.getProfile();
        user.value = result;
        print(this.user.value.avatar.toString());
        print(token);
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      throw ex;
    }
  }
}
