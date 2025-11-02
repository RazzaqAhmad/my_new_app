import 'package:flutter/material.dart';
import 'package:my_new_app/models/todo.dart';
import 'package:my_new_app/my_screens/addtodoscreen.dart';
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
      appBar: AppBar(
        title: Text(updatedTodo.title),
        backgroundColor: Colors.green,
      ),
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
                  updatedTodo.iScompleted ? "Completed" : "Pending",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: updatedTodo.iScompleted
                        ? Colors.green
                        : Colors.orangeAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isCHk == false
                    ? () {
                        provider.update(stodo);
                        Navigator.of(context).pop();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Welcome, ${updatedTodo.title}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      // ✅ Floating buttons for Add and Delete
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              heroTag: "deleteBtn",
              backgroundColor: Colors.redAccent,
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
              onPressed: () {
                provider.removeTodo(stodo);
                Navigator.pop(context);
              },
            ),
            FloatingActionButton.extended(
              heroTag: "addBtn",
              backgroundColor: Colors.green,
              icon: const Icon(Icons.add),
              label: const Text("Add"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTodoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
