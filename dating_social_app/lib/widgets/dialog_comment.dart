import 'package:dating_social_app/widgets/base_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogComment extends StatefulWidget {
  const DialogComment({
    Key? key,
    required this.numberLike,
    required this.postId,
  }) : super(key: key);
  final int numberLike;
  final int postId;

  @override
  State<DialogComment> createState() => _DialogComment();
}

class _DialogComment extends State<DialogComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              width: Get.width * 0.95,
              height: Get.height * 0.95 - 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.numberLike.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.95 - 120,
                    width: Get.width * 0.9 - 15,
                  ),
                  Container(
                    height: 1,
                    width: Get.width * 0.9 - 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseInput(
                        height: 40,
                        width: Get.width * 0.95 - 70,
                        hintText: 'Bình luận ...',
                        backgroundColor: Color.fromRGBO(240, 242, 245, 1),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.send,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
