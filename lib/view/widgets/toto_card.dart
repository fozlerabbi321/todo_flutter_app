import 'package:flutter/material.dart';
import 'package:todo_flutter_app/constants/colors_data.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';
import '../../constants/size_config.dart';
import '../../constants/strings.dart';
import '../../constants/style_data.dart';

class TodoCard extends StatelessWidget {
  final RpTodoModel todoModel;
  final bool isLast;
  final Function onTap, onStatusTap;

  const TodoCard({
    Key? key,
    required this.todoModel,
    this.isLast = false,
    required this.onTap,
    required this.onStatusTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeightBox10,
        InkWell(
          onTap: onTap as Function(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: SizeConfig.screenWidth,
            child: Card(
              color: Theme.of(context).cardColor,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 1.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            todoModel.title ?? '',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        InkWell(
                          onTap: onStatusTap as Function(),
                          child: Icon(
                            Icons.more_vert,
                            color: Theme.of(context).disabledColor,
                          ),
                        )
                      ],
                    ),
                    kHeightBox10,
                    Text(
                      todoModel.description ?? '',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    kHeightBox10,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            todoModel.dateTime ?? '',
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontSize: 8,
                                    ),
                          ),
                        ),
                        Text(
                          (todoModel.isComplete ?? 0) == completeStatus
                              ? completeStatusTitle
                              : incompleteStatusTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                color:
                                    (todoModel.isComplete ?? 0) == completeStatus
                                        ? kPrimaryColor
                                        : kErrorColor,
                                fontSize: 8,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLast) kHeightBox10,
      ],
    );
  }
}
