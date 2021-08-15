

import 'package:agenda_crud/app/database/firestore/todo_dao_firestore.dart';
import 'package:agenda_crud/app/domain/interfaces/todo_dao.dart';
import 'package:agenda_crud/app/domain/services/todo_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/sqlite/dao/todo_dao_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


setupInjection() async{
  GetIt getIt = GetIt.I;
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  getIt.registerSingleton<TodoDAO>(TodoDAOImpl());
  getIt.registerSingleton<TodoService>(TodoService());
}
