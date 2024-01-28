import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../controllers/home_controller.dart';
import '../../../../utils/app_string.dart';
import '../../folder_screen/folder_screen.dart';
import '../../history/history_screen.dart';
import '../../profile/profile_screen.dart';
import '../../wishlist/wishlist_screen.dart';
import '../home_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  List navigationPagesList = [
    HomeScreen(),
    WishlistScreen(),
    HistoryScreen(),
    FolderScreen(),
    ProfileScreen(),
  ];

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => navigationPagesList[homeController.index.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFFFFF),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: const Color(0xFF939393),
          showSelectedLabels: true,
          showUnselectedLabels: true,

          // unselectedItemColor: Colors.black,
          currentIndex: homeController.index.value,
          onTap: (index) {
            homeController.index.value = index;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black26,
                ),
                label: AppString.home),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black26,
                ),
                label: AppString.wishlist),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_present_outlined,
                  color: Colors.black26,
                ),
                label: AppString.history),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.folder,
                  color: Colors.black26,
                ),
                label: AppString.folder),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.black38,
                ),
                label: AppString.profile),
          ])),

    );
  }
}
