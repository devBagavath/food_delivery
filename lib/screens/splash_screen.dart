import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/main_screen.dart';
import '../app_constant/core/color.dart';
import '../app_constant/string/asset_path_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(
        const Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MainScreen(
                ))));

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Theme.of(context).canvasColor,primary],
              begin: const FractionalOffset(0, 0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          )
      ),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 180.0,
            width: 180.0,
            child: Center(
              // child: ClipOval(
              child: Image.asset(splashBackgroundPath),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
