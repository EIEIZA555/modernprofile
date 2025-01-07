import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 60,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('images/idk.jpg'),
            ),
          ),
          CircleAvatar(
            backgroundColor: bgPrimary,
            radius: 20,
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 18,
              child: Icon(
                Icons.edit,
                size: 20,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
