import 'package:cleanapp/core/helpers/cached.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'master.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //sharedPreferences=await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  runApp(const MyApp());
}
