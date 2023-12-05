import 'package:flutter/material.dart';
import 'package:twitter_clone_app/features/authenfication/email_code_screen.dart';
import 'package:twitter_clone_app/features/authenfication/interest_screen.dart';
import 'package:twitter_clone_app/features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
