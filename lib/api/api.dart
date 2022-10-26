import 'dart:convert';

import 'package:fetch_api/api/models/models.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const baseUrl = 'jsonplaceholder.typicode.com';

// https://jsonplaceholder.typicode.com/todos
  // Fetches todos
  Future<List<Todo>> fetchTodos([int id = 0]) async {
    print('fetch called ');
    String path = 'todos';
    if (id != 0) {
      path = 'todos/$id';
    }
    final requestUri = Uri.https(baseUrl, path);
    final response = await _httpClient.get(requestUri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      List<Todo> todos = [];
      print(data.length);

      for (var item in data) {
        final todo = Todo.fromMap(item);

        todos.add(todo);
      }

      return todos;
    }

    return [];
  }
}
