// ignore_for_file: prefer_const_constructors,
//avoid_unnecessary_containers, unnecessary_import

import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 9.5,
        ),
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: realpurple,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 19,
            color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: realpurple,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
              //print('Clicked on delete icon');
            },
          ),
        ),
      ),
    );
  }
}
