import 'package:flutter/material.dart';
import "package:todo_app/models.dart";
import 'package:provider/provider.dart';

// https://medium.com/the-web-tub/making-a-todo-app-with-flutter-5c63dab88190
class WidgetTodoList extends StatelessWidget {
  const WidgetTodoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoTask = Provider.of<TodoTask>(context);

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          child: CheckboxListTile(
            value: todoTask.todos[index].checked,
            title: Text(
              todoTask.todos[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: todoTask.todos[index].checked
                    ? TextDecoration.lineThrough
                    : null,
                color:
                    todoTask.todos[index].checked ? Colors.grey : Colors.black,
              ),
            ),
            secondary: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => todoTask.deleteTask(index),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool val) => todoTask.toggleCheckFlg(index, val),
          ),
        );
      },
      itemCount: todoTask.todos.length,
    );
  }
}
