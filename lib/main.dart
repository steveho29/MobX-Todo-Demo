import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo/constants/hive_constants.dart';
import 'package:todo/di/navigator_key_locator.dart';
import 'package:todo/di/notification_locator.dart';
import 'package:todo/di/stores_locator.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/models/todo_model.dart';

import 'constants/route_constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  // Hive.deleteFromDisk();
  await Hive.openBox<TodoModel>(HiveConstants.boxName);

  await _configureLocalTimeZone();
  await NotificationLocator.setUpAsync();

  StoresLocator.setUp();
  NavigatorKeyLocator.setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GetIt.I.get<GlobalKey<NavigatorState>>(),
      debugShowCheckedModeBanner: false,
      title: "TODO",
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepOrangeAccent,
        appBarTheme: ThemeData.light()
            .appBarTheme
            .copyWith(backgroundColor: Colors.deepOrange[400]),
      ),
      routes: RouteConstants.routesMap,
      initialRoute: RouteConstants.home,
    );
  }
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}
