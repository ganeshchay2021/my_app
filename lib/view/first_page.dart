import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/post_controller.dart';
import 'package:my_app/controller/task_controller.dart';
import 'package:my_app/routes/app_routes.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber.shade300,
        title: Text('Home View', style: TextStyle(fontSize: 20.h)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Page Design
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.bottomNavBar);
                },
                child: Text(
                  "Profile Page Design",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
              ),
            ),

            Gap(40.h),

            //login page
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: Text(
                  "Login Page",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
              ),
            ),

            Gap(40.h),

            //Api Integration
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.apiIntegration);
                  postController.fetchPost();
                },
                child: Text(
                  "API Integration",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
              ),
            ),

            Gap(40.h),

            //To-Do CRUD App
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                ),
                onPressed: () {
                  final taskController = Get.find<TaskController>();
                  taskController.getTasks();
                  Get.toNamed(AppRoutes.taskPage);
                },
                child: Text(
                  "To-Do CRUD",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
