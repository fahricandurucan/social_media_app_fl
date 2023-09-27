import 'package:flutter/material.dart';

class CColors {
  static const mainColor = Color(0xFF5F0CA1);
  static const goldenYellow = Color(0xffFFC000);
  static final mainColorOpacity = const Color(0xFF5F0CA1).withOpacity(0.4);
  static const brightPrimaryColor = Color(0xFFA4E5E0);
  static const white = Colors.white;
  static const textColor = Color(0xffCECECE);
  static const emptyFieldColor = Colors.grey;
  static const backgroundcolor = Color(0xff161616);
  static const backgroundMainColor = Color(0xFF290346);
  static const iconColor = Colors.white;
  static const premiumColor = Color.fromARGB(255, 16, 25, 33);
  static const foregroundBlack = Color(0xff202020);
  static const subtitleColor = Color(0xff979797);
  static const sideColor = Color(0x4cb7b7b3);
  static const black = Colors.black;
  static const green = Colors.green;
  static const orange = Colors.orange;
  static const blue = Colors.blueGrey;
  static const red = Colors.red;
  static const tagColor = Color(0xffD9D9D9);
  static final darkGrey = Colors.grey.shade900;
  static const gray = Color.fromARGB(149, 64, 62, 66);
  static const cyan = Color(0xFF79FFFF);

  static const Map<int, Color> primarySwatchColors = {
    50: Color.fromRGBO(95, 12, 161, .1),
    100: Color.fromRGBO(95, 12, 161, .2),
    200: Color.fromRGBO(95, 12, 161, .3),
    300: Color.fromRGBO(95, 12, 161, .4),
    400: Color.fromRGBO(95, 12, 161, .5),
    500: Color.fromRGBO(95, 12, 161, .6),
    600: Color.fromRGBO(95, 12, 161, .7),
    700: Color.fromRGBO(95, 12, 161, .8),
    800: Color.fromRGBO(95, 12, 161, .9),
    900: Color.fromRGBO(95, 12, 161, 1),
  };
  static const Map<int, Color> primarySwatchColorsBright = {
    50: Color.fromRGBO(164, 229, 224, .1),
    100: Color.fromRGBO(164, 229, 224, .2),
    200: Color.fromRGBO(164, 229, 224, .3),
    300: Color.fromRGBO(164, 229, 224, .4),
    400: Color.fromRGBO(164, 229, 224, .5),
    500: Color.fromRGBO(164, 229, 224, .6),
    600: Color.fromRGBO(164, 229, 224, .7),
    700: Color.fromRGBO(164, 229, 224, .8),
    800: Color.fromRGBO(164, 229, 224, .9),
    900: Color.fromRGBO(164, 229, 224, 1),
  };

  static const primarySwatch = MaterialColor(0xFF5F0CA1, primarySwatchColors);
  static const primarySwatchBright = MaterialColor(0xFFA4E5E0, primarySwatchColorsBright);
}

class Styles {
  static TextStyle get subtitle => const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: CColors.subtitleColor,
      );
  static TextStyle get biggerSubtitle => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: CColors.subtitleColor,
      );
  static TextStyle get title => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bigTitle => const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get biggerTitle => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get evenBiggerTitle => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get description => const TextStyle(
        fontSize: 15,
        height: 1.23,
        color: CColors.subtitleColor,
      );
}
