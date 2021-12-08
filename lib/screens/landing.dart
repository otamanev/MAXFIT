import 'package:flutter_application_2/screens/home.dart';
import 'package:flutter_application_2/screens/auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;

    return isLoggedIn ? HomePage() : AutorizationPage();
    // return AutorizationPage();
  }
}
