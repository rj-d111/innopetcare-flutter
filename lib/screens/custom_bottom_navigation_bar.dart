import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFbc1823), // Red color
      unselectedItemColor: const Color(0xFF094886), // Blue color
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.home, 0),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.medical_services, 1),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.pets, 2),
          label: 'Pets',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.description, 3),
          label: 'Records',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.person, 4),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    final isSelected = index == selectedIndex;
    final color = isSelected ? const Color(0xFFbc1823) : const Color(0xFF094886);
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: color,
        ),
        Icon(icon, color: Colors.white),
      ],
    );
  }
}
