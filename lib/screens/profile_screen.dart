import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child : Column (
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('images/idk.jpg'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
