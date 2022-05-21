import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui/model/todo.dart';
import 'package:todo_app_ui/provider/todos.dart';

import '../page/edit_todo_page.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({
     required this.todo,
     Key? key 
     }) : super(key: key);


  @override
  Widget build(BuildContext context) =>
  ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Slidable(
      key: Key(todo.id),
     startActionPane: ActionPane(
      // A motion is a widget used to control how the pane animates.
      motion: const DrawerMotion(),
      // A pane can dismiss the Slidable.
      dismissible: DismissiblePane(onDismissed: () {}),
      // All actions are defined in the children parameter.
      children: [
        // A SlidableAction can have an icon and/or a label.
        SlidableAction(
           onPressed: (context) {
                   Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> EditTodoPage(todo: todo)
                    ));
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'edit',
        ),
        
      ],
    ),
    endActionPane:  ActionPane(
                  motion: DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed:(context){
                        final provider =Provider.of<TodoProvider>(context,listen: false);
                          provider.deleteTodo(todo);
                          Utils.showSnackBar(context,'Delete the task');

                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
    
      child: buildTodo(context),
    ),
  );

  Widget buildTodo (BuildContext context) {
    return GestureDetector(
      onTap: () =>editTodo(context, todo),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
            value: todo.isDone,
            onChanged: (_){
              final provider = Provider.of<TodoProvider>(context,listen: false);
              final isDone = provider.toggleTodoStatus(todo);
              Utils.showSnackBar(context,
              isDone? 'Tash Completed':'Task marked incomplete');
            },
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            ),
            const SizedBox(width: 22,),
            Expanded(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                  ),
                  if(todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              )
            )
          ],
        ),
      ),
    );
    
  }
void delete(BuildContext context, Todo todo) {
  final provider =Provider.of<TodoProvider>(context,listen: false);
  provider.deleteTodo(todo);
  Utils.showSnackBar(context,'Delete the task');
}

void editTodo(BuildContext context, Todo todo)=>Navigator.push(context,
  MaterialPageRoute(builder: (context)=> EditTodoPage(todo: todo)
  ),
 );

}

void doNothing(BuildContext context){

}
