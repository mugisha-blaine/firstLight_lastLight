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
        backgroundColor: Colors.lightBlue,
      ),

      body: const Center(
        child: Text(
          'Sunlight Card Demo',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
