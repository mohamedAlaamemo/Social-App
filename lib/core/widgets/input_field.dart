import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextInputType textInputType;
  final Function(String value)? onChange;
  final dynamic validator;
  final bool enabled;

   const MyTextInput({
    Key? key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.onChange,
    this.label = '',
    this.enabled = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      validator: validator,
      keyboardType: textInputType,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(label),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}
