import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {Key? key,
      required this.todo0,
      required this.onDeleteItem,
      required this.onToDoChanged})
      : super(key: key);
  final ToDo todo0;
  final onToDoChanged;
  final onDeleteItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo0);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo0.isDone! ? Icons.check_box_outline_blank : Icons.check_box,
          color: tdBlue,
        ),
        title: Text(
          '${todo0.todoText!}',
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo0.isDone!
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
              onPressed: () {
                print('deleted');
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
                size: 18,
              )),
        ),
      ),
    );
  }
}
