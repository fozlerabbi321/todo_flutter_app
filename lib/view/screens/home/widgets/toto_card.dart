import 'package:flutter/material.dart';
import 'package:todo_flutter_app/constants/colors_data.dart';
import 'package:todo_flutter_app/models/response/rp_todo_model.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/style_data.dart';

class TodoCard extends StatelessWidget {
  final RpTodoModel todoModel;
  final bool isLast;

  const TodoCard({
    Key? key,
    required this.todoModel,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeightBox10,
        Container(
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
                        onTap: () {},
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
                        'Compete',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: kPaymentStatus, fontSize: 8,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isLast) kHeightBox10,
      ],
    );
  }
}
