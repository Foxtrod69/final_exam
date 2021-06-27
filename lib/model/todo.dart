import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  String todoTask;
  String id;
  String taskDetails;
  bool isDone;

  Todo({
    @required this.title,
    this.todoTask,
    this.id,
    this.taskDetails,
    this.isDone = false
});

  static Todo fromJson(Map<String, dynamic> json) => Todo(
    title: json['title'],
    todoTask: json['todoTask'],
    id: json['id'],
    taskDetails: json['taskDetails'],
    isDone: json['isDone']
  );

  Map<String, dynamic> toJson() => {
        'title':title,
    'todoTask':todoTask,
    'id':id,
    'taskDetails':taskDetails,
    'isDone':isDone,

  };

}