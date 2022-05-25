import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter_app/constants/colors_data.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_flutter_app/view/screens/details/widgets/details_body.dart';
import '../../../constants/images.dart';
import '../../../controllers/todo_controller.dart';
import '../../widgets/custom_alert_dialog.dart';

class TodoDetailsScreen extends StatelessWidget {
  final RpTodoModel todoModel;

  const TodoDetailsScreen({
    Key? key,
    required this.todoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                body: 'Are you sure want to delete from todo?',
                confirmBtnColor: kErrorColor,
                onPress: () {
                  Get.find<TodoController>().removeFromTodo(todoModel.id?? 0);
                  Get.back();
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
          )
        ],
      ),
      body: DetailsBody(todoModel: todoModel,),
    );
  }
}
