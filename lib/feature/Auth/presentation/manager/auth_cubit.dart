import 'package:bloc/bloc.dart';
import 'package:cleanapp/core/firebase_services/firestore_services.dart';
import 'package:cleanapp/core/helpers/cached.dart';
import 'package:cleanapp/feature/Auth/presentation/view/widget/toast.dart';
import 'package:cleanapp/feature/Homepage/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import '../../../profile/presentation/manager/profile_cubit.dart';
import '../view/screen/auth_screen.dart';
import '../view/screen/login_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.fireStoreService) : super(AuthInitial());

  //calling
  static AuthCubit get(context) => BlocProvider.of(context);
  FireStoreService fireStoreService;

  //====================================================================

  CollectionReference usserData =
      FirebaseFirestore.instance.collection("UsserData");
  //=====================================================================





  Future<void> loginFunction(
      {required String email,
      required String password,
      required BuildContext ctx}) async {
    try {
      emit(LoginLoading());
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var uid = userCredential.user!.uid;

      if (uid.isNotEmpty) {
        CacheHelper.saveData(key: "uid", value: uid);
        Navigator.push(ctx, MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
        Fluttertoast.showToast(
            msg: "LOGIN SUCCESS",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (uid.isEmpty) {
        print("your account not found");
      }

      emit(LoginSuccess());
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        print("no user found with this email");
      } else if (error.code == "wrong-password") {
        print("wrong-password provide to this email");
      } else if (error.code == "invalid-email") {
        flutterFunction(text: "Your input is not true", color: Colors.red);
        print("Your input is not true");
      } else if (error.code == "invalid-credential") {
        flutterFunction(
            text: "your email or password is incorrect", color: Colors.red);
        print("your email or password is incorrect");
      } else if (error.code == "The email address is badly formatted") {
        flutterFunction(
            text: "The email address is badly formatted", color: Colors.red);
        print("The email address is badly formatted");
      }
      print(error);
      print(" error code is ====>>>>> ${error.code}");
      print("error mes is ======>>>>> ${error.message}");
      emit(LoginError());
    }
  }

///////////////////////////////////////////////////////////

  Future<void> registerFunction({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String location,
    // required String day,
    //required String month,
    //required String year,
    //required String type,
  }) async {
    try {
      emit(RegisterLoading());
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
      var uid = userCredential.user!.uid;
      await fireStoreService.setDoc(model: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "location": location,
        //"day": day,
        //"month": month,
        //"year": year,
        //"type": type,
      }, uId: uid, collectionReference: usserData).then((value) {
        CacheHelper.saveData(key: "uid", value: uid);

        ProfileCubit.get(context).getProfile();

        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return AuthScreen();
        }));
      });
      emit(DataSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("please Enter Strong Password");
      } else if (e.code == "email-already-in-use") {
        print("this account is already exists ");
      }

      print(e);
      print(" error code is ====>>>>> ${e.code}");
      print("error mes is ======>>>>> ${e.message}");
      emit(RegisterError());
    }
  }

//==============================================================================



  //reset password

  Future resetPassword(
      {required String email, required BuildContext context}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        flutterFunction(text: 'Password Reset Email Sent', color: Colors.green);
        //Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return AuthScreen();
        }));
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

//================================================================================
}
