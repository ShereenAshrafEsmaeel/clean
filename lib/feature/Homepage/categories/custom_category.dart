import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  final String imagePath;
  final String buttonText;

  const CategoryScreen(
      {super.key, required this.imagePath, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //image
        Container(
          height: 95.h,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 40,
                    spreadRadius: 10)
              ]),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image(
                image: NetworkImage(imagePath),
              ),
            ),
          ),
        ),
        Text(
          buttonText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        )
      ],
    );
  }
}
