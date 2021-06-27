import 'package:final_exam/widget/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_exam/provider/todos.dart';


class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;


    return todos.isEmpty
        ? Center(
      child: Text(
        'No tasks completed.',
        style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 12),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return TodoWidget(todo: todo);
      },
    );
  }
  }
