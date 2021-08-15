import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:agenda_crud/app/domain/interfaces/todo_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDAOFirestore implements TodoDAO{
  CollectionReference todoCollection;

  TodoDAOFirestore(){
    todoCollection = FirebaseFirestore.instance.collection('todo');
  }

  @override
  Future<List<Todo>> find()async{
    var result = await todoCollection.get();
    return result.docs.map(
      (doc) => Todo(
        id:doc.reference.id.toString(), 
        title: doc['titulo'], 
        description: doc['descrição'],
        )
      ).toList();
  }

  @override
  remove(id) {
    todoCollection.doc(id).delete();
  }

  @override
  save(Todo todo) {
    todoCollection.doc(todo.id).set(
      {
        'titulo': todo.title,
        'descrição': todo.description,
      }
    );
  }

}
