import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const KakeyoApp());
}

class KakeyoApp extends StatelessWidget {
  const KakeyoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kakeyo Kanji',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}