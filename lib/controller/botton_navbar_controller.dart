import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/Task1/pages/home_screen.dart';
import 'package:my_app/view/Task1/pages/map_screen.dart';
import 'package:my_app/view/Task1/pages/profile_screen.dart';
import 'package:my_app/view/Task1/pages/setting_screen.dart';
import 'package:my_app/view/Task1/pages/transfer_screen.dart';

class BottonNavbarController extends GetxController {
  RxInt currentIndex = 4.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  static List<Widget> pages = const [
    HomeScreen(),
    MapScreen(),
    TransferScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];
}
