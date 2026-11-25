
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/animal.dart';

class AnimalDetailsPage extends StatefulWidget {
  final Animal animal;

  const AnimalDetailsPage({
    super.key,
    required this.animal,
  });

  @override
  State<AnimalDetailsPage> createState() =>
      _AnimalDetailsPageState();
}

class _AnimalDetailsPageState
    extends State<AnimalDetailsPage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  Future<void> playSound() async {
    try {
      await player.stop();

      await player.play(
        AssetSource(widget.animal.sound),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sound not available. Check the audio file.',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Widget infoCard(String title, String value, String emoji) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;

    return Scaffold(
      backgroundColor: const Color(0xFFE6F7FF),
      appBar: AppBar(
        title: Text(animal.name),
        backgroundColor: const Color(0xFF9ADB91),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 15),

            Container(
              height: 230,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                animal.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      animal.emoji,
                      style: const TextStyle(fontSize: 110),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Text(
              animal.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: playSound,
                icon: const Icon(Icons.volume_up, size: 28),
                label: const Text(
                  'PLAY SOUND',
                  style: TextStyle(fontSize: 19),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            infoCard(
              'Habitat',
              animal.habitat,
              '🌳',
            ),

            infoCard(
              'Food',
              animal.food,
              '🍎',
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📖 Fun Facts',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    animal.description,
                    style: const TextStyle(
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
