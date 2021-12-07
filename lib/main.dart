import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/auth.dart';
import 'package:flutter_application_2/screens/home.dart';
import 'domain/workout.dart';

void main() => runApp(const MaxFitApp());

class MaxFitApp extends StatelessWidget {
  const MaxFitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaxFitness',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(50, 65, 85, 1),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(50, 65, 85, 1),
          ),
          textTheme: const TextTheme(headline6: TextStyle(color: Colors.white)),
        ),
        home: AutorizationPage());
  }
}
