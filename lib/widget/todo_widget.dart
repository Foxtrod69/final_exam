import 'package:final_exam/edit_todo_page.dart';
import 'package:final_exam/provider/todos.dart';
import 'package:final_exam/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:final_exam/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;


  const TodoWidget({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      key:Key(todo.id),
      actions: [
        IconSlideAction(
          color: Color(0xff04a3a3),
          onTap: () => editTodo(context, todo),
          caption: 'Edit Todo',
          icon: Icons.edit,
        )
      ],

      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          onTap: () => deleteTodo(context, todo),
          caption: 'Remove Todo',
          icon: Icons.delete,
        )
      ],


      child:buildTodo(context),
         ),
  );
      Widget buildTodo(BuildContext context) =>  GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
    padding: EdgeInsets.all(20),
    child: Row(
        children: [
          Checkbox(
            activeColor: Color(0xff04a3a3),
            checkColor: Colors.white,
            value: todo.isDone,
            onChanged: (_){
              final provider = Provider.of<TodosProvider>(context, listen: false);
              final isDone = provider.todoStatus(todo);
              
              Utils.showSnackBar(
                context,
                isDone ? 'Task Successfully completed' : 'Task incomplete',
              );
            },
          ),
          SizedBox(width: 5 ,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              if (todo.todoTask.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    todo.todoTask
                  ),
                ),
              if (todo.taskDetails.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                      todo.taskDetails
                  ),
                ),
            ],
          )),
        ],
    ),
  ),
      );

 void deleteTodo(BuildContext context, Todo todo){
   final provider = Provider.of<TodosProvider>(context,listen: false);
   provider.removeTodo(todo);

   Utils.showSnackBar(context, 'Task was successfully deleted');
 }


 void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
   MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo),),
 );

}
