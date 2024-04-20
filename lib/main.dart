import 'package:flutter/material.dart';
import 'package:sleep/config/app_theme.dart';
import 'package:sleep/presentation/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(primaryColorIndex: 0).theme(),
      home: const CounterScreen(),
    );
  }
}
