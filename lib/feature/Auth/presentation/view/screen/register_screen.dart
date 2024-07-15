import 'package:cleanapp/feature/Auth/presentation/view/screen/login_screen.dart';
import 'package:cleanapp/feature/Homepage/home_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:cleanapp/generated/l10n.dart';

import '../../../../../core/const/constant.dart';
import '../../../../../core/helpers/cached.dart';
import '../../../../../core/theming/color.dart';
import '../widget/custom_text_form_field.dart';
import '../widget/drop_down.dart';
import '../../../../rating/rating_screen.dart';
import '../widget/toast.dart';
import '../../manager/auth_cubit.dart';
import 'auth_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;

  bool isMale = true;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  GlobalKey<FormState> signUpKey = GlobalKey();

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    locationController.dispose();
    super.dispose();
  }

  clear() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    locationController.clear();
  }

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Form(
        key: signUpKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //name
              CustomTextFormField(
                label: S
                    .of(context)
                    .firstname,
                controller: firstNameController,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_2_outlined,
                    color: ColorManger.iconColor),
                validator: 'الاسم الاول',
                hint: S
                    .of(context)
                    .firstnamehint,
              ),
              //space
              SizedBox(
                height: 5.h,
              ),

              ///////////////////////////////////////////////////////////////////////////////

              //last name
              CustomTextFormField(
                label: S
                    .of(context)
                    .lastname,
                controller: lastNameController,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_2_outlined,
                    color: ColorManger.iconColor),
                validator: 'Please Enter your Last Name',
                hint: S
                    .of(context)
                    .lastname,
              ),

              //space
              SizedBox(
                height: 5.h,
              ),

              ////email
              CustomTextFormField(
                prefixIcon: const Icon(
                  EvaIcons.emailOutline,
                  color: ColorManger.iconColor,
                ),
                keyboardType: TextInputType.text,
                hint: S
                    .of(context)
                    .emailhint,
                label: S
                    .of(context)
                    .email,
                controller: emailController,
                validator: 'Please Enter your Email',
              ),
              SizedBox(
                height: 5.h,
              ),

              //password
              CustomTextFormField(
                label: S
                    .of(context)
                    .password,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock_outline,
                    color: ColorManger.iconColor),
                hint: S
                    .of(context)
                    .passwordhint,
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: ColorManger.iconColor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                obsocure: _passwordVisible,
                validator: 'Please Enter your Password',
              ),

              //space
              SizedBox(
                height: 5.h,
              ),

              ///////////////////////////////////////////////////////////

              //=====>>>> country code phone
              IntlPhoneField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined,
                      color: ColorManger.iconColor),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: '',
                  labelStyle: TextStyle(
                      fontSize: 15.sp, color: ColorManger.textDarkColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                    //background TextFormField ====>>> white
                    borderSide: const BorderSide(color: ColorManger.textColor1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                    borderSide: BorderSide(color: Colors.blue.withOpacity(.5)),
                  ),
                ),
                initialCountryCode: 'EG',
                controller: phoneController,
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),

              ///////////////////////////////////////////////////////////////////////////////

              //location dropdown
              DropdownButtonFormField(
                menuMaxHeight: 300,
                isExpanded: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: S
                      .of(context)
                      .location,
                  labelStyle: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    color: ColorManger.iconColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                    //background TextFormField ====>>> white
                    borderSide: const BorderSide(color: ColorManger.textColor1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                    borderSide: BorderSide(color: Colors.blue.withOpacity(.5)),
                  ),
                ),

                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: DropdownManager.itemLocation.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    DropdownManager.initialValueLocation = newValue!;
                  });
                },
              ),
              //space
              SizedBox(
                height: 10.h,
              ),

              ///////////////////////////////////////////////////////////////////////////////

              //row of gender
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: isMale
                                  ? ColorManger.textColor2
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: isMale
                                      ? Colors.transparent
                                      : ColorManger.textColor1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            EvaIcons.personOutline,
                            color:
                            isMale ? Colors.white : ColorManger.iconColor,
                          ),
                        ),
                        Text(
                          S
                              .of(context)
                              .male,
                          style: TextStyle(color: ColorManger.textColor1),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: isMale
                                  ? Colors.transparent
                                  : ColorManger.textColor2,
                              border: Border.all(
                                  width: 1,
                                  color: isMale
                                      ? ColorManger.textColor1
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            EvaIcons.personOutline,
                            color:
                            isMale ? ColorManger.iconColor : Colors.white,
                          ),
                        ),
                        Text(
                          S
                              .of(context)
                              .female,
                          style: TextStyle(color: ColorManger.textColor1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              //button register
              GestureDetector(
                onTap: () async {
                  if (signUpKey.currentState!.validate()) {
                    AuthCubit.get(context)
                        .registerFunction(
                      context: context,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phone: phoneController.text,
                      location: DropdownManager.initialValueLocation,
                      //type: DropdownManager.initialValueGender
                    )
                        .then((value) {
                      clear();

                      flutterFunction(
                          color: Colors.greenAccent,
                          text: "تم انشاء حساب بنجاح");

                      Constant.uid = CacheHelper.getData(key: "uid");
                      print("UId is =====>>>>> ${Constant.uid}");
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return HomePage();
                      }));
                    });
                  }
                },
                child: Container(
                  // width: 250.w,
                  height: 50.h,
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
                  child: Center(
                    child: Text(
                      S
                          .of(context)
                          .signup,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),

              //container of terms and conditions
              Container(
                width: 200,
                margin: const EdgeInsets.only(top: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "By pressing submit you agree to our",
                      style: TextStyle(color: ColorManger.textColor2),
                      children: [
                        TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(color: Colors.orange))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
