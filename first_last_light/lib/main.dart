import 'package:flutter/material.dart';

void main() {
  runApp(const SunlightApp());
}

// Main app widget
class SunlightApp extends StatelessWidget {
  const SunlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Removes the red debug banner
      debugShowCheckedModeBanner: false,

      title: 'Sunlight Card App',

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.lightBlue),

      home: const HomePage(),
    );
  }
}

// First screen of the app
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Light & Last Light'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade300,
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        // Sky-like background using gradient colors
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4FC3F7), // sky blue
              Color(0xFF81D4FA), // soft blue
              Color(0xFFE1F5FE), // very light blue
            ],
          ),
        ),

        child: const Column(
          children: [
            SizedBox(height: 40),

            // Icon to show the app is related to sky/weather
            Icon(Icons.cloud, size: 80, color: Colors.white),

            SizedBox(height: 20),

            Text(
              'Search a city to see sunlight times',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'First light • Sunrise • Sunset • Last light',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
