import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset('lib/assets/images/FORT_logo.png', height: 40),
          const SizedBox(width: 10),
          Text( 
            'Fort Deo Animal Clinic',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: const Color(0xff094886),
      actions: const [
        Icon(Icons.favorite, color: Colors.red),
        SizedBox(width: 10),
        Icon(Icons.notifications, color: Colors.white),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
