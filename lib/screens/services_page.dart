import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:innopetcare/screens/appointment_page.dart';
import 'package:innopetcare/screens/custom_app_bar.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  'lib/assets/images/dog-injection.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Our Services',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF094886)),
                  ),
                  const SizedBox(height: 16),
                  ServiceCard(
                    icon: FontAwesomeIcons.stethoscope,
                    title: 'Consultation',
                    description:
                        'Schedule a consultation with our licensed veterinarians who can perform a physical exam and provide medical advice.',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentPage(title: 'Consultation', imagepath: 'dog-stethoscope.webp')),
                    ),
                  ),
                  ServiceCard(
                    icon: FontAwesomeIcons.syringe,
                    title: 'Vaccination',
                    description:
                        'Protect your pet from preventable diseases with vaccinations.',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentPage(title: 'Vaccination', imagepath: 'dog-vaccination.webp')),
                    ),
                  ),
                  ServiceCard(
                    icon: FontAwesomeIcons.pills,
                    title: 'Deworming',
                    description:
                        'Get rid of intestinal parasites that can harm your pet’s health and potentially transmit to humans.',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentPage(title: 'Deworming', imagepath: 'dog-deworming.jpg',)),
                    ),
                  ),
                  ServiceCard(
                    icon: FontAwesomeIcons.cross,
                    title: 'Surgeries',
                    description:
                        'We offer a variety of surgical procedures to treat your pet\'s medical issues or injuries.',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentPage(title: 'Surgeries', imagepath: 'dog-surgeries.jpg',)),
                    ),
                  ),
                  ServiceCard(
                    icon: FontAwesomeIcons.doorClosed,
                    title: 'Confinement',
                    description:
                        'Offering comfortable confinement for pets requiring extended care and receive real-time updates on your pet\'s condition.',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentPage(title: 'Confinement',imagepath: 'dog-confinement.jpg')),
                    ),
                  ),
                  ServiceCard(
                    icon: FontAwesomeIcons.cut,
                    title: 'Grooming',
                    description:
                        'Pamper your pet! Keep them looking and feeling their best with our professional grooming services.',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentPage(title: 'Grooming', imagepath: 'dog-grooming.jpg')),
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

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  ServiceCard(
      {required this.icon,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: FaIcon(icon, color: const Color(0xFF094886)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0188e0),
          ),
          child: const Text('Set Appointment',
          style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
