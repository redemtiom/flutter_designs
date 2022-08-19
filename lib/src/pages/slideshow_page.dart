import 'package:disenos_app/src/theme/themechanger.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTHeme = Provider.of<ThemeChanger>(context);
    final accentTheme = appTHeme.currenTheme!.accentColor;

    return Slideshow(
      primaryColor: (appTHeme.darkTheme) ? accentTheme : Color(0xffFF5A7E),
      //secondaryColor: Colors.orange,
      primaryBullet: 20,
      secondaryBullet: 12,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
