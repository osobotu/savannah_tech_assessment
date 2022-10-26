import 'package:fetch_api/api/models/models.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.todo});

  final Todo todo;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.todo.id.toString()),
            Text(widget.todo.title.toString()),
            Text(widget.todo.completed.toString()),
          ],
        ),
      ),
    );
  }
}
