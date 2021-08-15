import 'package:agenda_crud/app/view/todo_details.dart';
import 'package:agenda_crud/app/view/todo_form.dart';
import 'package:agenda_crud/app/view/todo_list.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM =  'todo-form';
  static const CONTACT_DETAILS = 'todo-details';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
      HOME : (context) => TodoList(),
      CONTACT_FORM : (context) => TodoForm(),
      CONTACT_DETAILS: (context) => TodoDetails()
      },
    );
  }
}
