import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/provider/todos.dart';

import './page/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static final String title ='Todo App';

  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
      create: (context)=> TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.pink,
          scaffoldBackgroundColor:const Color(0xFFf6ff5ee),

        ),
        home: HomePage(),
        
      ),
    );

}