import 'package:get_it/get_it.dart';
import 'package:todo/stores/todo_store/todo_store.dart';

class StoresLocator {
  static void setUp() {
    final getIt = GetIt.instance;

    getIt.registerSingleton(ToDoStore());

  }
}