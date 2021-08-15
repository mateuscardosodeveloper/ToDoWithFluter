import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:agenda_crud/app/domain/services/todo_service.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'todo_list_back.g.dart';

class TodoListBack = _TodoListBack with _$TodoListBack;

abstract class _TodoListBack with Store {
  var _service = GetIt.I.get<TodoService>();

  //lista de contatos 
  @observable
  Future<List<Todo>> list;

  //método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]){
    list = _service.find();
  }

  _TodoListBack(){
    refreshList();
  }

  //método para chamar o form salvar/alterar
  goToForm(BuildContext context, [Todo todo]){
    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: todo).then(refreshList);
  }

  goToDetails(BuildContext context, Todo todo){
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS, arguments: todo);
  }

  //excluir
  remove(dynamic id){
    _service.remove(id); 
    refreshList();
  }

}
