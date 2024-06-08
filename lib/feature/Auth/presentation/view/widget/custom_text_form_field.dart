import 'package:flutter/material.dart';

import '../../../../../core/theming/color.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
    this.keyboardType,
    this.obsocure = false,
    this.validator,
    required this.controller,
    this.color,
    this.suffixIcon,
    this.suffixPressed,
    this.maxLine = 1,
  });

  final String label;
  String? hint;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  Icon? prefixIcon;
  IconButton? suffixIcon;
  VoidCallback? suffixPressed;
  TextInputType? keyboardType;
  bool obsocure;

  String? validator;
  final TextEditingController controller;
  dynamic color;
  int maxLine;

  @override
  Widget build(BuildContext context) {
    return
       TextFormField(
      maxLines: maxLine,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        label: Text(label),
        hintText: hint,
        labelStyle: TextStyle(fontSize: 15, color: Colors.blueAccent),
        hintStyle: TextStyle(fontSize: 14, color: ColorManger.textColor1),
        prefixIcon: prefixIcon,
        prefixStyle: const TextStyle(color: Colors.black),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
          //background TextFormField ====>>> white
          borderSide: BorderSide(color: ColorManger.textColor1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
          borderSide: BorderSide(color: ColorManger.textColor1),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsocure,
      validator: (value) {
        if (value!.isEmpty) {
          return validator;
        }
      },
    );
  }
}
