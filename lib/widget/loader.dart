import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../app_constant/core/color.dart';

Widget customLoader() {
  return const Center(
    child: SpinKitFadingCircle(
      color: primary,
      size: 40.0,
    ),);
}