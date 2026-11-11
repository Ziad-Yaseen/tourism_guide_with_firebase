import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../data/attractions_data.dart';
import '../widgets/attraction_card.dart';
import 'explore_screen.dart';
import 'favoriate_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screen_num = 0;

  @override
  Widget build(BuildContext context) {
  var screens = [ExploreScreen(),FavoriateScreen()];
    return Scaffold(

      backgroundColor:
      AppColors.background,

      appBar: AppBar(
        backgroundColor:
        AppColors.primary,

        title: const Text(
          "Tourism Egypt",
          style:
          TextStyle(color: Colors.white),
        ),
      ),

      body: screens[screen_num],

      bottomNavigationBar:
      BottomNavigationBar(
        onTap: (index){
          setState(() {
            screen_num = index;
          });
        },
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Explore",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: "Profile",
          // ),
        ],
      ),
    );
  }
}