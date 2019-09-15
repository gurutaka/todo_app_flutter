import 'package:flutter/material.dart';
import "package:todo_app/models.dart";
import 'package:provider/provider.dart';

// https://medium.com/the-web-tub/making-a-todo-app-with-flutter-5c63dab88190
class WidgetAddTask extends StatelessWidget {
  const WidgetAddTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputTask = Provider.of<TodoTask>(context, listen: false);

    Widget getInputTaskPage() {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Add a new task'),
        ),
        body: new TextField(
          autofocus: true,
          onSubmitted: (val) {
            inputTask.addTask(val);
            Navigator.pop(context); // Close the add todo screen
          },
          decoration: new InputDecoration(
            hintText: 'Enter something to do...',
            contentPadding: const EdgeInsets.all(16.0),
          ),
        ),
      );
    }

    void _pushAddTodoScreen() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (_) => getInputTaskPage(),
        ),
      );
    }

    return FloatingActionButton(
      onPressed: _pushAddTodoScreen,
      child: Icon(Icons.add),
    );
  }
}
