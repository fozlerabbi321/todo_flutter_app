import 'package:flutter/material.dart';

import '../../../constants/colors_data.dart';
import '../../../constants/size_config.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/input_form_widget.dart';
import 'widgets/toto_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InputFormWidget(
          prefixIcon: Icons.search,
          hintText: 'Search...',
          borderColor: kPrimaryColor,
          maxLines: 1,
          radius: 30,
          borderWidth: 1.0,
          absorbing: true,
          height: getProportionateScreenHeight(38),
          onConfirm: (value) {
          },
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){},
              child: const TodoCard(
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          CustomAlertDialog().addTodoDialog(
            context: context,
            onPress: () {},
          );
        },
        tooltip: 'Add',
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, color: kWhiteColor,),
      ),
    );
  }
}
