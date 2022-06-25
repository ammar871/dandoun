import 'package:audio_service/audio_service.dart';
import 'package:dandoun/bloc/auth_cubit/auth_cubit.dart';
import 'package:dandoun/bloc/home_cubit/home_cubit.dart';
import 'package:dandoun/bloc/package_cubit/package_cubit.dart';
import 'package:dandoun/bloc/post_cubit/post_cubit.dart';
import 'package:dandoun/bloc/user_cubit/user_cubit.dart';
import 'package:dandoun/controller/router.dart';

import 'package:dandoun/servies/audio_handler.dart';

import 'package:dandoun/thems/them.dart';


import 'package:dandoun/views/login/login_screen.dart';
import 'package:dandoun/views/navigation_screen/navigation_screen.dart';

import 'package:dandoun/views/reigster_screen/register_screen.dart';

import 'package:dandoun/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';


import 'bloc/app_cubit/app_cubit.dart';
import 'helpers/functions.dart';

late AudioHandler audioHandler;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  audioHandler = await initAudioService();
  await readToken();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
        BlocProvider<AuthCubit>(create: (BuildContext context) => AuthCubit()),
        BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
        BlocProvider<PostCubit>(create: (BuildContext context) => PostCubit()),
        BlocProvider<PackageCubit>(
            create: (BuildContext context) => PackageCubit()),
        BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit()),
      ],

      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO : implement listener
        },
        builder: (context, state) {
          return MaterialApp(
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
            themeMode: AppCubit
                .get(context)
                .isDark ? ThemeMode.light : ThemeMode.dark,
            // AppCubit.get(ctx).isDark ? ThemeMode.dark : ThemeMode.light

            initialRoute: isRegistered() ? home : splash,
            routes: {
              login: (context) => const LoginScreen(),
              splash: (context) => const SplashScreen(),
              register: (context) => RegisterScreen(),
              home: (context) => const NavigationScreen(),


            },
          );
        },
      ),


    );
  }
}


