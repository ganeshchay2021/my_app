import 'package:get/get.dart';
import 'package:my_app/model/task_model.dart';
import 'package:my_app/routes/app_routes.dart';
import 'package:my_app/view/Task1/botton_nav_bar.dart';
import 'package:my_app/view/Task2/login/login_screen.dart';
import 'package:my_app/view/Task3/api_integration.dart';
import 'package:my_app/view/Task4/add_update_task.dart';
import 'package:my_app/view/first_page.dart';
import 'package:my_app/view/splash/splash_screen.dart';
import 'package:my_app/view/Task4/tasks_pages.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    // Initial splash screen
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),

    // first page
    GetPage(name: AppRoutes.firstScreen, page: () => FirstPage()),

    //bottom Nav bar
    GetPage(name: AppRoutes.bottomNavBar, page: () => BottomNavBar()),

    //login
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),

    //Api integration
    GetPage(name: AppRoutes.apiIntegration, page: () => ApiIntegration()),

    //Task page
    GetPage(name: AppRoutes.taskPage, page: () => TasksPages()),

    //addupdate Task Page
    GetPage(
      name: AppRoutes.addUpdateTask,
      page: () {
        final TaskModel? task = Get.arguments;
        return AddUpdateTasks(task: task);
      },
    ),
  ];
}
