import 'package:dandoun/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final darkMode = ThemeData(
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff515151),     //  <-- dark color
    textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
  backgroundColor: homeColor,

  bottomSheetTheme:const BottomSheetThemeData(
      backgroundColor: backgroundColor
  ) ,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.white
      ),///WHITE AND BLACK
      bodyText2: TextStyle(
          color:Colors.white

      ),///JUST WHITE
      headline3: TextStyle(
          color: secondColor

      ),///JUST SECOND COLOR
      headline5: TextStyle(
          color: backgroundColor

      ),
      headline4: TextStyle(
          color: textColor

      )///TEXT COLOR AND BLACK26
  ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff222222),
        selectedIconTheme: IconThemeData(
            color: secondColor
        ),unselectedIconTheme: IconThemeData(
        color: Color(0xff858585)
    ),
      selectedLabelStyle: TextStyle(
        color: secondColor
      ),
        unselectedLabelStyle: TextStyle(
            color: Color(0xff858585)
        )
    ),



  appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.transparent,

      iconTheme: IconThemeData(color: homeColor),

      systemOverlayStyle:  SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: null,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  )
  ),

  fontFamily: "pnuR", //my custom font

  primarySwatch: Colors.blue,
);






final lightMode=ThemeData(

  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff515151),     //  <-- dark color
    textTheme: ButtonTextTheme.primary,
    //  <-- this auto selects the right color
  ),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,



  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
          color: secondColor
      ),unselectedIconTheme: IconThemeData(
      color: Color(0xff858585)
  ),
      selectedLabelStyle: TextStyle(
          color: secondColor
      ),
      unselectedLabelStyle: TextStyle(
          color: Color(0xff858585)
      )
  ),



  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.black
      ),
      bodyText2: TextStyle(
          color: Colors.white

      ),
      headline6: TextStyle(
          color: Color(0xff707070)

      ),
      headline3: TextStyle(
          color: secondColor

      ),
      headline4: TextStyle(
          color: Colors.black26

      ),
      headline5: TextStyle(
      color: Colors.white

  )
  ),
  canvasColor: Colors.transparent,


  appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black
      ),
      iconTheme: IconThemeData(color: Colors.black),

      systemOverlayStyle:  SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      )
  ),
  fontFamily: "pnuR",
  //my custom font

  primarySwatch: Colors.blue,
);