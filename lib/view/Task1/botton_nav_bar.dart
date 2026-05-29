import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/botton_navbar_controller.dart';
import 'package:my_app/utils/assets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final controller = Get.find<BottonNavbarController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => BottonNavbarController.pages[controller.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          elevation: 1,
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
          iconSize: 30.sp,
          selectedFontSize: 14.sp,
          unselectedFontSize: 12.sp,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Transfer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.green.shade300,
                child: CircleAvatar(
                  radius: 18.sp,
                  backgroundImage: AssetImage(Assets.myImage),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
