import 'package:cleanapp/feature/Homepage/offers/offers_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Mostrequested/mostrequested_arrow.dart';

//page of items of most requested screen
class CustomOffers extends StatelessWidget {
  CustomOffers(
      {super.key,
      required this.image,
      required this.title1,
      //     required this.title2,
      required this.title3,
      required this.title4});

  String image;
  String title1;

  // String title2;
  String title3;
  String title4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          // The Container it's color indigo[300]
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(75),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Column Of Titles
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title1,
                          style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        /* Text(
                          title2,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ), */

                        ////////////////////////////////////////////////////////

                        //Row Of Price
                        Row(
                          children: [
                            Text(
                              "جنيه",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              title3,
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const Text(
                              " بدلا من ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "جنيه",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              title4,
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                    //========================================
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                //====================================================
                //image Container
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    // width: 130,height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(image),
                      ),
                    )),
                //====================================================
              ],
            ),
          ),
        ),
        // The Positioned Of The Arrow
        Positioned(
            right: 300,
            bottom: 0,
            left: 0,
            child: ContainerArrow(onpress: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return OffersDetails(
                    image:
                        "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                    offername: "نظافه منزليه شامله",
                    price: "500",
                    area: "100",
                    hours: "5",
                    rate: "4.5");
              }));
            })),
      ],
    );
  }
}
