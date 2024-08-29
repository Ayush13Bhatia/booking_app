import 'package:booking_app/screens/home_screen.dart';
import 'package:booking_app/utils/my_theme.dart';
import 'package:booking_app/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configuration/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  String environment = const String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEMO,
  );
  Environment().initConfig(environment);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyAppTheme.myThemeData(),
        home: const HomeScreen(),
      ),
    );
  }
}
