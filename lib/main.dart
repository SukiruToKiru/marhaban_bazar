import 'package:flutter/material.dart';
import 'screens/main_wrapper.dart';

void main() {
  runApp(const MarhabanBazarApp());
}

class MarhabanBazarApp extends StatelessWidget {
  const MarhabanBazarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marhaban Bazar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const MainWrapper(), // Starts the app with the Bottom Nav Wrapper
    );
  }
}
