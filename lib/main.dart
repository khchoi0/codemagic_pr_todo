import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My TODO list',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const ToDoListPage(
        todos: ['1. Do something useful', '2. Eat a snack', '3. Have a rest'],
      ),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  final List<String> todos;

  const ToDoListPage({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<String> _todos = [];

  @override
  void initState() {
    super.initState();
    _todos.addAll(widget.todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO today'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(_todos[index]),
        ),
        itemCount: _todos.length,
        padding: const EdgeInsets.symmetric(vertical: 32),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    setState(() {
      _todos.add('${_todos.length + 1}. A new task');
    });
  }
}
