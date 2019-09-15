import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class Task {
  final String name;

  Task({
    @required this.name,
  }) : assert(name != null);

  bool checked = false;
  bool trash = false;
}

class TodoTask with ChangeNotifier {
  List<Task> _todos = [];
  List<Task> get todos => _todos;

  void addTask(String inputedTask) {
    Task task = new Task(name: inputedTask);
    _todos.add(task);
    notifyListeners();
  }

  void toggleCheckFlg(int index, bool checkBoxVal) {
    _todos[index].checked = checkBoxVal;
    notifyListeners();
  }

  void deleteTask(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
