import 'package:get/get.dart';

import '../controllers/todo_controller.dart';
import '../services/repository/todo_repo.dart';
import 'sqlite_db_helper.dart';

Future<void> initDependencyInjection() async {
  // Core
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  Get.lazyPut(
    () => databaseHelper,
    fenix: true,
  );

  // Repositories
  Get.lazyPut(() => TodoRepo(databaseHelper: Get.find(),), fenix: true,);
  //Controllers
  Get.lazyPut(() => TodoController(todoRepo: Get.find(),), fenix: true,);


}
