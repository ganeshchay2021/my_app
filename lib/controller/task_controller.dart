import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/task_model.dart';
import 'package:my_app/services/database_services.dart';

class TaskController extends GetxController {
  var todoList = <TaskModel>[].obs;

  RxBool isChecked = false.obs;

  RxBool isLoading = false.obs;

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();

  DatabaseServices databaseServices = DatabaseServices.databaseInstance;

  void clear() {
    titleCtrl.clear();
    descriptionCtrl.clear();
  }

  Future<void> addTask() async {
    try {
      bool isAdded = await databaseServices.addTodo(
        title: titleCtrl.text,
        description: descriptionCtrl.text,
        createDate: DateTime.now().toString(),
        isCompleted: 0,
      );
      if (isAdded) {
        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "Success",
          "Task added successfully",
        );
      } else {
        Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "Error",
          "Failed to add task",
        );
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        "Error",
        "Failed to add task",
      );
    }
  }

  Future<List<TaskModel>> getTasks() async {
    isLoading.value = true;
    try {
      var tasks = await databaseServices.getTasks();
      final result = tasks.map((task) => TaskModel.fromJson(task)).toList();
      todoList.value = result;
      return result;
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        "Error",
        "Failed to fetch tasks",
      );
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTask(int id) async {
    try {
      bool isUpdated = await databaseServices.updateTask(
        id,
        titleCtrl.text,
        descriptionCtrl.text,
      );
      if (isUpdated) {
        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "Success",
          "Task updated successfully",
        );
      } else {
        Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "Error",
          "Failed to update task",
        );
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        "Error",
        "Failed to update task",
      );
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      bool isDeleted = await databaseServices.deleteTodo(id);
      if (isDeleted) {
        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "Success",
          "Task updated successfully",
        );
      } else {
        Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "Error",
          "Failed to update task",
        );
      }
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        "Error",
        "Failed to Delete task",
      );
    }
  }

  Future<void> toggle(int id, int isComplete) async {
    try {
      await databaseServices.toggle(id, isComplete);
    } catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        "Error",
        "Failed to Delete task",
      );
    }
  }
}
