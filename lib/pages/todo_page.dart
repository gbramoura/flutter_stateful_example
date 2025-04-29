import 'package:flutter/material.dart';
import 'package:flutter_stateful_example/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _todos = [];
  final TextEditingController textController = TextEditingController();

  void _handleAddTask() {
    if (textController.text.isNotEmpty) {
      var newTodo = Todo(
        id: DateTime.now().toString(),
        title: textController.text,
        isDone: false,
      );

      setState(() {
        _todos.add(newTodo);
      });

      textController.clear();

      Navigator.of(context).pop();
    }
  }

  void _handleChangeTask(String id, bool value) {
    setState(() {
      var todo = _todos.where((e) => e.id == id).first;
      todo.isDone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO List"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (ctx, index) {
            final task = _todos[index];
            return _renderTodoTile(
              title: task.title,
              isDone: task.isDone,
              onChanged: (value) {
                _handleChangeTask(task.id, value ?? false);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _renderAddTaskDialog(),
      ),
    );
  }

  _renderTodoTile({
    required String title,
    required bool isDone,
    required void Function(bool?)? onChanged,
  }) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }

  _renderAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New TODO'),
          content: TextField(
            controller: textController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: 'Describe your todo',
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: _handleAddTask,
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
