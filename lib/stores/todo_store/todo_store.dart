import 'package:mobx/mobx.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/utils/date_time_utils.dart';

part 'todo_store.g.dart';

class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store {
  @observable
  ObservableList<TodoModel> todos = ObservableList.of([]);

  @observable
  TodoModel? selectedTodo;

  @observable
  TodoFilter filter = TodoFilter.all;

  @computed
  ObservableList<TodoModel> get upcoming {
    return todos
        .where((element) => !element.isDone)
        .toList()
        .getRange(0, todos.length < 3 ? todos.length : 3)
        .toList()
        .asObservable();
  }

  @computed
  ObservableList<TodoModel> get today {
    return todos
        .where((element) =>
            element.deadline.millisecondsSinceEpoch >=
                DateTimeUtils.beginOfDay().millisecondsSinceEpoch &&
            element.deadline.millisecondsSinceEpoch <=
                DateTimeUtils.cinderella().millisecondsSinceEpoch &&
            !element.isDone)
        .toList()
        .asObservable();
  }

  @computed
  ObservableList<TodoModel> get currentList {
    switch (filter) {
      case TodoFilter.upcoming:
        return upcoming;
      case TodoFilter.today:
        return today;
      default:
        return todos;
    }
  }

  @action
  void addItem(TodoModel item) {
    todos.add(item);
  }

  @action
  void removeItem(TodoModel todoModel) {
    todos.removeWhere((element) => element.id == todoModel.id);
  }
}

enum TodoFilter { upcoming, today, all }
