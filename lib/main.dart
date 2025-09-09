import 'package:flutter/material.dart';
import 'models/pet.dart'; // ✅ import Pet dari folder models

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Hewan Peliharaan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Pet> pets = [
    Pet(
      name: "Mondy",
      type: "Kucing",
      imagePath: "assets/kucing.jpg",
      description: "Mondy adalah kucing yang sangat manja.",
      caretips:
          "Berikan makanan kucing bergizi, sediakan pasir kucing, dan ajak bermain setiap hari.",
    ),
    Pet(
      name: "Poppy",
      type: "Anjing",
      imagePath: "assets/poppy.jpg",
      description:
          "Poppy adalah anjing yang setia, suka berlari, dan sangat ramah pada anak-anak.",
      caretips:
          "Ajak jalan setiap pagi, beri vaksin rutin, dan latih dengan perintah sederhana.",
    ),
    Pet(
      name: "Spingg",
      type: "Kelinci",
      imagePath: "assets/kelinci.jpg",
      description: "Spingg adalah kelinci putih yang jinak dan suka wortel.",
      caretips:
          "Sediakan kandang luas, berikan sayuran segar, dan jaga kebersihan bulu.",
    ),
    Pet(
      name: "Fring",
      type: "Hamster",
      imagePath: "assets/images/hamster.jpg",
      description: "Fring adalah hamster aktif yang suka bermain.",
      caretips: "Berikan tempat memanjat, makanan sehat, dan grooming rutin.",
    ),
    Pet (
      name: "Ruuppy",
      type: "Burung",
      imagePath: "assets/images/burung.jpg",
      description: "Ruuppy adalah burung kicau yang energik dan suka bernyanyi.",
      caretips: "Sediakan sangkar luas, beri biji-bijian segar, dan jemur tiap pagi.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Hewan Peliharaan INTAN"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  pet.imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                pet.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(pet.type),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PetDetailPage(pet: pet),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PetDetailPage extends StatelessWidget {
  final  pet; // ✅ gunakan tipe Pet

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
            Text(
              pet.description.isNotEmpty
                  ? pet.description
                  : "Belum ada deskripsi.",
            ),
            const SizedBox(height: 20),
            const Text(
              "Tips Perawatan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              pet.caretips.isNotEmpty
                  ? pet.caretips
                  : "Belum ada tips perawatan.",
            ),
          ],
        ),
      ),
    );
  }
}
