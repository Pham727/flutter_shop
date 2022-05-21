import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/model/todo.dart';
import 'package:todo_app_ui/provider/todos.dart';

import 'todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({ Key? key }) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey =GlobalKey<FormState>();
  String title ='';
  String description ='';
  @override
  Widget build(BuildContext context) =>AlertDialog(
     content:Form(
     key: _formKey,
     child: Column(
       mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        const Text("Add Todo",
         style: TextStyle(
           fontSize:22 ,
           fontWeight: FontWeight.bold),
         ),
        const SizedBox(height: 8,),
        TodoFormWidget(
           onChangedTitle: (title) =>setState(() {
             this.title = title;
           }),
           onChangedDescription: (description)=>setState(() {
             this.description =description;
           }),
           onSavedTodo: addTodo,

         )


       ]),
     )
  );
  void addTodo(){
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    else {
      final todo= Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now()
        );
      final provider = Provider.of<TodoProvider>(context,listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
    
  }
  
}