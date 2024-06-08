import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../offers/offers_details.dart';
import 'mostrequested_arrow.dart';

class CustomMostRequested extends StatelessWidget {
  CustomMostRequested({
    super.key,
    required this.image,
    required this.title1,
    required this.title3,
  });

  final String image;
  final String title1;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10.w,left: 10.w,top: 10.h),
          child: Container(
            height: 85.h,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(75.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children:[ Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            title1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              //SizedBox(width: 110.w,),
                              Text(
                                "جنيه",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                title3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
//image container
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      image,
                      width: 160.w,
                      height: 90.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 270.w,
          bottom: 0,
          left: 0,
          child: ContainerArrow(onpress: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return OffersDetails(
                image: "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                offername: "نظافه منزليه شامله",
                price: "500",
                area: "100",
                hours: "5",
                rate: "4.5",
              );
            }));
          }),
        ),
      ],
    );
  }
}