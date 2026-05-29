import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/post_controller.dart';

class ApiIntegration extends GetView<PostController> {
  const ApiIntegration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts'), elevation: 0),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.getPost.isEmpty) {
          return Center(child: Text("Somthing went wrong..!"));
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final post = controller.getPost[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                        leading: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4A61D1),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${post.id}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        // FIX 2: Dynamically bind the true incoming API string keys
                        title: Text(
                          "${post.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: const Color(0xFF1E293B),
                          ),
                        ),

                        subtitle: Text(
                          "${post.body}",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(5.h);
                },
                itemCount: controller.getPost.length,
              ),
            ),
          );
        }
      }),
    );
  }
}
