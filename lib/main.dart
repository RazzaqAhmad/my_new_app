import 'package:flutter/material.dart';
import 'package:my_new_app/My_Screens/alltodos_screen.dart';
import 'package:my_new_app/providers/themprovider.dart';
import 'package:my_new_app/providers/withprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo + Theme Provider',
      theme: themeProvider.currentTheme,
      home: const AllTodosScreen(),
    );
  }
}
