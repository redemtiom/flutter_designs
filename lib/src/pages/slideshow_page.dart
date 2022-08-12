import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: MiSlideShow()),
        Expanded(child: MiSlideShow())
      ],),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      primaryColor: Colors.red,
      secondaryColor: Colors.orange,
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
    ],);
  }
}
