import 'package:flutter/material.dart';
import 'package:mycrop/Screens/chartpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MyFasal',
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    home: ChartPage(check: 'check',),
  );
  }
}