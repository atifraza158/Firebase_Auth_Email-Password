import 'package:firebase_app/Views/Utils/Styles/theme.dart';
import 'package:flutter/material.dart';

extension CustomTextStyles on TextStyle {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
  );

  static const TextStyle appBarStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
  );

  static const TextStyle appBarWhiteStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppTheme.whiteColor,
    fontFamily: 'poppins',
  );

  static const TextStyle splashTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    color: Colors.white,
  );

  static const TextStyle splashBlackTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    color: AppTheme.blackColor,
  );

  static const TextStyle drawerElementsStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'poppins',
    color: Colors.white,
  );

  static const TextStyle commonButtonStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    color: Colors.white,
  );

  static const TextStyle smallThemedColorStyle = TextStyle(
    fontFamily: 'poppins',
    color: AppTheme.themeColor,
  );

  static const TextStyle smallBlackColorStyle = TextStyle(
    fontFamily: 'poppins',
    color: Colors.black,
  );

  static const TextStyle mediumBlackColorStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    fontSize: 18,
    color: Colors.black,
  );

  static const TextStyle mediumBlackColorStyle2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle mediumThemeColorColorStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    fontSize: 16,
    color: AppTheme.themeColor,
  );

  static const TextStyle largeThemeColorColorStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    fontSize: 28,
    color: AppTheme.themeColor,
  );

  static const TextStyle mediumWhiteColorStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    fontSize: 18,
    color: AppTheme.whiteColor,
  );

  static const TextStyle mediumGreyColorStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'poppins',
    fontSize: 18,
    color: AppTheme.greyColor,
  );

  static const TextStyle smallGreyColorStyle = TextStyle(
    fontFamily: 'poppins',
    color: Colors.grey,
  );

  static const TextStyle smallWhiteColorStyle = TextStyle(
    fontFamily: 'poppins',
    color: AppTheme.whiteColor,
  );

  static const TextStyle simpleFontFamily = TextStyle(
    fontFamily: 'poppins',
  );

  static const TextStyle heading1 = TextStyle(
    fontFamily: 'poppins',
    fontSize: 22,
    // color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bookDineInButtonStyle = TextStyle(
    fontFamily: 'poppins',
    fontSize: 22,
    color: AppTheme.whiteColor,
    fontWeight: FontWeight.bold,
  );
}
