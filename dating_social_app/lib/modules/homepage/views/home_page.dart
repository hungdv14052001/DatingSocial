import 'package:dating_social_app/common/api/api_client.dart';
import 'package:dating_social_app/main.dart';
import 'package:dating_social_app/modules/homepage/controllers/home_controller.dart';
import 'package:dating_social_app/widgets/post_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    var mainAppController = Get.put(MainAppController());

    return Scaffold(
      backgroundColor: const Color.fromRGBO(121, 27, 247, 1),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                const SizedBox(
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dating Social',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 46,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: Get.width - 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: const Color.fromRGBO(121, 27, 247, 1),
                          image: DecorationImage(
                            image: NetworkImage(
                              (baseAPI + mainAppController.user.value.avatar!),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 34,
                          width: Get.width - 182,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('What are you thinking?'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          height: 46,
                          width: 46,
                          child: Icon(
                            Icons.image,
                            size: 27,
                            color: Color.fromRGBO(121, 27, 247, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height - 214,
                  child: Obx(() {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: List.generate(
                              homeController.postList.length,
                              (index) => PostItemWidget(
                                post: homeController.postList[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
