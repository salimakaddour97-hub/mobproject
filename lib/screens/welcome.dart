import 'package:flutter/material.dart';
import '../widgets/junglebackground.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JungleBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE4A3),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.brown,
                        width: 3,
                      ),
                    ),
                    child: const Text(
                      '🐾 ANIMAL\nFRIENDS 🐾',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF754015),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Learn • Play • Discover',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF275D29),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Image.asset(
                    'assets/images/animals_group.png',
                    height: 290,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: 230,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xFFFFC83D),
                        foregroundColor: Colors.brown,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(35),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                            const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'START ➜',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}