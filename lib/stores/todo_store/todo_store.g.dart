// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoStore on _ToDoStore, Store {
  Computed<ObservableList<TodoModel>>? _$upcomingComputed;

  @override
  ObservableList<TodoModel> get upcoming => (_$upcomingComputed ??=
          Computed<ObservableList<TodoModel>>(() => super.upcoming,
              name: '_ToDoStore.upcoming'))
      .value;
  Computed<ObservableList<TodoModel>>? _$todayComputed;

  @override
  ObservableList<TodoModel> get today => (_$todayComputed ??=
          Computed<ObservableList<TodoModel>>(() => super.today,
              name: '_ToDoStore.today'))
      .value;
  Computed<ObservableList<TodoModel>>? _$currentListComputed;

  @override
  ObservableList<TodoModel> get currentList => (_$currentListComputed ??=
          Computed<ObservableList<TodoModel>>(() => super.currentList,
              name: '_ToDoStore.currentList'))
      .value;

  final _$todosAtom = Atom(name: '_ToDoStore.todos');

  @override
  ObservableList<TodoModel> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoModel> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$selectedTodoAtom = Atom(name: '_ToDoStore.selectedTodo');

  @override
  TodoModel? get selectedTodo {
    _$selectedTodoAtom.reportRead();
    return super.selectedTodo;
  }

  @override
  set selectedTodo(TodoModel? value) {
    _$selectedTodoAtom.reportWrite(value, super.selectedTodo, () {
      super.selectedTodo = value;
    });
  }

  final _$filterAtom = Atom(name: '_ToDoStore.filter');

  @override
  TodoFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(TodoFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_ToDoStoreActionController = ActionController(name: '_ToDoStore');

  @override
  void addItem(TodoModel item) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(TodoModel todoModel) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.removeItem');
    try {
      return super.removeItem(todoModel);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
selectedTodo: ${selectedTodo},
filter: ${filter},
upcoming: ${upcoming},
today: ${today},
currentList: ${currentList}
    ''';
  }
}
