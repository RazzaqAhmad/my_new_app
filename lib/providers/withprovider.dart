import 'package:flutter/material.dart';
import 'package:my_new_app/models/todo.dart';
import 'package:my_new_app/providers/withprovider.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = todolist;
  List<Todo> get todos => _todos;
  bool _isCheck = false;

  bool get isCheck => _isCheck;

  void update(Todo todo) {
    int index = _todos.indexWhere((t) => t.title == todo.title);
    _todos[index].iScompleted = _isCheck;
    notifyListeners();
  }

  void toggleCheck() {
    _isCheck = !_isCheck;
    notifyListeners();
  }
}
