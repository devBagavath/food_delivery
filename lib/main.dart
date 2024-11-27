import 'package:flutter/material.dart';
import 'package:food_delivery/screens/main_screen.dart';
import 'package:food_delivery/screens/splash_screen.dart';
import 'app_constant/core/color.dart';
import 'app_constant/string/app_constant.dart';
import 'app_constant/string/routing_constant.dart';


void main() {
  // runApp( MultiBlocProvider(
  //   providers: [],
  //   child: MyApp(),
  // ),);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primary),
            useMaterial3: true,
          ),

          supportedLocales: const [
            Locale('en', 'US'), // English, US
            Locale('es', 'ES'), // Spanish, Spain
          ],
          home: const SplashScreen(),
          routes: {
            SPLASHSCREEN: (context) => const SplashScreen(),
            MAINSCREEN: (context) => const MainScreen(),
          },
        ));
  }
}
