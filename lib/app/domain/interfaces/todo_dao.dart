

import 'package:agenda_crud/app/domain/entities/todo.dart';

abstract class TodoDAO{

  save(Todo todo); 

  remove(dynamic id); 

  Future<List<Todo>> find();

}
