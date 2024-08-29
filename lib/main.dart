
import 'package:booking_app/screens/home_screen.dart';
import 'package:booking_app/utils/my_theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: MyAppTheme.myThemeData(),
        home: const HomeScreen(),);
  }
}
