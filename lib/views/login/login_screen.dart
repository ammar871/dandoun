import 'package:dandoun/bloc/auth_cubit/auth_cubit.dart';
import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';

import 'package:dandoun/widget/custom_button2.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:dandoun/widget/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/functions.dart';
import '../../helpers/helper_function.dart';
import '../navigation_screen/navigation_screen.dart';
import '../otp_screen/otp_screen.dart';
import '../reigster_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerUserName = TextEditingController();
  final _controllerPass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerUserName.dispose();
    _controllerPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CheckUserAuthStateSuccess) {
          printFunction("${state.status}");


        }

      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomText(
                      family: "pnuB",
                      align: TextAlign.right,
                      size: 35,
                      text: 'مرحبا بك\nمن جديد',
                      textColor: Theme.of(context).textTheme.bodyText1!.color!,
                      weight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: _controllerUserName,
                  keabord: TextInputType.emailAddress,
                  iconData: Icons.email_outlined,
                  hint: "البريد الالكتروني ",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  controller: _controllerPass,
                  keabord: TextInputType.visiblePassword,
                  iconData: Icons.lock,
                  hint: "كلمة المرور",
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomText(
                      family: "pnuM",
                      size: 14,
                      text: "نسيت كلمة المرور",
                      textColor: Theme.of(context).textTheme.bodyText1!.color!,
                      weight: FontWeight.bold,
                      align: TextAlign.center),
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthCubit.get(context).loadLogin
                    ? const SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      color:  Colors.blue,
                    ),
                  ),
                ): CustomButtonWithIcon(
                  textColor: Colors.white,
                  isIcon: true,
                  text: "ابدا الان",
                  onPress: () {
                   if(isValidate(context)){
                     AuthCubit.get(context)
                         .loginUser(
                       context: context,code: _controllerPass.text.toString(),
                       userName: _controllerUserName.text.toString(),
                       tokenFcm: "jjsd"
                     );

                   }
                  },
                  icon: Icons.arrow_back_ios_outlined,
                  color: secondColor,
                ),
                const SizedBox(
                  height: 34,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomText(
                      family: "pnuM",
                      size: 14,
                      text: "او",
                      textColor: Theme.of(context).textTheme.bodyText1!.color!,
                      weight: FontWeight.bold,
                      align: TextAlign.center),
                ),
                const SizedBox(
                  height: 19,
                ),
                AuthCubit.get(context).loadFaceLogin
                    ? const SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      color:  Colors.blue,
                    ),
                  ),
                ):  CustomButtonWithIcon(
                  textColor: Colors.white,
                  iconAsset: "assets/icons/facebook.svg",
                  isIcon: false,
                  text: "الدخول بواسطة حساب الفيسبوك",
                  onPress: () {
                    // ignore: avoid_print
                    AuthCubit.get(context).loginWithFacebook(context: context);
                  },
                  icon: Icons.arrow_back_ios_outlined,
                  color: const Color(0xFF395998),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthCubit.get(context).loadLoginGoogle
                    ? const SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      color:  Colors.blue,
                    ),
                  ),
                ):     CustomButtonWithIcon(
                  textColor: const Color(0xFF4285F4),
                  iconAsset: "assets/icons/google.svg",
                  isIcon: false,
                  text: "الدخول بواسطة حساب القوقل",
                  onPress: () {
                   AuthCubit.get(context).loginWithGoogle(context: context);
                    print("hssssss");
                  },
                  icon: Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                // CustomButtonWithIcon(
                //   textColor: Colors.white,
                //   iconAsset: "assets/icons/twiter.svg",
                //   isIcon: false,
                //   text: "الدخول بواسطة حساب تويتر",
                //   onPress: () {
                //     // ignore: avoid_print
                //     print("hssssss");
                //   },
                //   icon: Icons.arrow_back_ios_outlined,
                //   color: Color(0xff4285F4),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // CustomButtonWithIcon(
                //   textColor: Colors.white,
                //   iconAsset: "assets/icons/apple.svg",
                //   isIcon: false,
                //   text: "الدخول بواسطة حساب ابل",
                //   onPress: () {
                //     // ignore: avoid_print
                //     print("hssssss");
                //   },
                //   icon: Icons.arrow_back_ios_outlined,
                //   color: backgroundColor,
                // ),
                // const SizedBox(
                //   height: 19,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, register);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomText(
                        family: "pnuM",
                        size: 14,
                        text: "اريد انشاء حساب جديد",
                        textColor:
                            Theme.of(context).textTheme.bodyText1!.color!,
                        weight: FontWeight.bold,
                        align: TextAlign.center),
                  ),
                ),
                // const SizedBox(
                //   height: 59,
                // ),
                // const SizedBox(
                //   width: double.infinity,
                //   child: CustomText(
                //       family: "pnuL",
                //       size: 14,
                //       text: "الاستمرار كضيف",
                //       textColor: secondColor,
                //       weight: FontWeight.w400,
                //       align: TextAlign.center),
                // ),
                const SizedBox(
                  height: 170,
                ),
              ],
            ),
          )),
        );
      },
    );
  }

  bool isValidate(BuildContext context) {
    if (_controllerUserName.text.isEmpty) {
      HelperFunction.slt.showSnakeBar(
          context: context, color: Colors.red, message: "أدخل البريد الالكتروني");


      return false;
    } else if (_controllerPass.text.isEmpty) {
      HelperFunction.slt.showSnakeBar(
          context: context, color: Colors.red, message: "أدخل الرقم السرى");
      return false;
    } else {
      return true;
    }
  }
}
