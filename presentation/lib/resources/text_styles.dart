import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_2/resources/custom_colors.dart';

import 'fonts.dart';

class TextStyles {
  static TextStyle textStyleSignika18({Color? color}) =>
      TextStyle(fontSize: 18, color: color ?? CustomColors.mineShaft, fontFamily: Fonts.signikaRegular);

  static TextStyle textStyleSignika25({Color? color}) =>
      TextStyle(fontSize: 25, color: color ?? CustomColors.mineShaft, fontFamily: Fonts.signikaRegular);
}
