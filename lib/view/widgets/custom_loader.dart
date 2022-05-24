import 'package:flutter/material.dart';
import '../../constants/colors_data.dart';


class CustomLoader extends StatelessWidget {

  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor))),
    );
  }
}
