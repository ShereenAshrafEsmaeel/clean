import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/constant.dart';
import 'custom_ratingbar.dart';
import '../Auth/presentation/view/screen/auth_screen.dart';
import '../profile/presentation/manager/profile_cubit.dart';
import '../profile/presentation/view/screen/profile_screen.dart';

class RatingsAndReviewsScreen extends StatefulWidget {
  @override
  _RatingsAndReviewsScreenState createState() =>
      _RatingsAndReviewsScreenState();
}

class _RatingsAndReviewsScreenState extends State<RatingsAndReviewsScreen> {
  final CollectionReference reviews =
      FirebaseFirestore.instance.collection('reviews');
  final TextEditingController commentController = TextEditingController();
  double rating = 0.0;

  //==========================================
  void _submitReview() {
    reviews.add({
      //'ui':Constant.uid,
      'rating': rating,
      'comment': commentController.text,
    });
//================================================================
    // Clear the input fields after submitting
    commentController.clear();
    setState(() {
      rating = 0.0;
    });
  }

//===================================================================
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
    builder: (context, state) {
    return Constant.uid != null
    ? Scaffold(
        appBar: AppBar(
          title: const Text('الشكاوى و الاقتراحات'),
          centerTitle: true,
        ),
        body: ProfileCubit.get(context).userModel != null
            ? Column(
                children: [
                  // UI for submitting reviews
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ':تقييمك للخدمة',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Ratingbar(
                            onRatingChanged: (value) =>
                                setState(() => rating = value),
                          ),
                          SizedBox(height: 16.0.h),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              controller: commentController,
                              decoration: InputDecoration(
                                  hintText: 'رأيك يهمنا ...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 16),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: Colors.blue, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Icon(
                                    Icons.comment_outlined,
                                    color: Colors.grey[400],
                                  )),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _submitReview();
                            },
                            child: Text('تقييم'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // UI for displaying reviews
                  Expanded(
                    child: StreamBuilder(
                      stream: reviews.snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                        var reviewsList = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: reviewsList.length,
                          itemBuilder: (context, index) {
                            var review = reviewsList[index].data()
                                as Map<String, dynamic>;
                            // UI to display each review
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Card(

                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  leading: Column(

                                    children: [

                                      CircleAvatar(
                                          child: Text(
                                        ProfileCubit.get(context)
                                            .userModel!
                                            .firstName!
                                            .substring(0, 2),
                                      )),
                                      Text(
                                        ProfileCubit.get(context)
                                            .userModel!
                                            .firstName!,
                                      )

                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text('Rating: ${review['rating']}'),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber[500],
                                        size: 18,
                                      )
                                    ],
                                  ),
                                  title: Text(review['comment']),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
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
                        const Text(
                          " Have Account",
                          //style: TextStyles.font18grey500weight,
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return const ProfileScreen();
                              }));
                            },
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return const ProfileScreen();
                                  }));
                                },
                                child:  Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                )))
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Create New Account",
                          //  style: TextStyles.font18grey500weight,
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return const AuthScreen();
                              }));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              );
        });
  }
}
