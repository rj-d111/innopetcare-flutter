import 'package:flutter/material.dart';
import 'package:innopetcare/screens/pet.dart';
import 'package:innopetcare/screens/appointment_page.dart' as appointment;
import 'package:innopetcare/screens/custom_bottom_navigation_bar.dart';
import 'package:innopetcare/screens/home_screen.dart';
import 'package:innopetcare/screens/login_screen.dart';
import 'package:innopetcare/screens/registration_screen.dart';
import 'package:innopetcare/screens/services_page.dart';
import 'package:innopetcare/screens/records_page.dart';
import 'package:innopetcare/screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/services': (context) => ServicesPage(),
        '/pets': (context) => Pet(),
        '/records': (context) => RecordsPage(),
        '/profile': (context) => ProfilePage(),
        '/': (context) =>
            const MainScreen(), // Use MainScreen as the home route
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ServicesPage(),
    Pet(),
    RecordsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
