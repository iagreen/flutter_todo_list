import 'package:flutter/material.dart';
import 'package:flutter_todo_list/add_task_widget.dart';
import 'package:flutter_todo_list/store.dart';
import 'package:flutter_todo_list/task_list_item.dart';
import 'package:flutter_todo_list/todo_model.dart';

class ToDoList extends StatelessWidget {
  final Store store;
  final void Function() onLogout;
  static const tableName = 'todos';

  const ToDoList({Key? key, required this.store, required this.onLogout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 560,
      height: 800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Todo List.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
            ),
          ),
          AddTask(
            onAdd: (task) {
              if (task.length < 4) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Task must be at least four characters'),
                  backgroundColor: Colors.red,
                ));
              }
              store.insert(
                  tableName, ToDo(task: task, isComplete: false).toMap());
            },
          ),
          Expanded(
              child: StreamBuilder<List<ToDo>>(
                  stream: store.getStream(tableName, ToDo.fromJson),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ToDo>> snapshot) {
                    final todos = snapshot.data ?? [];
                    return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final todo = todos[index];
                          return TaskListItem(
                            todo: todo,
                            onPressed: () {
                              store.delete(tableName, todo.toMap());
                            },
                            onChecked: (value) {
                              store.update(tableName,
                                  todo.copyWith(isComplete: value).toMap());
                            },
                          );
                        });
                  })),
          SizedBox(
              width: double.infinity,
              child: _logoutButton()
          )
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return TextButton(
      onPressed: this.onLogout,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Logout'),
      ),
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          textStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    );
  }
}
