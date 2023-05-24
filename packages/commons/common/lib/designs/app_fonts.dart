import 'package:common/common.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/widgets.dart';

class AppFonts {
  static TextStyle montserrat({
    double fontSize = 18,
    Color color = AppColors.white,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle sourceSansPro({
    double fontSize = 18,
    Color color = AppColors.white,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.sourceSansPro(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }
}
