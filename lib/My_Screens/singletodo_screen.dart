import 'package:flutter/material.dart';
import 'package:my_new_app/models/todo.dart';
import 'package:my_new_app/my_screens/alltodos_screen.dart';
import 'package:my_new_app/providers/withprovider.dart';
import 'package:provider/provider.dart';

class SingleTodoScreen extends StatelessWidget {
  final Todo stodo;
  const SingleTodoScreen({super.key, required this.stodo});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    bool? isCHk = false;
    final updatedTodo = provider.todos.firstWhere(
      (t) => t.title == stodo.title,
      orElse: () => stodo,
    );

    return Scaffold(
      appBar: AppBar(title: Text(updatedTodo.title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              ListTile(
                leading: Checkbox(
                  value: updatedTodo.iScompleted,
                  onChanged: (_) {
                    provider.toggleCheck();
                    updatedTodo.iScompleted = provider.isCheck;
                    isCHk = provider.isCheck;
                  },
                ),
                title: Text(
                  updatedTodo.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  updatedTodo.date,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  stodo.iScompleted ? "Completed" : "Pending",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: updatedTodo.iScompleted
                        ? Colors.green
                        : Colors.orangeAccent,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: isCHk == false
                    ? () {
                        provider.update(stodo);
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
