import 'package:flutter/material.dart';
import 'package:rmpwebapp/about.dart';
import 'package:rmpwebapp/branches.dart';
import 'package:rmpwebapp/login.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RM Pharmacy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE5E3E4),
        primarySwatch: Colors.blue,
      ),
      home: const About(),
    );
  }
}