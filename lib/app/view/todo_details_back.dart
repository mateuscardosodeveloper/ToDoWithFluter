import 'package:agenda_crud/app/domain/entities/todo.dart';
import 'package:flutter/cupertino.dart';

class TodoDetailsBack{
  BuildContext context;
  Todo todo;

  TodoDetailsBack(this.context){
    todo = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }
  
}
