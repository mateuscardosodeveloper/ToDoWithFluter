import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:agenda_crud/app/domain/interfaces/todo_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class TodoDAOImpl implements TodoDAO{
  Database _db;

  @override
  Future<List<Todo>> find() async {
    _db = await  Connection.get();
    List<Map<String,dynamic>> resultado =  await _db.query('todo');
    List<Todo> lista = List.generate( resultado.length, (i){
      var linha = resultado[i];
      return Todo(
        id : linha['id'],
        createdTime: linha['created_time'],
        title: linha['title'],
        description: linha['description'],
        isDone:  linha['is_done']
      );
    }
    );

    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await  Connection.get();
    var sql ='DELETE FROM todo WHERE id = ?';
    _db.rawDelete(sql, [id]);
    }
  
    @override
  save(Todo todo) async {
    _db = await  Connection.get();
    var sql;
    if(todo.id == null){
      sql = 'INSERT INTO todo (createdTime, title, description, isDone) VALUES (?,?,?,?)';
      _db.rawInsert(sql,[todo.createdTime,todo.title,todo.description,todo.isDone]);
    }else{
      sql = 'UPDATE todo SET createdTime = ?, title =?, description = ?, isDone= ? WHERE id = ?';
      _db.rawUpdate(sql,[todo.createdTime, todo.title, todo.description, todo.isDone, todo.id]);
    }
  }

}
