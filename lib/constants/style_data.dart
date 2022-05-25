import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors_data.dart';
import 'size_config.dart';

//app main them
const kBrightnessTheme = Brightness.light;

///start
//FontWeight
const weight400 = FontWeight.w400;
const weight500 = FontWeight.w500;
const weightBold = FontWeight.bold;

//SizedBox Height
final kHeightBox5 = SizedBox(height: getProportionateScreenHeight(5));
final kHeightBox8 = SizedBox(height: getProportionateScreenHeight(8));
final kHeightBox10 = SizedBox(height: getProportionateScreenHeight(10));
final kHeightBox15 = SizedBox(height: getProportionateScreenHeight(15));
final kHeightBox20 = SizedBox(height: getProportionateScreenHeight(20));
final kHeightBox25 = SizedBox(height: getProportionateScreenHeight(25));
final kHeightBox30 = SizedBox(height: getProportionateScreenHeight(30));
final kHeightBox40 = SizedBox(height: getProportionateScreenHeight(40));

//SizedBox Width
final kWidthBox5 = SizedBox(width: getProportionateScreenHeight(5));
final kWidthBox10 = SizedBox(width: getProportionateScreenHeight(10));
final kWidthBox15 = SizedBox(width: getProportionateScreenHeight(15));
final kWidthBox20 = SizedBox(width: getProportionateScreenHeight(20));

//Axis Alignment
const crossAxisCenter = CrossAxisAlignment.center;
const mainAxisCenter = MainAxisAlignment.center;
const mainAxisStart = MainAxisAlignment.start;
const crossAxisStart = CrossAxisAlignment.start;
const mainAxisSpaceBetween = MainAxisAlignment.spaceBetween;

//Container BoxDecoration

BoxDecoration containerBoxDecoration(
    {required double borderRadius, Color? color, List<BoxShadow>? boxShadow}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: color,
    boxShadow: boxShadow,
  );
}

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      maxWidth: 1170,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(10),
      borderRadius: 5,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}

Text textRoboto(String title, Color color,
    {double? fontSize,
    FontWeight? fontWeight,
    int? maxLine,
    TextDecoration? textDecoration}) {
  return Text(
    title,
    style: GoogleFonts.roboto(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      decoration: textDecoration,
    ),
    maxLines: maxLine ?? 1,
    overflow: TextOverflow.ellipsis,
    softWrap: false,
  );
}

const TextStyle bodyUnseenText1 = TextStyle(
    color: Color(0xff686795),
    fontSize: 14,
    letterSpacing: 1.2,
    fontWeight: FontWeight.bold);

final otpInputDecoration = InputDecoration(
  fillColor: kWhiteColor,
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide:  const BorderSide(color: kOrdinaryColor),
  );
}
