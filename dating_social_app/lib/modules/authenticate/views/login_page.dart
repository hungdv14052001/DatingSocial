import 'package:dating_social_app/common/utils/ultil.dart';
import 'package:dating_social_app/main_app.dart';
import 'package:dating_social_app/modules/authenticate/controllers/authenticate_controller.dart';
import 'package:dating_social_app/modules/authenticate/views/register_page.dart';
import 'package:dating_social_app/modules/authenticate/widgets/authenticate_input.dart';
import 'package:dating_social_app/modules/homepage/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authenticateController = Get.put(AuthenticateController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.25,
            ),
            const Text(
              'Dating Social',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            AuthenticateInput(
              height: 46,
              width: Get.width * 0.75,
              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
              hintText: 'Username or email',
              controller: authenticateController.controllerUsername,
            ),
            const SizedBox(
              height: 10,
            ),
            AuthenticateInput(
              height: 46,
              width: Get.width * 0.75,
              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
              hintText: 'Password',
              controller: authenticateController.controllerPassword,
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                var username = authenticateController.controllerUsername.text;
                var password = authenticateController.controllerPassword.text;
                if (username.isEmpty || password.isEmpty) {
                  showToast('Enter full login information , please!');
                  return;
                }

                showLoading(context);
                var result =
                    await authenticateController.userLogin(username, password);
                print('rs: ' + result.toString());
                await Get.put(HomeController());
                // ignore: unrelated_type_equality_checks
                if (result) {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainApp(),
                    ),
                  );
                }
                closeLoading(context);
              },
              child: Container(
                height: 46,
                width: Get.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(121, 27, 247, 1),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You don\'t have account? '),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 149, 246, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
