import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_railway/provider/domain_url_provider.dart';
import 'package:smart_railway/provider/id_provider.dart';
import 'package:smart_railway/provider/login_provider.dart';
import 'package:smart_railway/provider/sensors_provider.dart';
import 'package:smart_railway/route/home.dart';
import 'package:smart_railway/route/id.dart';
import 'package:smart_railway/route/initial_screen.dart';
import 'package:smart_railway/route/sensor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LoginProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => IdProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SensorsProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => DomainUrlProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/initial",
          routes: <String, WidgetBuilder>{
            "/sensor": (context) => const Sensor(),
            "/home": (context) => const Home(),
            "/initial": (context) => const InitialScreen(),
            "/id": (context) => Id()
          },
        ));
  }
}
