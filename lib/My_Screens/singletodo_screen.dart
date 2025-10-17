import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_new_app/Models/todo.dart';

class SingleTodoScreen extends StatefulWidget {
  final Todo todo;
  const SingleTodoScreen({super.key, required this.todo});

  @override
  State<SingleTodoScreen> createState() => _SingleTodoScreenState();
}

class _SingleTodoScreenState extends State<SingleTodoScreen> {
  bool? ischecked;
  void updatetodo() {
    setState(() {
      int i = todolist.indexWhere((t) => t.title == widget.todo.title);

      if (i != -1) {
        todolist[i] = Todo(
          title: widget.todo.title,
          date: widget.todo.date,
          iScompleted: ischecked! ? true : false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ischecked = widget.todo.iScompleted ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Sinlge Todo Screen",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                leading: Checkbox(
                  value: ischecked,
                  onChanged: (value) {
                    setState(() {
                      ischecked = value;
                      widget.todo.iScompleted = ischecked!;
                    });
                  },
                ),
                title: Text(
                  widget.todo.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.todo.date),
                trailing: Text(
                  widget.todo.iScompleted ? "Completed" : "Pending",
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 1,
                  minimumSize: Size(400, 40),
                ),
                onPressed: updatetodo,
                child: Text(
                  "Update",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
