import 'package:get/get.dart';
import 'package:my_app/controller/botton_navbar_controller.dart';
import 'package:my_app/controller/login_controller.dart';
import 'package:my_app/controller/post_controller.dart';
import 'package:my_app/controller/task_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<BottonNavbarController>(BottonNavbarController(), permanent: false);
    Get.put<LoginController>(LoginController(), permanent: false);
    Get.put<PostController>(PostController(), permanent: false);
    Get.put<TaskController>(TaskController(), permanent: false);

  }
}
