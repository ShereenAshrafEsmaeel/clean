//screen of the container that in the top of home page related to offers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferPart extends StatelessWidget {
  final int balance;
  final String cardNumber;
  final int expiryMonth;
  final color;

  const OfferPart(
      {super.key,
        required this.balance,
        required this.cardNumber,
        required this.expiryMonth,

        this.color});

  @override
  Widget build(BuildContext context) {
    return
      //Container of page view card
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Container(
          padding: EdgeInsets.all(10.w),
          //width: 200.w,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(16.r)),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
            SizedBox(
                  height: 10.h,
                ),
               Text(
                  "خصم",
                  style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),
                ),
                Text("\%" + balance.toString(),
                    style:  TextStyle(color: Colors.black, fontSize: 20.sp,fontWeight: FontWeight.w900)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardNumber,
                      style:  TextStyle(color: Colors.black,fontSize: 20.sp),
                    ),
                    Text(expiryMonth.toString() + "جنيه" ,
                        style:TextStyle(color: Colors.black,fontSize:20.sp))
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
