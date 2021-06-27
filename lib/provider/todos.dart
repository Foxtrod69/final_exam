import 'package:final_exam/api/firebase_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_exam/model/todo.dart';

class TodosProvider extends ChangeNotifier{
   List<Todo> _todos =[

   ];

   List<Todo> get todos => _todos.where((todo) => todo.isDone == false ).toList();

   List<Todo> get todosCompleted =>
       _todos.where((todo) => todo.isDone == true).toList();


   void setTodos(List<Todo> todos) =>
   WidgetsBinding.instance.addPostFrameCallback((_) {
     _todos = todos;
     notifyListeners();
   });

   void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

   void removeTodo(Todo todo) => FirebaseApi.deleteTodo(todo);

   bool todoStatus(Todo todo){
     todo.isDone = !todo.isDone;
     FirebaseApi.updateTodo(todo);
     return todo.isDone;
   }

   void updateTodo(Todo todo, String title, String todoTask, String taskDetails){
     todo.title = title;
     todo.todoTask = todoTask;
     todo.taskDetails = taskDetails;

     FirebaseApi.updateTodo(todo);

   }
}