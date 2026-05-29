import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.firstScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.flutter_dash, size: 100.sp, color: Colors.amber),
      ),
    );
  }
}
