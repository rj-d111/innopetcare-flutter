import 'package:flutter/material.dart';
import 'package:innopetcare/screens/custom_app_bar.dart';
import 'package:innopetcare/screens/add_pet.dart';

class Pet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'My Pets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetCard(
                  imagePath: 'lib/assets/images/dog-cooper.png',
                  petName: 'Cooper',
                ),
                PetCard(
                  imagePath: 'lib/assets/images/cat-precious.png',
                  petName: 'Precious',
                ),
              ],
            ),
            const SizedBox(height: 20),
            AddPetCard(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPet(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String imagePath;
  final String petName;

  PetCard({required this.imagePath, required this.petName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 10),
        Text(petName),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            // Navigate to edit details
          },
          child: Text('Edit Details'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class AddPetCard extends StatelessWidget {
  final VoidCallback onTap;

  AddPetCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: Icon(Icons.add, size: 40),
          ),
          const SizedBox(height: 10),
          Text('Add your new pet here'),
        ],
      ),
    );
  }
}
