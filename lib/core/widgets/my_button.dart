import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final String text;
  final double width;
  final Color buttonColor;
   var onPressed;
  final Color fontColor;
  final Color borderColor;
  final double fontSize;
  final double radius;
  final double padding;
   MyButton({
    Key? key,
    required this.text,
    this.width = double.infinity,
    this.buttonColor = Colors.teal,
     this.onPressed,
    this.fontColor = Colors.white,
    this.fontSize = 20,
    this.radius = 5,
    this.borderColor=Colors.teal,
    this.padding=0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      width: width,
      height: 50,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(
          radius,
        ),
        border: Border.all(color: borderColor),
      ),
      child: MaterialButton(
        focusElevation: 0,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
