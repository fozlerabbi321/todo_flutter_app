
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/view/widgets/todo_list_widget.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../controllers/todo_controller.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/input_form_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  Future<void> _loadData({
    String search = '',
    bool isSearch = false,
  }) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Get.find<TodoController>().getAllTodoList(
        search: search,
        isSearch: isSearch,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadData(
      isSearch: true,
    );

    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.isMobile() ? 58 : 70,
        title: SizeConfig.isMobile()
            ? InkWell(
                onTap: () {
                  Get.to(
                    () => const SearchScreen(),
                  );
                },
                child: InputFormWidget(
                  fieldController: searchController,
                  prefixIcon: Icons.search,
                  hintText: 'Search...',
                  borderColor: kPrimaryColor,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  radius: 30,
                  borderWidth: 1.0,
                  height: getProportionateScreenHeight(38),
                  onConfirm: (String? s) async {
                    await _loadData(
                      search: searchController.text,
                      isSearch: true,
                    );
                  },
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(
                          () => const SearchScreen(),
                        );
                      },
                      child: InputFormWidget(
                        fieldController: searchController,
                        prefixIcon: Icons.search,
                        hintText: 'Search...',
                        borderColor: kPrimaryColor,
                        maxLines: 1,
                        textInputAction: TextInputAction.search,
                        radius: 30,
                        borderWidth: 1.0,
                        height: getProportionateScreenHeight(38),
                        onConfirm: (String? s) async {
                          await _loadData(
                            search: searchController.text,
                            isSearch: true,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Todo Details'.tr,
                            ),
                          ),
                        ),
                        GetBuilder<TodoController>(builder: (todoController) {
                          return IconButton(
                            onPressed: () {
                              CustomAlertDialog().statusChangeDialog(
                                context: context,
                                title: 'Delete',
                                body: 'Are you sure want to delete from todo?',
                                confirmBtnColor: kErrorColor,
                                onPress: () {
                                  Get.find<TodoController>().removeFromTodo(
                                      todoController.selectedTodoModel?.id ?? 0, isSearch: true, search: searchController.text,);
                                  Get.back();
                                },
                              );
                            },
                            icon: SizedBox(
                              width: 18,
                              child: SvgPicture.asset(
                                Images.delete,
                                color: kBlackColor,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
      ),

      body: GetBuilder<TodoController>(
        builder: (todoController) {
          return todoController.isListLoading
              ? const Center(child: CustomLoader())
              : TodoListWidget(
                  todoList: todoController.todoSearchList,
                  isSearch: true,
                  searchText: searchController.text);
        },
      ),
    );
  }
}
