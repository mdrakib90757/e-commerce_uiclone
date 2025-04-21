
import 'package:e_commarce_project/utils/color.dart';
import 'package:flutter/material.dart';

import 'Screen/favorite_screen.dart';
import 'Screen/home_screen.dart';
import 'Screen/profile_screen.dart';

class NevigationScreen extends StatefulWidget {
  const NevigationScreen({super.key});

  @override
  State<NevigationScreen> createState() => _NevigationScreenState();
}

class _NevigationScreenState extends State<NevigationScreen> {
  int currentIndex=0;
  List screens=[
     HomeScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text("E- Commerce App",style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400
        ),),
        backgroundColor: AppColor.primaryColors,
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (value) {
          setState(() =>currentIndex=value);
        },

        selectedItemColor: AppColor.primaryColors,
        unselectedItemColor: Colors.grey,


        items: const [
          BottomNavigationBarItem(
            label: "Home",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite),
              label: "Favorite",
              icon: Icon(Icons.favorite_border)
          ),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person)
          ),
        ],
      ),
      
    );
  }
}
