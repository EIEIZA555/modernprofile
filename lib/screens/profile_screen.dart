import 'package:flutter/material.dart';
import 'package:modern_profile/components/profile_img.dart';

import '../components/profile_menu.dart';
import '../constant/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileImage(),
          const SizedBox(height: 20),
          Text(
            "Apisit Wongsatitwiroj",
            style: textTitle,
          ),
          const SizedBox(height: 15),
          Text(
            "s6503051634039@email.kmutnb.ac.th",
            style: textSubTitle,
          ),
          const SizedBox(height: 10),
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(child: Text("Edit Profile", style: textBtn)),
          ),

          //profile menu
          const SizedBox(
            height: 20,
          ),
          const ProfileMenu(title: "Settings",icons: Icons.settings),
          const SizedBox(
            height : 15,
            ),
          const ProfileMenu(title: "Billing Detail", icons: Icons.wallet,),
          const SizedBox(
            height : 15,
            ),
          const ProfileMenu(title: "User Management", icons: Icons.person,),
          const SizedBox(
            height : 15,
            ),
          const ProfileMenu(title: "Add Friends", icons: Icons.face,),
          const SizedBox(
            height : 15,
            ),
          const ProfileMenu(title: "Log out", icons: Icons.logout,),
        ],
      ),
    );
  }
}

