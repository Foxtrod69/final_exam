import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_exam/model/todo.dart';
import 'package:final_exam/provider/todos.dart';
import 'package:final_exam/widget/todo_widget.dart';


class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;


    return todos.isEmpty
        ? Center(
      child: Text(
        'No todos.',
        style: TextStyle(fontSize: 25),
      ),
    )
        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(15),
      separatorBuilder: (context, index) => Container(height: 12),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return TodoWidget(todo: todo);
      },
    );
  }
}



// return ListView.builder(
// itemCount: todos.length,
// itemBuilder: (context, index){
// final todo = todos[index];
//
// return TodoWidget(todo: todo,);
// },
// ); for backup
