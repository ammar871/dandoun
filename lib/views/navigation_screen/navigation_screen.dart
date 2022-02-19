import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/views/fevorate_screen/fevorate_screen.dart';
import 'package:dandoun/views/home_screen/home_screen.dart';
import 'package:dandoun/views/mylist_screen/mylist_screen.dart';
import 'package:dandoun/views/search/search_screen.dart';
import 'package:dandoun/views/setiting_screen/setiting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    const MyListScreen(),
    const FevorateScreen(),
    const SetitingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        iconSize:24,
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
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: 'بحث'),
          BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play), label: 'قائمتى'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outline_rounded), label: 'المفضلة'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'الاعدادات'),
        ],
        currentIndex: selectIndex,
        fixedColor: secondColor,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }
}
