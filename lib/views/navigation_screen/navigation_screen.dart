import 'package:dandoun/bloc/app_cubit/app_cubit.dart';
import 'package:dandoun/bloc/home_cubit/home_cubit.dart';
import 'package:dandoun/bloc/package_cubit/package_cubit.dart';
import 'package:dandoun/bloc/user_cubit/user_cubit.dart';
import 'package:dandoun/helpers/constants.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/views/fevorate_screen/fevorate_screen.dart';
import 'package:dandoun/views/home_screen/home_screen.dart';

import 'package:dandoun/views/search/search_screen.dart';
import 'package:dandoun/views/setiting_screen/setiting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../packages_screen/packages_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PackagesScreen(),
    const FevorateScreen(),
    const SettingsScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    HomeCubit.get(context).getPermission();
    super.initState();
    print("hommmmmmmmme$token");

    HomeCubit.get(context).getFavorites();
    UserCubit.get(context).getUserDetails();
    PackageCubit.get(context).getPackages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: AppCubit.get(context).currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).backgroundColor,
            iconSize: 24,
            unselectedIconTheme: const IconThemeData(
              color: textColor,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: textColor,
            unselectedLabelStyle: const TextStyle(fontFamily: "pnuM"),
            selectedLabelStyle: const TextStyle(fontFamily: "pnuB"),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_sharp), label: 'بحث'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_play), label: 'الباقات'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_outline_rounded), label: 'المفضلة'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'الاعدادات'),
            ],
            currentIndex: AppCubit.get(context).currentIndex,
            fixedColor: secondColor,
            onTap: onItemTapped,
          ),
        );
      },
    );
  }

  void onItemTapped(int index) {
    AppCubit.get(context).changeNav(index);
  }
}
