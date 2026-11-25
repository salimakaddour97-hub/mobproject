import 'package:flutter/material.dart';
import '../widgets/junglebackground.dart';
import 'animals.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget menuButton({
    required String title,
    required String emoji,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 85,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: const Color(0xFF50331F),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 34)),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  void comingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This feature will be added by Member 2'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JungleBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xF5FFFFFF),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Hello, Explorer! 😊',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF70431E),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'What do you want to do?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  '🦁 🐘 🐯 🐵',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 35),
                menuButton(
                  title: 'Learn About Animals',
                  emoji: '🦁',
                  color: const Color(0xFFFFA5B5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AnimalsPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                menuButton(
                  title: 'Play Quiz',
                  emoji: '🎮',
                  color: const Color(0xFFB8E77D),
                  onPressed: () => comingSoon(context),
                ),
                const SizedBox(height: 20),
                menuButton(
                  title: 'My Progress',
                  emoji: '🏆',
                  color: const Color(0xFFFFD176),
                  onPressed: () => comingSoon(context),
                ),
                const SizedBox(height: 35),
                TextButton.icon(
                  onPressed: () {
                    Navigator.popUntil(
                      context,
                          (route) => route.isFirst,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Exit'),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xF5FFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}