import 'package:flutter/cupertino.dart';

backgroundAssetImageBox(String assetImage,BoxFit boxFit){
  return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(assetImage),
        fit: boxFit,
      )
  );
}

