import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow(
      {Key? key,
      required this.slides,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryBullet = 12.0,
      this.secondaryBullet = 12.0})
      : super(key: key);

  final List<Widget> slides;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: Center(child: Builder(
        builder: (context) {
          Future.microtask(() {
            Provider.of<_SlideshowModel>(context, listen: false).primaryColor =
                primaryColor;
            Provider.of<_SlideshowModel>(context, listen: false)
                .secondaryColor = secondaryColor;
            Provider.of<_SlideshowModel>(context, listen: false).primaryBullet =
                primaryBullet;
            Provider.of<_SlideshowModel>(context, listen: false)
                .secondaryBullet = secondaryBullet;
          });

          return Column(
            children: [
              Expanded(child: _Slides(slides: slides)),
              _Dots(
                length: slides.length,
              ),
            ],
          );
        },
      )),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key, required this.length}) : super(key: key);

  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => _Dot(index: index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    final double dotSize;
    final Color color;
    // final dotSize = (ssModel.currentPage == index)
    //     ? ssModel.primaryBullet
    //     : ssModel.secondaryBullet;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      dotSize = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      dotSize = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: dotSize,
      height: dotSize,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key, required this.slides}) : super(key: key);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((item) => _Slide(slide: item)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({Key? key, required this.slide}) : super(key: key);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => _currentPage;

  Color get primaryColor => _primaryColor;

  Color get secondaryColor => _secondaryColor;

  double get primaryBullet => _primaryBullet;

  double get secondaryBullet => _secondaryBullet;

  set primaryBullet(double value) {
    _primaryBullet = value;
    //notifyListeners();
  }

  set secondaryBullet(double value) {
    _secondaryBullet = value;
    //notifyListeners();
  }

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  set primaryColor(Color color) {
    _primaryColor = color;
    // notifyListeners();
  }

  set secondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }
}
