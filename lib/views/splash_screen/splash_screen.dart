import 'package:dandoun/bloc/app_cubit/app_cubit.dart';
import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/constants.dart';
import 'package:dandoun/helpers/styles.dart';

import 'package:dandoun/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("gfghdg"+token);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset("assets/icons/logo.svg",height: 44,),
            const SizedBox(
              height: 45,
            ),
            CustomButton(
                width: double.infinity,
                text: "الدخول الي حسابك",
                fontFamily: "pnuM",
                onPress: () {
                 Navigator.pushNamed(context, login);
                  //AppProvider.getInItRead(context).changeAppMode();
                },
                color: secondColor,
                textColor: Theme.of(context).textTheme.bodyText2!.color!,
                fontSize: 14,
                redius: 10,
                isCustomColor: true,
                height: 44),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                width: double.infinity,
                text: "انشاء حساب جديد",
                fontFamily: "pnuM",
                onPress: () {

                  // AppCubit.get(context).changeAppMode();
                  Navigator.pushNamed(context, register);
                },
                color: secondColor,
                textColor: Theme.of(context).textTheme.bodyText2!.color!,
                fontSize: 14,
                redius: 10,
                isCustomColor: true,
                height: 44),
            // const SizedBox(
            //   height: 19,
            // ),
            // CustomButton3(
            //     text: "الاستمرار كضيف",
            //     fontFamily: "pnuL",
            //     onPress: () {},
            //     color: secondColor,
            //     textColor: secondColor,
            //     fontSize: 14,
            //     redius: 10,
            //     isCustomColor: true,
            //     isBorder: true,
            //     height: 44),
            const SizedBox(
              height: 110,
            ),
          ],
        ),
      ),
    );
  }
}
