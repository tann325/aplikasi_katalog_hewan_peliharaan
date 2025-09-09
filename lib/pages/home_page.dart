import 'package:flutter/material.dart';
import '../models/pet.dart';       // model Pet
import 'page_detail_page.dart';   // halaman detail Pet

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Pet> pets = [
    Pet(
      name: "kucing",
      type: "mondy",
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
      caretips: "Sediakan kandang luas, berikan sayuran segar, dan jaga kebersihan bulu.",
    ),
    Pet(
      name: "Fring",
      type: "Hamster",
      imagePath: "assets/hamster.jpg",
      description: "Fring adalah hamster aktif yang suka bermain.",
      caretips: "Berikan tempat memanjat, makanan sehat, dan grooming rutin.",
    ),
    Pet(
      name: "Ruuppy",
      type: "Burung",
      imagePath: "assets/burung.jpg",
      description: "Ruuppy adalah burung kicau yang energik dan suka bernyanyi.",
      caretips: "Sediakan sangkar luas, beri biji-bijian segar, dan jemur tiap pagi.",
    ),
  ];

  List<Pet> filteredPets = [];

  @override
  void initState() {
    super.initState();
    filteredPets = pets;
  }

  void _searchPet(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPets = pets;
      } else {
        filteredPets = pets
            .where((pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Hewan Peliharaan INTAN"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _searchPet,
              decoration: InputDecoration(
                hintText: "Cari hewan berdasarkan nama...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredPets.length,
        itemBuilder: (context, index) {
          final pet = filteredPets[index];
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
                    builder: (_) => PetDetailPage(pet: pet), // ✅ tidak error lagi
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
