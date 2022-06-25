import 'package:dandoun/bloc/auth_cubit/auth_cubit.dart';
import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/widget/custom_button2.dart';
import 'package:dandoun/widget/custom_text.dart';
import 'package:dandoun/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/helper_function.dart';
import 'componts/rich_text_register.dart';


class RegisterScreen extends StatefulWidget {

  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _controllerEmail =TextEditingController();
  final _controllerPhone =TextEditingController();
  final _controllerUserName =TextEditingController();
  final _controllerPass =TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerUserName.dispose();
    _controllerPhone.dispose();
    _controllerEmail.dispose();
    _controllerPass.dispose();
  }

  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
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
              controller: _controllerUserName,
              keabord: TextInputType.text,
              iconData: Icons.person,
              hint: "الاسم",
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextFormField(
              controller:_controllerEmail ,
                keabord: TextInputType.emailAddress,
                iconData: Icons.email_outlined,
                hint: "البريد الالكتروني ",
                ),
            const SizedBox(
              height: 18,
            ),

            CustomTextFormField(
              controller:_controllerPhone ,
              keabord: TextInputType.phone,
              iconData: Icons.call,
              hint: "رقم الهاتف ",
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextFormField(
              controller: _controllerPass,
                keabord: TextInputType.emailAddress,
                iconData: Icons.lock,
                hint: "كلمة المرور ",
              isValidate: false,

               ),


            const SizedBox(
              height: 5,
            ),
          AuthCubit.get(context).isValidatePass?  SizedBox():
          const Text("كلمة السر يجب ان لا تكون اقل من 8 ارقام تحتوى علي حرف كبير ورمز مثال A****@",
            style: TextStyle(
              fontSize: 12,
              color: Colors.red
            ),),
            // CustomTextFormField(
            //   controller: _controllerUserName,
            //     keabord: TextInputType.visiblePassword,
            //     iconData: Icons.lock,
            //     hint: "اعادة كلمة المرور",
            //    ),

            const SizedBox(
              height: 39,
            ),
            AuthCubit.get(context).isRegisterLoad
                ? const SizedBox(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            )
                :  CustomButtonWithIcon(
              textColor: Colors.white,
              isIcon: true,
              text: "ابدا الان",
              onPress: () {
                // ignore: avoid_print
                print("hssssss");
                AuthCubit.get(context).validatePassword(_controllerPass.text);
                if(isValidate(context)){
                  AuthCubit.get(context).registerUser(context: context,
                    userName: _controllerEmail.text.trim(),
                    phone: _controllerPhone.text.trim(),
                    pass: _controllerPass.text.trim(),
                    fullName: _controllerUserName.text.trim(),
                    role: "user"
                  );
                }


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

              },
              icon: Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
          /*  CustomButtonWithIcon(
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
            ),*/
            const SizedBox(
              height: 44,
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
          context: context, color: Colors.red, message: "أدخل الاسم كاملا");


      return false;
    } else if (_controllerEmail.text.isEmpty) {
      HelperFunction.slt.showSnakeBar(
          context: context, color: Colors.red, message: "أدخل الايميل");
      return false;
    } else if (_controllerPhone.text.isEmpty) {
      HelperFunction.slt.showSnakeBar(
          context: context, color: Colors.red, message: "أدخل رقم الهاتف");
      return false;
    }
    else if (!AuthCubit.get(context).isValidatePass) {

      return false;
    }



    else {
      return true;
    }
  }

}
