import 'package:dandoun/controller/router.dart';
import 'package:dandoun/helpers/styles.dart';
import 'package:dandoun/providers/app_provider.dart';
import 'package:dandoun/thems/them.dart';
import 'package:dandoun/views/details_artical/details_artical.dart';

import 'package:dandoun/views/login/login_screen.dart';
import 'package:dandoun/views/navigation_screen/navigation_screen.dart';
import 'package:dandoun/views/play_vedio/play_vedio_screen.dart';
import 'package:dandoun/views/reigster_screen/register_screen.dart';
import 'package:dandoun/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale("ar"), Locale("en")],
      path: "assets/translations",
      // <-- change the path of the translation files
      fallbackLocale: const Locale("ar"),
      startLocale: const Locale("ar"),
      child: Phoenix(child: const MyApp())),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
            create: (context) => AppProvider())
      ],

      child: ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: Consumer<AppProvider>(
          builder: (cxt, provider, child)=> MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            // theme: ThemeData(
            //  scaffoldBackgroundColor: homeColor,
            //   primarySwatch: Colors.blue,
            // ),

            darkTheme: darkMode,
            theme: lightMode,
            themeMode: AppProvider
                .getInItWatch(cxt)
                .isDark ? ThemeMode.light : ThemeMode.dark,
            // AppCubit.get(ctx).isDark ? ThemeMode.dark : ThemeMode.light

            initialRoute: splash,
            routes: {
              login: (context) => const LoginScreen(),
              splash: (context) => const SplashScreen(),
              register: (context) => RegisterScreen(),
              home: (context) => const NavigationScreen(),
              details: (context) => const DetailsArticleScreen(),
              playing: (context) => const PlayVideoScreen()
            },
          ),

        ),
      ),
    );
  }
}


