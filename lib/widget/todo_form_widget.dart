import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {

  final String title;
  final String todoTask;
  final String taskDetails;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedTodoTask;
  final ValueChanged<String> onChangedTaskDetails;
  final VoidCallback onSavedTodo;
  const TodoFormWidget({Key key, this.title =  '', this.todoTask = '', this.taskDetails = '', this.onChangedTitle, this.onChangedTodoTask, this.onChangedTaskDetails, this.onSavedTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) =>SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          SizedBox(height: 5,),
          buildTask(),
          SizedBox(height: 5,),
          buildTaskDetails(),
          SizedBox(height: 10,),
          buildButton(),
        ],
      ),
  );



 Widget buildTitle() => TextFormField(
   maxLines: 1,
   initialValue: title,
   onChanged: onChangedTitle,
   validator: (title){
     if (title.isEmpty){
       return 'Please fill in the title';
     }
     return null;
 },

   decoration: InputDecoration(
     border: UnderlineInputBorder(
     ),
     hintText: 'Please enter title'
   ),
 );

 Widget buildTask() => TextFormField(
   maxLines: 1,
   initialValue: todoTask,
   onChanged: onChangedTodoTask,
   decoration: InputDecoration(
     border: UnderlineInputBorder(),
     hintText: 'Please enter task'
   ),
 );

  Widget buildTaskDetails() => TextFormField(
    maxLines: 1,
    initialValue: taskDetails,
    onChanged: onChangedTaskDetails,
    decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Please enter task details',
    ),
  );

  Widget buildButton() => SizedBox(
    width: 100,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white)
      ), onPressed: onSavedTodo,
      child: Text('Submit',style: TextStyle(color: Color(0xff04a3a3)),),
    ),
  );

}
