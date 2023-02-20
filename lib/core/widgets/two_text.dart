import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwoText extends StatelessWidget {
  final String text1;
  final String text2;
  final Color textColor1;
  final Color textColor2;
  final double fontSize;
  final Function? onPressed;
   const TwoText({
    Key? key,
    required this.text1,
    required this.text2,
    this.textColor1=Colors.grey,
    required this.textColor2,
    this.fontSize = 13.0,
     this.onPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          maxLines: 1,
          style: TextStyle(
            color: textColor1,
            fontSize: fontSize.sp,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        TextButton(
            onPressed: () {
              onPressed;
            },
            child: Text(
              text2,
              maxLines: 1,
              style: TextStyle(
                color: textColor2,
                fontSize: fontSize.sp,
              ),
            ))
      ],
    );
  }
}
