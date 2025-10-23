import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/themprovider.dart';
import 'My_Screens/alltodos_screen.dart';
import 'providers/withprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Todo Multi-Theme',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      home: const AllTodosScreen(),
    );
  }
}
