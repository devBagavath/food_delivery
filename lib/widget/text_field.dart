import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_constant/core/color.dart';
import '../app_constant/core/font_family_constant.dart';
import '../app_constant/string/app_constant.dart';

Widget customTextField(String? hintText,{double width = 350}){
  return Container(
    height: 40,
    width: width-40,
    decoration: BoxDecoration(
      color: white,
      shape: BoxShape.rectangle,
      border: Border.all(color: grey,width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: TextField(
      // controller: _userID,
      // focusNode: emailFocusNode,
      maxLines: 1,
      style: const TextStyle(color: black),
      inputFormatters: [
        FilteringTextInputFormatter.deny(
            RegExp(regexToRemoveEmoji))
      ],
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.only(
              left: 13.0, bottom: 9, right: 2),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey,fontFamily: merriweather)
      ),
    ),
  );
}
