import 'package:flutter/material.dart';
import 'package:todo_flutter_app/constants/colors_data.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/style_data.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
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
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Toto title',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).disabledColor,
                        ),
                      )
                    ],
                  ),
                  kHeightBox10,
                  Text(
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  kHeightBox10,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '03 Jun 2022 02:30 PM',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Text(
                        'Compete',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: kPaymentStatus
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
