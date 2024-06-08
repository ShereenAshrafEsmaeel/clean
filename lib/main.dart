import 'package:cleanapp/core/helpers/cached.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'master.dart';


Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,


  );
  await CacheHelper.init();

  runApp(MyApp());
}