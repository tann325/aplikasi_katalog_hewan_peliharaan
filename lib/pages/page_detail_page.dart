import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetDetailPage extends StatelessWidget {
  final Pet pet;

  const PetDetailPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  pet.imagePath,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              pet.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              pet.type,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Karakteristik",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(pet.description.isNotEmpty ? pet.description : "Belum ada deskripsi."),
            const SizedBox(height: 20),
            const Text(
              "Tips Perawatan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(pet.caretips.isNotEmpty ? pet.caretips : "Belum ada tips perawatan."),
          ],
        ),
      ),
    );
  }
}
