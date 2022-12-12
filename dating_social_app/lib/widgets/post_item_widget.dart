import 'package:dating_social_app/common/api/api_client.dart';
import 'package:dating_social_app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 365,
        width: Get.width - 32,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            (baseAPI + post.avatar!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      height: 40,
                      width: Get.width - 134,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  post.name!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  '20p ago',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(post.title!),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: Get.width - 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(baseAPI + post.image!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: Get.width - 100,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.grey,
                    ),
                    Text(
                      post.numberLike!.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.chat,
                      size: 25,
                      color: Colors.grey,
                    ),
                    Text(
                      post.numberLike!.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.share,
                      size: 25,
                      color: Colors.grey,
                    ),
                    Text(
                      post.numberLike!.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
