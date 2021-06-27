import 'package:final_exam/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/provider/todos.dart';
import 'package:final_exam/widget/todo_form_widget.dart';
import 'package:provider/provider.dart';


class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key key, this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String todoTask;
  String taskDetails;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    todoTask = widget.todo.todoTask;
    taskDetails = widget.todo.taskDetails;
  }

  Widget build(BuildContext context) =>
      Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              todoTask: todoTask,
              taskDetails: taskDetails,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedTodoTask: (todoTask) =>
                  setState(() => this.todoTask = todoTask),
              onChangedTaskDetails: (taskDetails) =>
                  setState(() => this.taskDetails = taskDetails),
              onSavedTodo: saveTodo,

            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    }

    else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, todoTask, taskDetails);
      Navigator.of(context).pop();
    }
  }
}