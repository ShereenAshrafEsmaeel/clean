import 'package:cleanapp/feature/Auth/forgetpassword_screen.dart';
import 'package:cleanapp/feature/Homepage/home_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/const/constant.dart';
import '../../../../../core/helpers/cached.dart';
import '../../../../../core/theming/color.dart';
import '../widget/custom_text_form_field.dart';
import '../../manager/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  bool isMale = true;
  bool isSignUpScreen = true;
  bool passwordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey();

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  clear() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Form(
          key: loginKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //email
                CustomTextFormField(
                  prefixIcon: const Icon(
                    EvaIcons.emailOutline,
                    color: ColorManger.iconColor,
                  ),
                  keyboardType: TextInputType.text,
                  hint: "برجاء ادخال البريد الالكترونى الخاص بك",
                  label: "البريد الالكترونى",
                  controller: emailController,
                  validator: 'Please Enter your Email',
                ),
      
                SizedBox(
                  height: 10.h,
                ),
      
                //password
                CustomTextFormField(
                  prefixIcon: const Icon(
                    EvaIcons.lockOutline,
                    color: ColorManger.iconColor,
                  ),
                  hint: "برجاء ادخال كلمه المرور الخاصه بك",
                  label: "كلمه المرور",
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: 'Please Enter your Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: ColorManger.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  obsocure: _passwordVisible,
                ),
            SizedBox(height: 25,),
                //container of arrow submit
               GestureDetector(
                 onTap: () {
                   if (loginKey.currentState!.validate()) {
                     AuthCubit.get(context)
                         .loginFunction(
                         email: emailController.text,
                         password: passwordController.text,
                         ctx: context)
                         .then((value) {
                       clear();
      
                       /* flutterFunction(
                                      color: Colors.greenAccent,
                                      text: "Login Done"); */
      
                       CacheHelper.saveData(key: "uid", value: FirebaseAuth.instance.currentUser!.uid);
      
                       Constant.uid = CacheHelper.getData(key: "uid");
                       print("UId is =====>>>>> ${Constant.uid}");
      
                       // ProfileCubit.get(context).getProfile();
      
                       // navigateTo(context, const MyHomePageChosse());
      
                     });
                   }
                 },
                child: Container(height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    //color: ColorManger.buttonColor
                    gradient: LinearGradient(
                      colors: [
                        Colors.amber.shade400,
                        Colors.red.shade200,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800,color: Colors.white),
                    ),
                  ),),
               ),
                //forget password
                Container(
                  margin: const EdgeInsets.only(left: 160),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_){
                        return ForgetPasswordPage();
                      }));
                    },
                    child: const Text("هل نسيت كلمة المرور؟",style: TextStyle(color: Colors.blueAccent),),
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }
}



