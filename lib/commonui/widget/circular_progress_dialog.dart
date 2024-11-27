import 'package:flutter/material.dart';
import '../../widget/loader.dart';

class CircularProgressIndicatorPage extends StatefulWidget {

  bool isWhite;
  CircularProgressIndicatorPage(this.isWhite, {super.key});

  @override
  State<CircularProgressIndicatorPage> createState() => _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState extends State<CircularProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: customLoader(),
      ),), onWillPop: ()async{

      return false;
    });
  }
}