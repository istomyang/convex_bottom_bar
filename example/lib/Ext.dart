import 'package:flutter/material.dart';

class UITestSuit {
  static Widget createBorderWrapper(Widget child, {Color color = Colors.green}) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(border: Border.all(color: color)),
      child: child,
    );
  }
}

class LibImage {
  static img(String path, double width, double height, {double opacity = 1, BoxFit fit = BoxFit.contain}) {
    // 容错，有时候路径会习惯性的带上 /
    if (path.startsWith('/')) path = path.substring(1);
    return Image.asset(
      "lib/assets/images/$path",
      width: width,
      height: height,
      color: Color.fromRGBO(255, 255, 255, opacity),
      fit: fit,
      colorBlendMode: BlendMode.modulate,
    );
  }

  static DecorationImage getDecorationImage(String path, {BoxFit fit = BoxFit.contain}) {
    return DecorationImage(
      image: ExactAssetImage("lib/assets/images/$path"),
      fit: fit,
    );
  }
}
