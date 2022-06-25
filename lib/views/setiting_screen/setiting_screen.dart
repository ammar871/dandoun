import 'package:dandoun/bloc/app_cubit/app_cubit.dart';
import 'package:dandoun/helpers/functions.dart';
import 'package:dandoun/views/edite_profile_screen/edite_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/styles.dart';
import '../../widget/custom_text.dart';
import 'componts/item_setting.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            weight: FontWeight.w500,
            text: "الاعدادت",
            family: "pnuB",
            size: 16,
            textColor: Theme.of(context).textTheme.bodyText1!.color!,
            align: TextAlign.start,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              ItemSetting(
                icon: Icons.person,
                title: "الملف الشخصى",
                onPress: () {
                  pushPage(context: context, page: EditProfileScreen());
                },
              ),
              ItemSetting(
                icon: Icons.wb_sunny,
                title: "المظهر",
                onPress: () {
                  AppCubit.get(context).changeAppMode();
                },
              ),
              ItemSetting(
                icon: Icons.translate,
                title: "اللغة",
                onPress: () {},
              ),
              ItemSetting(
                icon: Icons.description,
                title: "باقاتى",
                onPress: () {},
              ),
              ItemSetting(
                icon: Icons.contact_support_rounded,
                title: "سياسة الخصوصية",
                onPress: () {},
              ),
              ItemSetting(
                icon: Icons.call,
                title: "اتصل بنا",
                onPress: () {
                  launch('tel:+01011629271');
                },
              ),
              ItemSetting(
                icon: Icons.share,
                title: "مشاركة التطبيق",
                onPress: () {},
              ),
              const Spacer(),
              ItemSetting(
                icon: Icons.logout,
                title: "تسجيل الخروج",
                onPress: () {
                  signOut(ctx: context);
                },
                isLogout: true,
              ),
            ],
          ),
        ));
  }
}
