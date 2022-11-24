import 'package:flutter/cupertino.dart';
import 'package:test_2/presentation/home/widgets/news_widget.dart';
import 'package:test_2/resources/svg_assets.dart';

class NewsCarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: PageView(
        children: [
          NewsWidget(
            title: 'The pros and cons of fast food.',
            icon: SvgAsset.cake,
          ),
          NewsWidget(
            title: 'Hello title',
            icon: SvgAsset.cake,
          )
        ],
      ),
    );
  }
}
