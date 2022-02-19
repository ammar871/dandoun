import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_button2.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:dandoun/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componts/rich_text_register.dart';

//ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  late String email, password, configPassword;

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  text: 'انشاء\nحساب جديد',
                  textColor: Theme.of(context).textTheme.bodyText1!.color!,
                  weight: FontWeight.bold,
                )),
            const SizedBox(
              height: 20,
            ),
            const RichTextRegister(),
            const SizedBox(
              height: 18,
            ),
            CustomTextFormField(
                keabord: TextInputType.emailAddress,
                iconData: Icons.email_outlined,
                hint: "البريد الالكتروني ",
                onSave: (value) {
                  email = value;
                }),
            const SizedBox(
              height: 18,
            ),
            CustomTextFormField(
                keabord: TextInputType.visiblePassword,
                iconData: Icons.lock,
                hint: "كلمة المرور",
                onSave: (value) {
                  password = value;
                }),
            const SizedBox(
              height: 18,
            ),
            CustomTextFormField(
                keabord: TextInputType.visiblePassword,
                iconData: Icons.lock,
                hint: "اعادة كلمة المرور",
                onSave: (value) {
                  configPassword = value;
                }),

            const SizedBox(
              height: 39,
            ),
            CustomButtonWithIcon(
              textColor: Colors.white,
              isIcon: true,
              text: "ابدا الان",
              onPress: () {
                // ignore: avoid_print
                print("hssssss");
                Navigator.pushNamed(context, home);
              },
              icon: Icons.arrow_back_ios_outlined,
              color: secondColor,
            ),
            const SizedBox(
              height: 28,
            ),
            const CustomText(
                family: "pnuM",
                size: 12,
                text:
                    "بتسجيل حساب جديد فان هذا يعني انك ق وافقت علي كافة الإجراءات و القوانين الخاصة بالمناصة",
                textColor: Colors.white,
                weight: FontWeight.bold,
                align: TextAlign.start),
            const SizedBox(
              height: 25,
            ),
            CustomButtonWithIcon(
              textColor: Colors.white,
              iconAsset: "assets/icons/facebook.svg",
              isIcon: false,
              text: "الدخول بواسطة حساب الفيسبوك",
              onPress: () {
// ignore: avoid_print
                print("hssssss");
              },
              icon: Icons.arrow_back_ios_outlined,
              color: const Color(0xFF395998),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWithIcon(
              textColor: const Color(0xFF4285F4),
              iconAsset: "assets/icons/google.svg",
              isIcon: false,
              text: "الدخول بواسطة حساب القوقل",
              onPress: () {
                // ignore: avoid_print
                print("hssssss");
              },
              icon: Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWithIcon(
              textColor: Colors.white,
              iconAsset: "assets/icons/twiter.svg",
              isIcon: false,
              text: "الدخول بواسطة حساب تويتر",
              onPress: () {
// ignore: avoid_print
                print("hssssss");
              },
              icon: Icons.arrow_back_ios_outlined,
              color: const Color(0xff4285F4),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWithIcon(
              textColor: Colors.white,
              iconAsset: "assets/icons/apple.svg",
              isIcon: false,
              text: "الدخول بواسطة حساب ابل",
              onPress: () {
// ignore: avoid_print
                print("hssssss");
              },
              icon: Icons.arrow_back_ios_outlined,
              color: backgroundColor,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: CustomText(
                  family: "pnuM",
                  size: 14,
                  text: "اريد انشاء حساب جديد",
                  textColor: Colors.white,
                  weight: FontWeight.bold,
                  align: TextAlign.center),
            ),
            const SizedBox(
              height: 28,
            ),
            const SizedBox(
              width: double.infinity,
              child: CustomText(
                  family: "pnuL",
                  size: 14,
                  text: "الاستمرار كضيف",
                  textColor: secondColor,
                  weight: FontWeight.w400,
                  align: TextAlign.center),
            ),
            const SizedBox(
              height: 44,
            ),
          ],
        ),
      )),
    );
  }
}
