import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_exam/todos_page.dart';
import 'package:final_exam/provider/todos.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage('To do App'),
    ),
  );

}

class LoginPage extends StatelessWidget {
  login(String username) {
    return username == this.loginUsername;
  }

  final String loginUsername = "login";
  final String title;
  final loginController = TextEditingController();

  LoginPage(this.title);

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset("lib/todo_logo.png",height: 100),
                  Container(
                    width: 250,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      controller: loginController,
                      decoration: InputDecoration(
                        fillColor: Color(0xff04a3a3),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 200,
                    height: 50,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xff04a3a3)),
                      ), onPressed: () {
                      if (this.login(loginController.text)) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TodosPage()));
                      }
                    },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
}
}







