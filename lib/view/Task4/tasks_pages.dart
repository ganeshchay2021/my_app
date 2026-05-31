import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/task_controller.dart';
import 'package:my_app/routes/app_routes.dart';

class TasksPages extends StatefulWidget {
  const TasksPages({super.key});

  @override
  State<TasksPages> createState() => _TasksPagesState();
}

class _TasksPagesState extends State<TasksPages> {
  final controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 0,
        title: Text(
          'Task',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white, size: 28.sp),
            onPressed: () {
              Get.toNamed(AppRoutes.addUpdateTask);
            },
          ),
          Gap(8.w),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.todoList.isEmpty) {
          return Center(
            child: Text(
              'No tasks available. Please add a task.',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: controller.todoList.length,
            itemBuilder: (context, index) {
              final task = controller.todoList[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom Checkbox
                      // Custom Checkbox Container
                      Padding(
                        padding: const EdgeInsets.only(top: 2, right: 12),
                        child: SizedBox(
                          width: 22,

                          child: Checkbox(
                            value: task.isCompleted == 1 ? true : false,
                            activeColor: const Color(0xFF3A708E),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.isChecked.value = value;
                                Loader.show(context);
                                controller.toggle(
                                  task.id,
                                  controller.isChecked.value == true ? 1 : 0,
                                );
                                controller.getTasks();
                                Loader.hide();
                              }
                            },
                          ),
                        ),
                      ),
                      // Task details Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    task.title,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                _buildStatusBadge(task.isCompleted != 0),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              task.description,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date: ${task.date}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRoutes.addUpdateTask,
                                          arguments: task,
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20.sp,
                                        color: Colors.blue[400],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    IconButton(
                                      onPressed: () {
                                        Loader.show(context);
                                        controller.deleteTask(task.id);
                                        controller.getTasks();
                                        Loader.hide();
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 20.sp,
                                        color: Colors.red[400],
                                      ),
                                    ),
                                  ],
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
            },
          );
        }
      }),
    );
  }

  // Widget helper to match exact styling tags
  Widget _buildStatusBadge(bool isCompleted) {
    Color textColor = Colors.white;
    Color bgColor = isCompleted ? Colors.green.shade300 : Colors.red.shade300;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isCompleted ? "Completed" : "Not Completed",
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
