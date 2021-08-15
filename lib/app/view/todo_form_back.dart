import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:agenda_crud/app/domain/services/todo_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class TodoFormBack {
  Todo todo;
  var _service = GetIt.I.get<TodoService>();
  bool _titleIsValid; 
  bool _descriptionIsValid; 

  bool get isValid => _titleIsValid && _descriptionIsValid;

  // diferenciar novo com alteração 
  TodoFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    todo = (parameter == null) ? Todo() : parameter;
  }

  //salvar 
  save() async {
    await _service.save(todo);
  }

  //validações  
  String validateTitle(String title){
    try{
      _service.validateTitle(title);
      _titleIsValid = true;
      return null;
    }catch(e){
      _titleIsValid = false;
      return e.toString();
    }
  }
  
  String validateDescription(String description){
    try{
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    }catch(e){
      _descriptionIsValid = false;
      return e.toString();
    }
  }


}
