import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/controllers/todo_controller.dart';
import 'package:todo_flutter_app/view/widgets/custom_loader.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/size_config.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/input_form_widget.dart';
import 'widgets/toto_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TodoController>().getAllTodoList();
    return Scaffold(
      appBar: AppBar(
        title: InputFormWidget(
          prefixIcon: Icons.search,
          hintText: 'Search...',
          borderColor: kPrimaryColor,
          maxLines: 1,
          radius: 30,
          borderWidth: 1.0,
          absorbing: true,
          height: getProportionateScreenHeight(38),
          onConfirm: (value) {},
        ),
      ),
      body: GetBuilder<TodoController>(
        builder: (todoController) {
          return todoController.isListLoading
              ? const Center(child: CustomLoader())
              : todoController.todoList.isEmpty
                  ? Center(
                      child: Text(
                        'No todo available',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )
                  : ListView.builder(
                      itemCount: todoController.todoList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: TodoCard(
                            todoModel: todoController.todoList[index],
                            isLast: index == todoController.todoList.length - 1
                                ? true
                                : false,
                          ),
                        );
                      },
                    );
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
