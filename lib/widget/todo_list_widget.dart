import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/provider/todos.dart';
import 'package:todo_app_ui/widget/todo_widget.dart';
import '../db/database.dart';

class TodoListWidget extends StatelessWidget {
  final db = DatabaseConnect();
  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<TodoProvider>(context);
    final todos =provider.todos;
    return todos.isEmpty
    ? Center(
      child:  Text('Not todos',
      style: TextStyle(fontSize: 30,),),
    ):
    ListView.separated(
      padding: EdgeInsets.all(5),
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context,index)=>Container(height: 8,),
      itemCount: todos.length,
      itemBuilder: (context,index){
          final todo =todos[index];
          return TodoWidget(todo: todo,);
      },

    );
    
  }
}