import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui/model/todo.dart';

import '../db/database.dart';

class TodoProvider extends ChangeNotifier{
  List<Todo> _todos=[
    Todo(createdTime: 
    DateTime.now(),
     title: "Buy Food",
     description: '''
        -Eggs
        -milk
        -water
        -bread'''),
    Todo(createdTime:
     DateTime.now(),
     title: "plan family trip to Norway",
     description: '''
      -Rent some hotels
      -Rent a car
      -pack suitcase'''
     ),
     Todo(createdTime:
     DateTime.now(),
     title: "walk the dog",
     ),
     Todo(createdTime:
     DateTime.now(),
     title: "plan birthday party",
     )
  ];
  List<Todo> get todos =>_todos.where((todo) => todo.isDone ==false).toList();

  List<Todo> get todosComplete =>_todos.where((todo) => todo.isDone ==true).toList();

  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }
  void deleteTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo, String title, String des){
    todo.title = title;
    todo.description =des;
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo){
    todo.isDone =!todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
  var db =DatabaseConnect();
}