import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/controllers/todo_controller.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';

import '../../constants/strings.dart';
import '../screens/details/todo_details_screen.dart';
import 'toto_card.dart';
import 'custom_alert_dialog.dart';

class TodoListWidget extends StatelessWidget {
  final List<RpTodoModel> todoList;
  final bool isSearch;
  final String searchText;

  const TodoListWidget({
    Key? key,
    required this.todoList,
    this.isSearch = false,
    this.searchText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: todoList.isEmpty
          ? Center(
              child: Text(
                'No todo available',
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          : ListView.builder(
              itemCount: todoList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return TodoCard(
                  onTap: () => Get.to(
                    () => TodoDetailsScreen(
                      todoModel: todoList[index],
                    ),
                  ),
                  onStatusTap: () {
                    CustomAlertDialog().statusChangeDialog(
                      context: context,
                      title: 'Change Status!',
                      body: 'Are you sure want to change status?',
                      onPress: () {
                        Get.find<TodoController>().updateTodoStatus(
                          todoList[index].id ?? 0,
                          (todoList[index].isComplete ?? 0) == completeStatus
                              ? incompleteStatus
                              : completeStatus,
                          isSearch: isSearch,
                          search: searchText,
                        );
                      },
                    );
                  },
                  todoModel: todoList[index],
                  isLast: index == todoList.length - 1 ? true : false,
                );
              },
            ),
    );
  }
}
