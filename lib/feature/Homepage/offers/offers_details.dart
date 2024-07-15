import 'package:cleanapp/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer.dart';

class OffersDetails extends StatelessWidget {
  OffersDetails({
    super.key,
    required this.image,
    required this.offername,
    required this.price,
    required this.area,
    required this.hours,
    required this.rate,
  });

  String image;
  String offername;
  String price;
  String area;
  String hours;
  String rate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "تفاصيل العروض",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),
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
      // drawer
      endDrawer: const Directionality(
          textDirection: TextDirection.rtl, child: MyDrawer()),
      //===============================================

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: 432.w,
              height: 170.h,
              child: Stack(
                children: [
                  //image
                  Positioned(
                    top: 100,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 700.h,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r))),
                    ),
                  ),
                  //image
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.amber[500]!,
                              blurRadius: 20,
                              offset: const Offset(0, 5)),
                        ],
                        borderRadius: BorderRadius.circular(250.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(250.r),
                        child: Image(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                          width: 140.w,
                          height: 140.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //container of all details
            Container(
              height: 700.h,
              color: Colors.white,
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              offername,
                              style: TextStyle(
                                  fontSize: 23.sp, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [ Text(
                                  "جنيه ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.indigo,
                                      fontSize: 18.sp),
                                ),
                                Text(
                                  price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.indigo,
                                      fontSize: 20.sp),
                                ),
                              ],
                            ),
                            //service features
                             Text(
                              "مميزات العرض",
                              style: TextStyle(
                                  fontSize: 23.sp, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.r)),
                                  color: Colors.amber[100],
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber),
                                      Text(rate),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.r)),
                                  color: Colors.amber[100],
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.alarm_sharp,
                                          color: Colors.red),
                                      Text(hours),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100.r)),
                                  color: Colors.amber[100],
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.home_outlined,
                                          color: Colors.indigo),
                                      Text(area),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          Text(
                              "الخدمة تضمن",
                              style: TextStyle(
                                  fontSize: 23.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ":الريسبشن و غرف المعيشه",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                             Text(
                              " كنس و مسح كل الارضيات -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            Text(
                              " كنس و تنفيض السجاد و مسح اسفله -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                          Text(
                              "تزعيف الحوائط و السقف -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                             Text(
                              "تلميع الطاولات والانتيكات والاثاث -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            Text(
                              " تنضيف الشبابيك و الزجاج من الاتربه -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                             Text(
                              "كنس و تنضيف اسفل الاثاث -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            const Text(
                              "غسيل النجف و البلكونات -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),

                            const Text(
                              ":غرف النوم",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text(
                              " كنس و مسح و تنضيف الارضيات -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              " تغيير فرش السرائر -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              "تزعيف الحوائط و السقف -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              "تنضيف المرايات و ترتيب الغرفه -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              " تنضيف الشبابيك و الزجاج من الاتربه -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              "كنس و تنضيف اسفل الاثاث -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Text(
                              "غسيل النجف و البلكونات -",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //==============================================================
            Stack(
              children: [
                Container(
                  height: 30.h,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r)),
                  ),
                ),
                Center(
                  child: Container(
                    height: 40.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.amber[500]!,
                            blurRadius: 20,
                            offset: const Offset(0, 5)),
                      ],
                      borderRadius: BorderRadius.circular(250.r),
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_){
                          return const BookingPage();
                        }));
                      },
                      child: Text(
                        "احجز الان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23.sp),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
