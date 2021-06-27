import 'package:final_exam/model/todo.dart';
import 'package:final_exam/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/widget/todo_form_widget.dart';
import 'package:provider/provider.dart';


class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({Key key}) : super(key: key);

  @override
  _AddTodoWidgetState createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String todoTask = '';
  String taskDetails = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add todo'
          ),
          SizedBox(height: 8,),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedTaskDetails:(taskDetails) => setState(() => this.taskDetails = taskDetails),
            onChangedTodoTask: (todoTask) => setState(() => this.todoTask = todoTask),

            onSavedTodo: addTodo,
          )
        ],
      ),
    ),
  );

  void addTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid){
      return;
    }
    else{
      final todo = Todo(
          id: DateTime.now().toString(),
        title: title,
        todoTask: todoTask,
        taskDetails: taskDetails,
      );
      final provider = Provider.of<TodosProvider>(context,listen: false);
          provider.addTodo(todo);
      Navigator.of(context).pop();
    }

  }
}
