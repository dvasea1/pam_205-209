import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset {
  static SvgPicture cake = SvgPicture.asset('resources/svg/cake.svg',);

  static SvgPicture vegetables({double? width}) => SvgPicture.asset('resources/svg/vegetables.svg', width: width);
}
