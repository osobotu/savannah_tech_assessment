import 'package:fetch_api/api/api.dart';
import 'package:fetch_api/api/models/models.dart';
import 'package:fetch_api/views/details.dart';
import 'package:flutter/material.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  List<Todo> todos = [];

  @override
  void initState() {
    _getTodos().then((value) {
      todos = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              title: Text(todo.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsView(
                      todo: todo,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

Future<List<Todo>> _getTodos() async {
  print('get todos called');
  return await ApiClient().fetchTodos();
}
