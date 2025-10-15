import 'package:flutter/material.dart';
import 'package:my_new_app/Models/todo.dart';
import 'package:my_new_app/My_Screens/alltodos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AllTodosScreen(),
    );
  }
}
