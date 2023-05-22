import 'package:common/common.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/widgets.dart';

class AppFonts {
  static TextStyle montserrat({
    double fontSize = 18,
    Color color = AppColors.white,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
