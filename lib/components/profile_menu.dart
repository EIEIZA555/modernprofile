import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ProfileMenu extends StatelessWidget {
  
  final String title;
  final IconData icons;
  
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: bgSecondary,
            child: Icon(
              icons,
              size: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: textSubTitle,
          ),
          const SizedBox(
            width: 15,
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 16,
            backgroundColor:Colors.blue,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: iconSecondary,
            ),
          ),
        ],
      ),
    );
  }

  
}