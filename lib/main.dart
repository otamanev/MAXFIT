import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/landing.dart';

void main() {
  runApp(const MaxFitApp());
}

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
        home: FutureBuilder(
          // Initialize FlutterFire
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Container(
                child: Text('ошибка фб'),
              );
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return LandingPage();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
