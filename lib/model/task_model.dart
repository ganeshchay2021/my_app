import 'package:intl/intl.dart';

class TaskModel {
  int id;
  String title;
  String description;
  String date;
  int isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    DateTime parsedDate = DateTime.parse(json["createDate"]);

    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
    return TaskModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      date: formattedDate,
      isCompleted: json["isCompleted"],
    );
  }
}
