import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rmpwebapp/routes/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final StreamController<List<dynamic>> eventstreamController = StreamController<List<dynamic>>.broadcast();
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