import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showAllModules = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('lib/assets/images/FORT_logo.png', height: 40),
            SizedBox(width: 10),
            Text('Fort Deo Animal Clinic'),
          ],
        ),
        backgroundColor: Color(0xff094886),
        actions: [
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 10),
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset('lib/assets/images/dog.png'),
                  SizedBox(height: 10),
                  Text(
                    'Welcome to Fort Deo Animal Clinic',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Our dedicated veterinarians and staff are passionate about helping your pet live a long and healthy life.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffbc1823),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Experience the Best Care for your Pets',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showAllModules = !showAllModules;
                          });
                        },
                        child: Text(
                          showAllModules ? 'Show Less' : 'Show All',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ModuleCard(
                        icon: Icons.vaccines, // Replace with actual icon
                        label: 'Vaccination',
                      ),
                      ModuleCard(
                        icon:
                            Icons.medical_services, // Replace with actual icon
                        label: 'Consultation',
                      ),
                      ModuleCard(
                        icon: Icons.local_hospital, // Replace with actual icon
                        label: 'Surgeries',
                      ),
                      if (showAllModules) ...[
                        ModuleCard(
                          icon: Icons.cut, // Replace with actual icon
                          label: 'Pet Grooming',
                        ),
                        ModuleCard(
                          icon: Icons.pets, // Replace with actual icon
                          label: 'Adopt a new Pet',
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Blog',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Add blog content here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleCard extends StatelessWidget {
  final IconData icon;
  final String label;

  ModuleCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xffe5f4ff),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Color(0xff094886)),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
