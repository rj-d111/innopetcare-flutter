import 'package:flutter/material.dart';
import 'package:innopetcare/screens/custom_app_bar.dart';
import 'package:innopetcare/screens/health_record/health_record.dart';

class RecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Pet Health Record',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PetRecordTile(
                  imagePath: 'lib/assets/images/dog-cooper.png',
                  petName: 'Cooper',
                  onViewRecords: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetHealthRecord(),
                      ),
                    );
                  },
                ),
                PetRecordTile(
                  imagePath: 'lib/assets/images/cat-precious.png',
                  petName: 'Precious',
                  onViewRecords: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetHealthRecord(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            ConnectedCareSection(),
            Image.asset('lib/assets/images/FORT_logo.png', height: 50),
          ],
        ),
      ),
    );
  }
}

class PetRecordTile extends StatelessWidget {
  final String imagePath;
  final String petName;
  final VoidCallback onViewRecords;

  PetRecordTile(
      {required this.imagePath,
      required this.petName,
      required this.onViewRecords});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 8),
        Text(petName),
        TextButton(
          onPressed: onViewRecords,
          child: const Text('View Records'),
        ),
      ],
    );
  }
}

class ConnectedCareSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Connected Care Corner',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(
              'Post questions, receive updates, and interact with our staff. Stay connected with your pet and our team through real-time updates and open communication.'),
          SizedBox(height: 20),
          ListTile(
            title: Text('Precious Confinement - Current Status'),
            subtitle: Text(
                'Hi Sir. I wanted to give you an update on Precious condition. Unfortunately, he\'s still not eating as expected. We\'re closely monitoring his condition and providing supportive care to help him recover from his previous. We\'ll keep you updated on any changes. Please don\'t hesitate to contact us if you have any concerns.'),
            leading: Icon(Icons.pets),
            trailing: IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
