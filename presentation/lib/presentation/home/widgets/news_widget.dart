import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_2/resources/custom_colors.dart';
import 'package:test_2/resources/svg_assets.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final SvgPicture icon;

  const NewsWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomColors.bridalHealth,
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
              child: Container(
            child: SvgAsset.cake,
          ))
        ],
      ),
    );
  }
}
