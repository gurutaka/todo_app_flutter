import 'package:flutter/material.dart';
import "package:todo_app/widgets/addTask.dart";
import "package:todo_app/widgets/todoListView.dart";
import "package:todo_app/models.dart";
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<TodoTask>(
        builder: (_) => TodoTask(),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Todo App"),
            ),
          ),
          body: WidgetTodoList(),
          floatingActionButton: WidgetAddTask(),
        ),
      ),
    );
  }
}
