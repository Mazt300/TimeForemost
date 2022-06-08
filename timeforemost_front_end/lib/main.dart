import 'package:flutter/material.dart';
import 'package:timeforemost_front_end/common/light_theme.dart';
import 'package:timeforemost_front_end/route/routes.dart';

void main() {
  runApp(const TimeForemostApp());
}

class TimeForemostApp extends StatelessWidget {
  const TimeForemostApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TimeForemost',
      theme: LightTheme().theme(),
      routes: getApplicationRoutes(),
      initialRoute: '/',
    );
  }
}
