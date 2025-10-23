import 'package:flutter/material.dart';
import 'package:my_new_app/my_screens/singletodo_screen.dart';
import 'package:my_new_app/providers/themprovider.dart';
import 'package:my_new_app/providers/withprovider.dart';
import 'package:provider/provider.dart';

class AllTodosScreen extends StatefulWidget {
  const AllTodosScreen({Key? key}) : super(key: key);
  @override
  State<AllTodosScreen> createState() => _AllTodosScreenState();
}

class _AllTodosScreenState extends State<AllTodosScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();
    final themprovider = context.read<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.palette),
            tooltip: 'Switch to next theme Mode',
            onPressed: () => themprovider.nextTheme(),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "Todo App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.todos.length,
                  itemBuilder: (context, index) {
                    var singletodo = provider.todos[index];
                    return ListTile(
                      hoverColor: themprovider.currentTheme.primaryColor,
                      selectedColor:
                          themprovider.currentTheme.scaffoldBackgroundColor,
                      leading: Text(
                        '${index + 1}=>',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        singletodo.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        singletodo.date,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        singletodo.iScompleted ? "Completed" : "Pendeing",
                        style: TextStyle(
                          color: singletodo.iScompleted
                              ? const Color.fromARGB(255, 220, 247, 221)
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SingleTodoScreen(stodo: singletodo),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
