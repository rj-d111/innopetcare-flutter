import 'package:flutter/material.dart';
import 'package:innopetcare/screens/about_me/about_me.dart';
import 'package:innopetcare/screens/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          const UserAccountsDrawerHeader(
             currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountName: Text('Jeffrey',
              style: TextStyle(fontSize: 16), // Adjust the font size as needed
            ),
            accountEmail: Text('jeffrey@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutMe(title: 'About Me')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              // Handle help
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Fort Deo Animal Clinic'),
            onTap: () {
              // Handle about
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            onTap: () {
              // Handle privacy policy
            },
          ),
          ListTile(
            leading: Icon(Icons.rule),
            title: Text('Terms of Use'),
            onTap: () {
              // Handle terms of use
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}