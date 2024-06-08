import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cleanapp/feature/Auth/presentation/view/screen/auth_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/const/constant.dart';
import '../../../../Homepage/drawer.dart';
import '../../manager/profile_cubit.dart';
import '../widget/item_profilePage.dart';
import '../widget/small_container_icon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    ProfileCubit.get(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Constant.uid != null
            ? Scaffold(
backgroundColor: Colors.amber,
                //appbar
                appBar: AppBar(

                  title: const Center(
                      child: Text(
                    "الصفحة الشخصية",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),
                  )),
                  elevation: 0,

                  leading: const Image(
                    image: AssetImage("assets/images/clean3.png"),
                  ),
                  backgroundColor: Colors.amber,
                ),
                // drawer
                endDrawer: Directionality(
                    textDirection: TextDirection.rtl, child: MyDrawer()),
                body: ProfileCubit.get(context).userModel != null
                    ? Stack(
                      children:[ SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                            height: 800.h,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                             color: Colors.white
                              // borderRadius: BorderRadius.only(
                              //   bottomRight: Radius.circular(50),
                              // bottomLeft: Radius.circular(50)),
                            ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          // container image and name
                                          Container(
                                            width: width,
                                            height: height * 0.25,
                                          ),

                                          Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                // space
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                // image
                                                const CircleAvatar(
                                                  maxRadius: 45,
                                                  backgroundColor: Colors.grey,
                                                  backgroundImage: NetworkImage(
                                                      "https://img.freepik.com/free-photo/woman-with-arms-crossed-laughing_23-2148666473.jpg?t=st=1717670571~exp=1717674171~hmac=2c11b117334898c9bc32871271f23570b9433b33234a617ae41df113cbc83fde&w=740"),
                                                ),
                        SizedBox(height: 5.h,),
                                                // name
                                                Padding(
                                                  padding:
                                                       EdgeInsets.symmetric(
                                                          horizontal: 40.w),
                                                  child: Container(

                                                    height: 40.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(30),
                                                      color: Colors.amber,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          ProfileCubit.get(context)
                                                              .userModel!
                                                              .firstName!,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight.w900),
                                                        ),
                                                        SizedBox(
                                                          width: 7.w,
                                                        ),
                                                        Text(
                                                          ProfileCubit.get(context)
                                                              .userModel!
                                                              .lastName!,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                      // card of icon and get data
                                      SizedBox(
                                        height: height * 0.70,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: SizedBox(
                                              width: width * 0.9,
                                              height: height * 0.30,
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Directionality(
                                                  textDirection: TextDirection.rtl,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      // for get data

                                                      ItemFieldProfilePage(
                                                        titleName: ProfileCubit.get(
                                                                context)
                                                            .userModel!
                                                            .email!,
                                                        name: 'البريد الالكترونى :',
                                                      ),

                                                      ItemFieldProfilePage(
                                                        titleName: ProfileCubit.get(
                                                                context)
                                                            .userModel!
                                                            .phone!,
                                                        name: 'رقم الهاتف :',
                                                      ),
                                                      ItemFieldProfilePage(
                                                        titleName: ProfileCubit.get(
                                                                context)
                                                            .userModel!
                                                            .location!,
                                                        name: 'الموقع الجغرافى :',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      ///////////////////////////////////////////////////////////
                                    ],
                                  )
                                ],
                              ),
                           ),
                      ),
                    ])
                    : const Center(child: CircularProgressIndicator()))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Image(
                            image: AssetImage("assets/images/clean3.png"))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Have Account",
                          //style: TextStyles.font18grey500weight,
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ProfileScreen();
                              }));
                            },
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return ProfileScreen();
                                  }));
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )))
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create New Account",
                          //  style: TextStyles.font18grey500weight,
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ProfileScreen();
                              }));
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              );
      },
    );
  }
}
