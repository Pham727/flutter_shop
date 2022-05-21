import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget({
     this.title='',
     this.description='',
     required this.onChangedTitle,
     required this.onChangedDescription,
     required this.onSavedTodo,

     Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            TextFormField(
              maxLines: 1,
              initialValue: title,
              onChanged: onChangedTitle,
              validator: (title){
                if(title==''){
                  return 'The title cannot be empty';
                }
                else
                 return null;
              },
              decoration:const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 10,),
            //Nhap mo ta cho title
            TextFormField(
              initialValue: description,
              onChanged:onChangedDescription,
              maxLines: 3,
              decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'description',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child:  ElevatedButton(
              onPressed: onSavedTodo,
              child:const Text('Save'),
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(Colors.black),
              )
             ),
            ),
        ],
      ),      
    );
  }
}