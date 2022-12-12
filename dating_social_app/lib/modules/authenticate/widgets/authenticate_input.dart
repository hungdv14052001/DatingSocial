import 'package:flutter/material.dart';

class AuthenticateInput extends StatelessWidget {
  AuthenticateInput({
    Key? key,
    required this.width,
    required this.height,
    this.backgroundColor,
    this.hintText,
    this.controller,
    this.isPassword,
  }) : super(key: key);

  final double width;
  final double height;
  Color? backgroundColor;
  String? hintText;
  bool? isPassword;
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // ignore: sort_child_properties_last
      child: Row(
        children: [
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: SizedBox(
              height: width,
              child: TextField(
                obscureText: isPassword ?? false,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
          )),
    );
  }
}
