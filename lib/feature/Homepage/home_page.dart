import 'package:cleanapp/feature/Homepage/Mostrequested/mostrequested.dart';
import 'package:cleanapp/feature/Homepage/categories/custom_category.dart';
import 'package:cleanapp/feature/Homepage/drawer.dart';
import 'package:cleanapp/feature/Homepage/offers/offers_details.dart';
import 'package:cleanapp/feature/Homepage/offers/offers_screen.dart';
import 'package:cleanapp/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'mostrequested/custom_item_mostrequested.dart';
import 'offers/offerpart_homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  //page view controller and smooth page indicator
  final _controller = PageController();

  List Offerdata = [
    OfferModel(
        image:
            "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
        offername: "نظافه منزليه شامله",
        price: "500",
        area: "100",
        hours: "5",
        rate: "4.5"),
    OfferModel(
        image:
            "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
        offername: "نظافه منزليه سطحيه",
        price: "400",
        area: "90",
        hours: "3",
        rate: "3.5"),
    OfferModel(
        image:
            "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
        offername: "نظافه منزليه شامله",
        price: "300",
        area: "100",
        hours: "5",
        rate: "4.5"),
  ];

//============================================================================
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  void setStat(String status) async {
    if (auth.currentUser != null) {
      try {
        await _firestore
            .collection('UsserData')
            .doc(auth.currentUser!.uid)
            .update({
          'status': status,
        });
        print('Status updated successfully: $status');
      } catch (e) {
        print('Error updating status: $e');
      }
    } else {
      print('User not authenticated.');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setStat("Online");
    } else {
      setStat("Offline");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  //==============================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Cleanify",
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        leading: const Image(
          image: AssetImage("assets/images/clean3.png"),
        ),
      ),
      // drawer
      endDrawer:
          const Directionality(textDirection: TextDirection.rtl, child: MyDrawer()),

      body: Stack(children: [
        Container(
          width: 600.w,
          height: double.infinity,
          color: Colors.amber,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            width: 500.w,
            height: 810.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55.r), color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                //======================================

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //see all button
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return const OffersScreen();
                          }));
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[700]),
                        ),
                      ),
                      //===============================
SizedBox(width: 220.w,),
                      //==================================
                      Text(
                        "العروض ",
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),
                Container(
                  height: 150.h,
                  child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: Offerdata.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return OffersDetails(
                                image: Offerdata[index].image,
                                offername: Offerdata[index].offername,
                                price: Offerdata[index].price,
                                area: Offerdata[index].area,
                                hours: Offerdata[index].hours,
                                rate: Offerdata[index].rate);
                          }));
                        },
                        child: const OfferPart(
                          balance: 20,
                          cardNumber: "نظافه منزليه شامله",
                          expiryMonth: 1200,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                /////////////////////////////////////////////////////////////////////////
                //الخدمات
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "الخدمات",
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategoryScreen(
                          imagePath:
                              "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                          buttonText: "نظافه مفروشات"),
                      SizedBox(
                        width: 25.w,
                      ),
                      const CategoryScreen(
                          imagePath:
                              "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                          buttonText: "نظافه منزليه")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                //=========================Most Requested
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const MostRequested();
                            }));
                          },
                          child: Text(
                            "عرض الكل",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey[700]),
                          )),
                      SizedBox(width: 140.w,),
                      Text(
                        "الخدمات الاكثر طلبا",
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                //==============================
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    children: [
                      CustomMostRequested(
                        image:
                            "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                        title1: "نظافه منزليه شامله",
                        title3: "500",
                      ),
                      CustomMostRequested(
                        image:
                            "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                        title1: "نظافه منزليه شامله",
                        title3: "500",
                      ),
                      CustomMostRequested(
                        image:
                            "https://img.freepik.com/free-vector/cleaning-team-with-brooms-vacuum-cleaner-man-woman-uniform-with-professional-equipment-ready-work-together-flat-vector-illustration-cleaning-service-teamwork-occupation-concept_74855-24396.jpg?w=740&t=st=1705064577~exp=1705065177~hmac=e69ceee1727ceaee9899a958b06ef0c75ea849bce40038528d6f1bdb21061618",
                        title1: "نظافه منزليه عميقه",
                        title3: "800",
                      ),
                    ],
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
