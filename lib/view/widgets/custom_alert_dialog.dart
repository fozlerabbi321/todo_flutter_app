import 'package:flutter/material.dart';
import '../../constants/colors_data.dart';
import '../../constants/style_data.dart';
import 'input_form_widget.dart';

class CustomAlertDialog {

  addTodoDialog({
    required BuildContext context,
    required Function onPress,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        final  titleController = TextEditingController();
        final  descriptionController = TextEditingController();
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 10.0, top: 10, right: 10),
                    child: Center(
                      child: Text(
                        'Add New Todo',
                        style: Theme.of(context).textTheme.subtitle1
                      ),
                    ),
                  ),
                ),
                kHeightBox30,
                InputFormWidget(
                  fieldController: titleController,
                  hintText: 'Enter todo title',
                  title: 'Todo Title',
                ),
                InputFormWidget(
                  fieldController: descriptionController,
                  hintText: 'Enter todo description',
                  title: 'Todo Description',
                ),
                kHeightBox20,
                Row(
                  children: [
                    kWidthBox10,
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: kBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style:
                            Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: kBlackColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    kWidthBox10,
                    Expanded(
                      child: InkWell(
                        onTap: onPress as void Function(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            "Save",
                            style:
                            Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: kWhiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    kWidthBox10,
                  ],
                ),
                kHeightBox20,
              ],
            ),
          ),
        );
      },
    );
  }
}