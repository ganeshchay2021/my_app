import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/task_controller.dart';
import 'package:my_app/model/task_model.dart';
import 'package:my_app/view/Task2/widgets/common_text_field.dart';

class AddUpdateTasks extends GetView<TaskController> {
  final TaskModel? task;

  AddUpdateTasks({super.key, this.task});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      controller.titleCtrl.text = task!.title;
      controller.descriptionCtrl.text = task!.description;
    }
    return PopScope(
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          controller.clear();
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Text("Task"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Gap(40.h),
                    CommonTextField(
                      textFieldController: controller.titleCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is Empty';
                        }
                        return null;
                      },
                      labelTxt: "Title",
                      hintTxt: "Choose Title",
                      textInputType: TextInputType.text,
                    ),

                    Gap(40.h),

                    CommonTextField(
                      maxLine: 5,
                      textFieldController: controller.descriptionCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description is Empty';
                        }
                        return null;
                      },
                      labelTxt: "Description",
                      hintTxt: "write something",
                      textInputType: TextInputType.text,
                    ),

                    Gap(80.h),
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Loader.show(
                              context,
                              progressIndicator: LinearProgressIndicator(),
                            );
                            if (task == null) {
                              controller.addTask();
                              controller.getTasks();
                              controller.clear();
                            } else {
                              controller.updateTask(task!.id);
                              controller.getTasks();
                              controller.clear();
                            }
                            Loader.hide();
                            Get.back();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A61D1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
