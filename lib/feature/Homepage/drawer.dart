import 'package:cleanapp/feature/Homepage/home_page.dart';
import 'package:cleanapp/feature/Homepage/offers/offers_screen.dart';
import 'package:cleanapp/feature/profile/presentation/view/screen/profile_screen.dart';
import 'package:cleanapp/feature/rating/rating_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/const/constant.dart';
import '../Auth/presentation/view/screen/auth_screen.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(

      backgroundColor: Colors.indigo[50],
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "L O G O",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          ListTile(
            title: const Text('الصفحة الرئيسية'),
            leading: const Icon(Icons.home_outlined),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return HomePage();
              }));
            },
          ),
          ListTile(
            title: const Text('الصفحة الشخصية'),
            leading: const Icon(Icons.person),
            onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return ProfileScreen();
                }));
            },
          ),
          ListTile(
            title: const Text('تسجيل الدخول'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return AuthScreen();
              }));
            },
          ),
          ListTile(
            title: const Text('نظافه منزليه'),
            leading: const Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: const Text('نظافه المفروشات'),
            leading: const Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: const Text('العروض المخفضه'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return OffersScreen();
              }));
            },
          ),
          ListTile(
            title: const Text('الاكثر طلبا'),
            leading: const Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: const Text('الشكاوى و الاقتراحات'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  return RatingsAndReviewsScreen();
              }));
            },
          ),

          SizedBox(
            height:95,
          ),
          ListTile(
            title: const Text('تسجيل الخروج'),
            leading: const Icon(Icons.logout),
            onTap: () {
              FirebaseFirestore
                  .instance
                  .collection(
                  'UsserData')
                  .doc(Constant.uid)
                  .delete()
                  .then((value) {
                Constant.uid = null;
                print('log out done');
                Navigator.of(
                    context)
                    .push(
                    MaterialPageRoute(
                        builder:
                            (_) {
                          return AuthScreen();
                        }));
              });
            },
          ),
        ],
      ),
    );
  }
}
