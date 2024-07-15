import 'package:cleanapp/feature/Auth/presentation/view/screen/login_screen.dart';
import 'package:cleanapp/feature/Auth/presentation/view/screen/register_screen.dart';
import 'package:cleanapp/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../widget/custom_text_form_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isMale = true;
  bool isSignUpScreen = true;
  bool passwordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> signUpKey = GlobalKey();
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
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //amber Container
        Positioned(
          child: Container(
              width: 432.w,
              height: 500.h,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.indigo.shade300,
                        blurRadius: 40,
                        spreadRadius: 1)
                  ])),
        ),
        //image
        Positioned(
          right: 0,
          top: 10,
          left: 230,
          child: Image(
            image: const AssetImage("assets/images/clean3.png"),
            fit: BoxFit.cover,
            width: 300.w,
            height: 300.h,
          ),
        ),
        //Text Part
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(left: 27, top: 60),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: "مرحبا",
                      style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          text: (isSignUpScreen)
                              ? " بك فى \n Cleanify    "
                              : " بعودتك ",
                          style: const TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        TextSpan(
                          text: (!isSignUpScreen)
                              ? "\n \n                               من نحن؟ \n"
                              : null,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        TextSpan(
                          text: (!isSignUpScreen)
                              ? "                نحن هنا لتوفير تجربة تنظيف مميزة لك\n حيث يمكنك اختيار الخدمات التى تحتاجها بسهوله        \nدعنا نساعدك في جعل منزلك نظيفا بكل راحه و ثقه"
                              : null,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
        //container of login and sign up section
        Positioned(
            top: isSignUpScreen ? 170.h : 300.h,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              //curve: Curves.bounceInOut,
              padding: const EdgeInsets.all(20),
              height: isSignUpScreen ? 600.h : 315.h,
              width: MediaQuery.of(context).size.width - 40.w,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                S.of(context).login,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isSignUpScreen
                                        ? Colors.grey
                                        : Colors.blueAccent),
                              ),
                              /* if(!isSignUpScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2.h,
                                width: 55.w,
                                color: Colors.orange,
                              )*/
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                             S.of(context).signup,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isSignUpScreen
                                        ? Colors.blueAccent
                                        : Colors.grey),
                              ),
                              /* if (!isSignUpScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 3.h,
                                width: 55.w,
                                color: Colors.orange,
                              )*/
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignUpScreen) RegisterScreen(),
                    if (!isSignUpScreen) LoginScreen(),
                  ],
                ),
              ),
            )),

        //container of arrow submit
        // buildAnimatedPositioned()
      ]),
    );
  }
}
