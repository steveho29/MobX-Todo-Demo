import 'package:flutter/material.dart';
import 'package:todo/ui/add_todo/add_todo.dart';
import 'package:todo/ui/home/home.dart';
import 'package:todo/ui/todo_list/todo_list.dart';

class RouteConstants {
  static const home = "home";
  static const addTodo = "addTodo";
  static const todoList = "todoList";

  static final routesMap = <String, WidgetBuilder>{
    home: (context) => const Home(),
    addTodo: (context) => const AddTodo(),
    todoList: (context) => TodoList(),
  };
}