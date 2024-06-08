import 'package:cleanapp/feature/Auth/presentation/manager/auth_cubit.dart';
import 'package:cleanapp/feature/Auth/presentation/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/color.dart';


class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> forgetPasswordKey = GlobalKey();

  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  clear() {
    emailController.clear();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:ColorManger.screenColor ,
        /*
        appBar: AppBar(
          backgroundColor: ColorManger.screenColor,
          elevation: 0,
          leading: GestureDetector(
              onTap: (){
                navigatorTo(context, const FormItemClientLogin());
              },
              child: const Icon(Icons.arrow_back_ios)),
          iconTheme: const IconThemeData(color: Colors.black),
        ),

         */

        ///////////////////////////////////////////////////////////////////////////////

        body: SingleChildScrollView(
          child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: forgetPasswordKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //space
                        SizedBox(height: 30.h,),

                        ///////////////////////////////////////////////////////////////////////////////

                        //Forget Password
                        const Text('هل نسيت كلمة المرور؟' , style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
                        //space
                        SizedBox(height: 30.h,),

                        ///////////////////////////////////////////////////////////////////////////////

                        //text please ........
                        Text('برجاء ادخال بريدك الالكترونى لاعاده تعيين كلمه المرور' , style: TextStyle(fontSize: 15.sp,)),
                        //  Text('Please enter your registered  email \n or phone number to reset your password' , style: TextStyleManger.font15SubTitle),
                        //space
                        SizedBox(height: 40.h,),

                        ///////////////////////////////////////////////////////////////////////////////

                        //email
                        CustomTextFormField(
                          label: '  برجاء ادخال بريدك الالكترونى ',
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          validator: 'Please Enter your Email Or Phone',
                        ),
                        //space
                        SizedBox(height: 40.h,),

                        ///////////////////////////////////////////////////////////////////////////////

                        //button restore password
                        GestureDetector(
                          onTap: () {
                            if (forgetPasswordKey.currentState!.validate()) {
                              AuthCubit.get(context).resetPassword(email: emailController.text.trim(), context: context);

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
                                'اعاده تعيين كلمه المرور',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        //space
                        //SizedBox(height: 225.h,),

                        ///////////////////////////////////////////////////////////////////////////////

                      ],
                    ),
                  ),
                ),
              ]
          ),

        ),

      ),
    );
  }
}