import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,

      ///theme data
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,

        ///

        ///appbar theme
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),

          ///background theme
          backgroundColor: Colors.deepPurple,

          ///textcolors
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        useMaterial3: true,
      ),

      home: BMIScreen(),
    );
  }
}
