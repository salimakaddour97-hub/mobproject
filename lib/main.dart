
import 'package:flutter/material.dart';
import 'screens/welcome.dart';

void main() {
  runApp(const AnimalFriendsApp());
}

class AnimalFriendsApp extends StatelessWidget {
  const AnimalFriendsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Friends',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEAF8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF74C76B),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
