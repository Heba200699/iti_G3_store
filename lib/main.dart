import 'package:flutter/material.dart';
import 'package:flutter_first_project/profile_screen/profile_screen.dart';

import 'cart_screen/cart_screen.dart';
import 'categories_screen/categories_screen.dart';
import 'create_an_account/create_an_account.dart';
import 'home_screen/home_screen.dart';

import 'login_toaccount_screen/login_toaccount_screen.dart';
import 'nav_bar/nav_bar.dart';
import 'onboarding_screen.dart/on_boarding_screen.dart';
import 'onboarding_screen.dart/welcome_screen.dart';
import 'orders_screen/orders_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),

      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/navbar': (context) => NavBar(),
      },
    );
  }
}