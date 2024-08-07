import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

flutterFunction({required String text, required Color color})
{
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,

      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
