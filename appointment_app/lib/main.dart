import 'package:appointment_app/app_constants.dart';
import 'package:appointment_app/pages/home_page.dart';
import 'package:appointment_app/pages/login_page1.dart';
import 'package:appointment_app/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CSE344 Project',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Constants.mainColor,
              selectionColor: Constants.mainColor,
              selectionHandleColor: Constants.mainColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}
