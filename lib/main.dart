// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/controller/weather_pro.dart';
import 'package:weather_api/view/home.dart';
import 'package:weather_api/view/splash.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherPro(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weather",
        theme: ThemeData.light(useMaterial3: true),
        themeAnimationCurve: Curves.linear,
        initialRoute: "/",
        routes: {
          "/": (context) => Splash(),
          "Home": (context) => Home(),
        },
      ),
    );
  }
}
