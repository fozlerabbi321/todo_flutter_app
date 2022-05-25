import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors_data.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/style_data.dart';
import '../../../../controllers/todo_controller.dart';
import '../../../../models/response/rp_todo_model.dart';
import '../../../widgets/input_form_widget.dart';

class DetailsBody extends StatefulWidget {
  final RpTodoModel todoModel;

  const DetailsBody({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  Future<void> _loadData() async {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Get.find<TodoController>().setTextFiledTodoData(
        widget.todoModel,
      );
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
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
                          todoController.selectedTodoModel?.id ?? 0,
                          todoController.titleController.text,
                          todoController.descriptionController.text,
                          isMobile: SizeConfig.isMobile() ? true : false,
                        );
                      }
                    }),
              ),
              kHeightBox30,
            ],
          ),
        );
      },
    );
  }
}
