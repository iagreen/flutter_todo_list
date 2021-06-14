import 'package:flutter/material.dart';
import 'package:flutter_todo_list/todo_model.dart';

class TaskListItem extends StatelessWidget {
  final ToDo todo;
  final void Function() onPressed;
  final void Function(bool?) onChecked;

  const TaskListItem(
      {Key? key,
      required this.todo,
      required this.onPressed,
      required this.onChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.task,
        style: TextStyle(
            decoration: todo.isComplete ?? false
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: IntrinsicWidth(
        child: Row(
          children: [
            Checkbox(value: todo.isComplete, onChanged: onChecked),
            IconButton(icon: Icon(Icons.delete), onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
