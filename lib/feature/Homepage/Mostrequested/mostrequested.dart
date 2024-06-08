import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_item_mostrequested.dart';

class MostRequested extends StatefulWidget {
  const MostRequested({super.key});

  @override
  State<MostRequested> createState() => _MostRequestedState();
}

class _MostRequestedState extends State<MostRequested> {

  List<String> images = [
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
    "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",

  ];
  List<String> titles1=[
    "نظافه منزليه شامله",
    "نظافه منزليه شامله",
    "نظافه منزليه شامله",
    "نظافه منزليه شامله",
    "نظافه منزليه شامله",
    "نظافه منزليه شامله",  "نظافه منزليه شامله",
  ];
 /* List<String> titles2=[
    ":السعر",
    ":السعر",
    ":السعر",
    ":السعر",
    ":السعر",
    ":السعر",
    ":السعر",
  ]; */
  List<String> titles3=[
    "800",
    "800",
    "800",
    "800",
    "800",
    "800",
    "800",
  ];
 /* List<String> titles4=[
    "500",
    "500",
    "500",
    "500",
    "500",
    "500",
    "500",
  ]; */



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "الخدمات الاكثر طلبا",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),

      body:

      Stack(
        children:[ Container(
          width: 600.w,
          height: double.infinity,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.r), color: Colors.white,),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height:680.h,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: titles1.length ,
                      itemBuilder: (context, index) {
                        return CustomMostRequested(
                            image: images[index],
                            title1: titles1[index],
                            // title2: titles2[index],
                            title3: titles3[index],
                           // title4: titles4[index]
                        );

                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

