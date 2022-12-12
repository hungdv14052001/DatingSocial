import 'package:dating_social_app/models/post.dart';
import 'package:dating_social_app/models/user.dart';
import 'package:dating_social_app/modules/homepage/providers/home_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeProvider provider = HomeProvider();
  var isLoading = true.obs;
  var postList = <Post>[].obs;
  var user = User().obs;
  @override
  void onInit() {
    super.onInit();
    getProfile();
    getPostListInHomePage();
  }

  void getProfile() async {
    try {
      isLoading.value = true;
      var result = await provider.getProfile();
      user.value = result;
      isLoading.value = false;
    } catch (ex) {
      throw ex;
    }
  }

  void getPostListInHomePage() async {
    try {
      isLoading.value = true;
      var result = await provider.getPostListInHomePage();
      postList.value = result;
      print(postList.toJson());
      isLoading.value = false;
    } catch (ex) {
      throw ex;
    }
  }
}
