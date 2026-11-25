import 'package:flutter/material.dart';
import '../data/animalsdata.dart';
import '../models/animal.dart';
import '../widgets/junglebackground.dart';
import 'animals'
    'details.dart';

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({super.key});

  Widget animalCard(BuildContext context, Animal animal) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AnimalDetailsPage(animal: animal),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xF5FFFFFF),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFFFD67C),
            width: 3,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(21),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    animal.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stackTrace) {
                      debugPrint('Image error: $error');
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.red,
                          size: 55,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                animal.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF70431E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn About Animals'),
        backgroundColor: const Color(0xFF9ADB91),
      ),
      body: JungleBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xF5FFFFFF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  'Choose an Animal! 🐾',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF328744),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: animals.length,
                  itemBuilder: (context, index) {
                    return animalCard(context, animals[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}