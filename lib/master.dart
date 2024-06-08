import 'package:cleanapp/core/const/constant.dart';
import 'package:cleanapp/core/firebase_services/firestore_services.dart';
import 'package:cleanapp/feature/Auth/presentation/manager/auth_cubit.dart';
import 'package:cleanapp/feature/Homepage/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/Auth/presentation/view/screen/auth_screen.dart';
import 'feature/profile/presentation/manager/profile_cubit.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(432, 812),
      //designSize: Size(390, 844),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit(FireStoreService())),
          BlocProvider(
              create: (context) =>
                  ProfileCubit(FireStoreService())..getProfile())
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home:HomePage()
          //Constant.uid == null ? const AuthScreen() : HomePage(),
        ),
      ),
    );
  }
}
