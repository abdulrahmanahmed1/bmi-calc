import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          headline1:  TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w800,
              color: Colors.white
          ),
          headline2:  TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        )
      ),
      home: const MyHomePage(),
    );
  }
}


