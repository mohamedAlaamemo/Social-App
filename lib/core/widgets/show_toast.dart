
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
void displaySuccessMotionToast(context, {required String mes}) {
  MotionToast.success(
    title:  Text(
      'Success',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    description:  Text(
      mes,
      style: TextStyle(fontSize: 12),
    ),
    layoutOrientation: ToastOrientation.rtl,
    animationType: AnimationType.fromRight,
    dismissable: true,
  ).show(context);
}

void displayErrorMotionToast(context, {required String mes}) {
  MotionToast.error(
    title: const Text(
      'Error',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    description:  Text(mes),
    position: MotionToastPosition.top,
    barrierColor: Colors.black.withOpacity(0.3),
    width: 300,
    height: 80,
    dismissable: false,
  ).show(context);
}
void ShowSnackBar(context,{
  required String massage,
  Color texColor=Colors.black,
  Color backColor=Colors.white

}){
  FloatingSnackBar(
    message: massage,
    context: context,
    textColor:texColor ,
    backgroundColor: backColor,
    duration:  const  Duration(milliseconds:  4000),
  );
}


void ShowToast({
  required String mes
})
{

  Fluttertoast.showToast(
      msg: mes,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
       backgroundColor: Colors.transparent,
       textColor: Colors.teal,
      fontSize: 16.0
  );
}