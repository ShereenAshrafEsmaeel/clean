import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerArrow extends StatelessWidget {
  ContainerArrow({super.key, required this.onpress});

  Function()? onpress;

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      onPressed: onpress,
      child: Container(
        padding: EdgeInsets.all(5.r),
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back,
          size: 20.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}