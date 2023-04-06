import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';
import 'package:todo/constants/hive_constants.dart';
import 'package:todo/constants/route_constants.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/stores/todo_store/todo_store.dart';
import 'package:todo/ui/home/widgets/add_button.dart';
import 'package:todo/ui/home/widgets/list_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> _addButtonAnimation;
  late AnimationController _addButtonAnimationController;

  final todoStore = GetIt.instance.get<ToDoStore>();
  final box = Hive.box<TodoModel>(HiveConstants.boxName);

  @override
  void initState() {
    _addButtonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _addButtonAnimation = CurvedAnimation(
      parent: _addButtonAnimationController,
      curve: Curves.easeInOut,
    );

    _addButtonAnimationController.repeat(
      reverse: true,
      period: const Duration(
        milliseconds: 1500,
      ),
    );

    todoStore.todos = ObservableList.of(box.values.where((element) => !element.isDone));

    super.initState();
  }

  @override
  void dispose() {
    _addButtonAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.todo.titleCase,
        ),
      ),
      floatingActionButton: const AddButton(),
      body: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ListItem(
                title: S.current.upcoming,
                icon: Image.asset(
                  "assets/animations/clock.gif",
                  width: 48.0,
                ),
                insideItemsCount: todoStore.upcoming.length,
                onClick: _handleUpcomingClick,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1.0,
              ),
              ListItem(
                title: S.current.today,
                icon: Image.asset(
                  "assets/animations/calendar.gif",
                  width: 48.0,
                ),
                insideItemsCount: todoStore.today.length,
                onClick: _handleTodayClick,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1.0,
              ),
              ListItem(
                title: S.current.all,
                icon: Image.asset(
                  "assets/animations/complete.gif",
                  width: 48.0,
                ),
                insideItemsCount: todoStore.todos.length,
                onClick: _handleAllClick,
              ),
            ],
          ),
        );
      }),
    );
  }

  void _handleAdd() {
    Navigator.pushNamed(context, RouteConstants.addTodo);
  }

  _handleUpcomingClick() {
    todoStore.filter = TodoFilter.upcoming;
    Navigator.pushNamed(context, RouteConstants.todoList)
        .whenComplete(() => todoStore.filter = TodoFilter.all);
  }

  _handleTodayClick() {
    todoStore.filter = TodoFilter.today;
    Navigator.pushNamed(context, RouteConstants.todoList)
        .whenComplete(() => todoStore.filter = TodoFilter.all);
  }

  _handleAllClick() {
    todoStore.filter = TodoFilter.all;
    Navigator.pushNamed(context, RouteConstants.todoList);
  }
}
