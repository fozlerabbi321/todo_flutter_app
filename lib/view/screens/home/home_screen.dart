import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/controllers/todo_controller.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/size_config.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/input_form_widget.dart';
import '../../widgets/todo_list_widget.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TodoController>().getAllTodoList();
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: (){
            Get.to(() => const SearchScreen(),);
          },
          child: InputFormWidget(
            prefixIcon: Icons.search,
            hintText: 'Search...',
            borderColor: kPrimaryColor,
            maxLines: 1,
            radius: 30,
            borderWidth: 1.0,
            absorbing: true,
            height: getProportionateScreenHeight(38),
          ),
        ),
      ),
      body: GetBuilder<TodoController>(
        builder: (todoController) {
          return todoController.isListLoading
              ? const Center(child: CustomLoader())
              : TodoListWidget(todoList: todoController.todoList,);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomAlertDialog().addTodoDialog(
            context: context,
          );
        },
        tooltip: 'Add',
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
