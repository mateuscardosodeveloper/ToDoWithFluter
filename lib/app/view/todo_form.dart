import 'package:flutter/material.dart';
import 'package:agenda_crud/app/view/todo_form_back.dart';

class TodoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldTitle(TodoFormBack back) {
    return TextFormField (  
      validator: back.validateTitle,
      onSaved: (newValue) => back.todo.title = newValue,
      initialValue: back.todo.title,
      decoration: InputDecoration ( 
        border: UnderlineInputBorder(),
        labelText: 'Titulo:'
      )
    );
  }
  
  Widget fieldDescription(TodoFormBack back) {
    return TextFormField (
      maxLines: 3,
      validator: back.validateDescription,
      onSaved: (newValue) => back.todo.description= newValue,
      initialValue: back.todo.description,
      decoration: InputDecoration (
        border: UnderlineInputBorder(),
        labelText: 'Descrição:'
      )
    );
  }


   @override
  Widget build(BuildContext context) {
    var _back = TodoFormBack(context);
    return Scaffold(
      appBar: AppBar(  
        title: Text('Cadastro de Contato'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              _form.currentState.validate();
              _form.currentState.save();
              if(_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            })
        ],
      ),
      body: Padding(  
        padding: EdgeInsets.all(10),
        child: Form(  
          key: _form,
          child:  Column (
            children: [
              fieldTitle(_back),
              fieldDescription(_back),
            ],
            ),
        ),
      ),
      
    );
  }
}
