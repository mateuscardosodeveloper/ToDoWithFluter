import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:agenda_crud/app/domain/services/todo_service.dart';
import 'package:agenda_crud/app/view/todo_details_back.dart';
import 'package:flutter/material.dart';

class TodoDetails extends StatelessWidget {
  final a = TodoService();

  Widget build(BuildContext context) {
    var _back = TodoDetailsBack(context);
    Todo todo = _back.todo;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Detalhe da Tarefa'),
          ),
          body: ListView(
            padding: EdgeInsets.all(40),
            children: [
              Center(
                child: Text(
                  '${todo.title}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('description:'),
                  subtitle: Text('${todo.description}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
