import 'package:flutter/material.dart';
import 'package:smart_railway/route/home.dart';
import 'package:smart_railway/route/id.dart';
import 'package:smart_railway/route/sensor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: <String, WidgetBuilder>{
        "/sensor": (context) => Sensor(),
        "/home": (context) => Home(),
        "/id": (context) => Id()
      },
    );
  }
}
