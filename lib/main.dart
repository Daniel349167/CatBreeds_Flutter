import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';
import 'screens/splash_screen.dart'; // Importa tu SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Iniciar con la SplashScreen
    );
  }
}
