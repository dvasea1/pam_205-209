import 'package:flutter/cupertino.dart';
import 'package:test_2/resources/custom_colors.dart';
import 'package:test_2/resources/strings.dart';
import 'package:test_2/resources/text_styles.dart';

class HomeHelloWidget extends StatelessWidget {
  final String userName;

  HomeHelloWidget({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${Strings.helloUser} $userName',
          style: TextStyles.textStyleSignika25(color: CustomColors.deYork),
        ),
        Text(Strings.findAndTrackEat,style: TextStyles.textStyleSignika18(color: CustomColors.boulder),),
      ],
    );
  }
}
