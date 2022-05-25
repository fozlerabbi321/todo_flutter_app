import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/view/widgets/todo_list_widget.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/size_config.dart';
import '../../../controllers/todo_controller.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/input_form_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  Future<void> _loadData({
    String search = '',
    bool isSearch = false,
  }) async {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Get.find<TodoController>().getAllTodoList(search: search, isSearch: isSearch,);
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadData(isSearch: true,);

    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: InputFormWidget(
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
            await _loadData(search: searchController.text, isSearch: true,);
          },
        ),
      ),
      body: GetBuilder<TodoController>(
        builder: (todoController) {
          return todoController.isListLoading
              ? const Center(child: CustomLoader())
              : TodoListWidget(todoList: todoController.todoSearchList, isSearch: true, searchText: searchController.text);
        },
      ),
    );
  }
}
