import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_app/model/post_model.dart';
import 'package:my_app/services/posts_services.dart';

class PostController extends GetxController {
  var getPost = <PostsModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchPost() async {
    try {
      isLoading.value = true;
      final response = await PostsServices.getPosts();

      if (response.statusCode == 200) {
        final dataList = response.data as List; // Explicit cast
        final result = dataList.map((e) => PostsModel.fromJson(e)).toList();

        getPost.value = result;
      }
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          "Error",
          "Something went wrong",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
