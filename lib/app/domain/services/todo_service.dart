import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:agenda_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:agenda_crud/app/domain/interfaces/todo_dao.dart';
import 'package:get_it/get_it.dart';

class TodoService{
 var _dao = GetIt.I.get<TodoDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
save(Todo todo){
  validateTitle(todo.title);
  validateDescription(todo.description);
  _dao.save(todo);
}

remove(dynamic id){
  _dao.remove(id);
}

Future<List<Todo>> find(){
  return _dao.find();
}
// title → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 30
validateTitle(String title){
  var min = 3; 
  var max = 30; 

  if(title == null){
    throw new DomainLayerException('O title é obrigatório.');
  }else if(title.length < min){
    throw new DomainLayerException('O title deve possuir pelo menos $min caracteres.');
  }else if(title.length > max){
    throw new DomainLayerException('O title deve possuir no máximo $max caracteres.');
  }
}
// descrição → seja obrigatório no mínimo 3 caracteres e no máximo 100
validateDescription(String description){
  var min = 3; 
  var max = 100; 
  if(description == null){
    throw new DomainLayerException('A descrição é obrigatório.');
  }else if(description.length < min){
    throw new DomainLayerException('O descrição deve possuir pelo menos $min caracteres.');
  }else if(description.length > max){
    throw new DomainLayerException('O descrição deve possuir no máximo $max caracteres.');
  }
}

}
