import 'package:dating_social_app/modules/authenticate/views/login_page.dart';
import 'package:dating_social_app/modules/authenticate/widgets/authenticate_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
              hintText: 'Numberphone or email',
              controller: null,
            ),
            const SizedBox(
              height: 10,
            ),
            AuthenticateInput(
              height: 46,
              width: Get.width * 0.75,
              backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
              hintText: 'Full name',
              controller: null,
            ),
            const SizedBox(
              height: 10,
            ),
            AuthenticateInput(
              height: 46,
              width: Get.width * 0.75,
              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
              hintText: 'Password',
              controller: null,
              isPassword: true,
            ),
            const SizedBox(
              height: 10,
            ),
            AuthenticateInput(
              height: 46,
              width: Get.width * 0.75,
              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
              hintText: 'Confirm password',
              controller: null,
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 46,
                width: Get.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromRGBO(0, 149, 246, 1),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Register',
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
                  const Text('Do you already have account? '),
                  InkWell(
                    onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(121, 27, 247, 1),
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
