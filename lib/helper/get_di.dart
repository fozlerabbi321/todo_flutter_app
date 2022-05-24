import 'package:get/get.dart';

import 'sqlite_db_helper.dart';

Future<void> initDependencyInjection() async {
  // Core
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  Get.lazyPut(() => databaseHelper, fenix: true,);
}
