import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TourismGuideApp());
}

class TourismGuideApp extends StatelessWidget {
  const TourismGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourism Guide',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}