import 'package:flutter/material.dart';
import 'landing_screen.dart'; // Asegúrate de importar tu LandingScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Pre-cargar la imagen en memoria antes de mostrar la pantalla
    precacheImage(AssetImage('assets/images/cat_logo.jpg'), context);

    // Retraso de 3 segundos antes de navegar a la LandingScreen
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
              child: Image.asset(
                'assets/images/cat_logo.jpg',
                width: 130, // Tamaño más grande
                height: 130, // Tamaño más grande
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text('CatBreeds', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
