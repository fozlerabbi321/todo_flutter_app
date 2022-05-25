import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/constants/colors_data.dart';
import 'package:todo_flutter_app/constants/size_config.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/images.dart';
import '../../../constants/style_data.dart';
import '../../../controllers/todo_controller.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/input_form_widget.dart';

class TodoDetailsScreen extends StatelessWidget {
  final RpTodoModel todoModel;

  const TodoDetailsScreen({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  Future<void> _loadData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Get.find<TodoController>().setTextFiledTodoData(
        todoModel,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Todo Details'.tr,
        ),
        actions: [
          IconButton(
            onPressed: () {
              CustomAlertDialog().statusChangeDialog(
                context: context,
                title: 'Delete',
                body: 'Are you sure want to from todo?',
                confirmBtnColor: kErrorColor,
                onPress: () {},
              );
            },
            icon: SizedBox(
              width: 18,
              child: SvgPicture.asset(
                Images.delete,
                color: kBlackColor,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<TodoController>(
        builder: (todoController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeightBox30,
                InputFormWidget(
                  fieldController: todoController.titleController,
                  hintText: 'Enter todo title',
                  title: 'Todo Title',
                ),
                kHeightBox5,
                InputFormWidget(
                  fieldController: todoController.descriptionController,
                  hintText: 'Enter todo description',
                  title: 'Todo Description',
                  maxLines: 3,
                ),
                kHeightBox30,
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: ElevatedButton(
                      child: Text("Update".toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: kWhiteColor,
                              )),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(kSecondaryColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPrimaryColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (todoController.titleController.text.isEmpty) {
                          showCustomSnackBar('Please enter todo title');
                        } else if (todoController
                            .descriptionController.text.isEmpty) {
                          showCustomSnackBar('Please enter todo description');
                        } else {
                          todoController.updateTodo(
                            todoModel.id ?? 0,
                            todoController.titleController.text,
                            todoController.descriptionController.text,
                          );
                        }
                      }),
                ),
                kHeightBox30,
              ],
            ),
          );
        },
      ),
    );
  }
}
