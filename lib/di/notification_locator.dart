import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/constants/route_constants.dart';

import '../stores/todo_store/todo_store.dart';

class NotificationLocator {
  static Future setUpAsync() async {
    final getIt = GetIt.instance;

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
    //     Platform.isLinux
    //     ? null
    //     : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      if (payload.payload != null) {
        var todoStore = getIt.get<ToDoStore>();
        var todos = todoStore.todos;

        var notifiedTodo =
            todos.firstWhere((element) => element.id == payload.payload);
        todoStore.selectedTodo = notifiedTodo;

        var navKey = getIt.get<GlobalKey<NavigatorState>>();
        navKey.currentState?.pushNamed(RouteConstants.addTodo);
      }
    });

    getIt.registerSingleton(flutterLocalNotificationsPlugin);
  }
}
