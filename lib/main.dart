import 'package:flutter/material.dart';
import 'package:health_checkup/testList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3AA8C1)),
        useMaterial3: true,
      ),
      home: const TestList(),
    );
  }
}

