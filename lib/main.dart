import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/bindings/bindings_controller.dart';
import 'package:my_app/routes/app_pages.dart';
import 'package:my_app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerBindings(),
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        getPages: AppPages.pages,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
