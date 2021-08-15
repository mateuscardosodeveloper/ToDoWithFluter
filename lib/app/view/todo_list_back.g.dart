// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListBack on _TodoListBack, Store {
  final _$listAtom = Atom(name: '_TodoListBack.list');

  @override
  Future<List<Todo>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Todo>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_TodoListBackActionController =
      ActionController(name: '_TodoListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_TodoListBackActionController.startAction(
        name: '_TodoListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_TodoListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
