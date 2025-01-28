import 'package:flutter/material.dart';
import 'package:modern_profile/screens/editprofile_screen.dart';
import '../constant/constant.dart';
import 'package:modern_profile/screens/home_screen.dart';  

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;
  
  final List<String> _titles = [
    "Home",            
    "Settings",        
    "Edit Profile",    
    "Favourite",         
  ];

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedItem = index;
      print(index);
    });
  }
  final List<Widget> _pages = [
    const HomeScreen(),
    const Text("Setting"),
    const EditProfileScreen(),
    const Text("Favourite"),
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.cyan,
        ),
        title: Center(
            child: Text(
           _titles[_selectedItem],
          style: textTitle,
        )),
        actions: const [
          Icon(
            Icons.exit_to_app,
            size: 24,
            color: Colors.cyan,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: _navigationBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.cyan,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
                color: Colors.cyan,
              ),
              label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
                color: Colors.cyan,
              ),
              label: "Edit Profile"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
                color: Colors.cyan,
              ),
              label: "Favourtie"),
        ],
      ),
    );
  }
}

