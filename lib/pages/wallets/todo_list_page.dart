import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'package:todo_app/models/ModelProvider.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  Future<List<TodoApp>> readFromDatabase() async {
    final todos = await Amplify.DataStore.query(TodoApp.classType);
    return todos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: FutureBuilder<List<TodoApp>>(
        future: readFromDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final attributes = snapshot.data!;
            return ListView.builder(
              itemCount: attributes.length,
              itemBuilder: (context, index) {
                final attribute = attributes[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      attribute.id,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(attribute.userId),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            return const Text('Carregando...');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Container()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
