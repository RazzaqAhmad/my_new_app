import 'package:flutter/material.dart';
import 'package:my_new_app/models/todo.dart';
import 'package:my_new_app/providers/withprovider.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    void _pickDate() async {
      DateTime now = DateTime.now();
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year - 5),
        lastDate: DateTime(now.year + 5),
      );

      if (picked != null) {
        selectedDate = picked.toString().split(' ')[0];
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: selectedDate ?? 'Select a date',
              ),
              onTap: _pickDate,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                provider.addTodo(
                  Todo(
                    title: _titleController.text,
                    date:
                        selectedDate ?? DateTime.now().toString().split(' ')[0],
                    iScompleted: false,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
