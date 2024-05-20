// Imports necessary packages
import 'package:flutter/material.dart';
import 'package:sleep/config/app_theme.dart';
import 'package:sleep/presentation/screens/counter_screen.dart';

// Defines the main function as the entry point for the application.
void main() {
  // Runs the application with the MyApp widget as the root widget.
  runApp(const MyApp());
}

// Represents the main application widget.
class MyApp extends StatelessWidget {
  // Constructor for the MyApp widget.
  const MyApp({super.key});

  // Builds the UI for the application.
  @override
  Widget build(BuildContext context) {
    // Creates a MaterialApp widget, which is the foundation for most Flutter applications.
    return MaterialApp(
      // Disables the debug banner in the top left corner during development.
      debugShowCheckedModeBanner: false,

      // Sets the theme for the entire application using AppTheme.
      //  - AppTheme(primaryColorIndex: 0) creates an AppTheme object with the primary color index set to 0.
      //  - .theme() method retrieves the actual ThemeData object from the AppTheme.
      theme: AppTheme(primaryColorIndex: 0).theme(),

      // Sets the home screen of the application to the CounterScreen widget.
      home: const CounterScreen(),
    );
  }
}
