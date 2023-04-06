import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String id = "";
  @HiveField(1)
  String todo = "";
  @HiveField(3)
  DateTime deadline = DateTime.now().add(const Duration(days: 1));
  @HiveField(4)
  bool isDone;
  @HiveField(5)
  bool? isVisible;

  TodoModel({required this.id, required this.todo, required this.deadline, this.isDone = false, this.isVisible = true});
}