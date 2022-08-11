import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow(
      {Key? key,
      required this.slides,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey})
      : super(key: key);

  final List<Widget> slides;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(primaryColor, secondaryColor),
      child: Center(
        child: Column(
          children: [
            Expanded(child: _Slides(slides: slides)),
            _Dots(
              length: slides.length,
            ),
          ],
        ),
      ),
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
    //final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final ssModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5)
            ? ssModel.primaryColor
            : ssModel.secondaryColor,
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
      //print('Pagina actual: ${pageViewController.page}');
      // Actualizar el provider, sliderModel
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
  late Color _primaryColor;
  late Color _secondaryColor;

  _SlideshowModel(this._primaryColor, this._secondaryColor);

  double get currentPage => _currentPage;

  Color get primaryColor => _primaryColor;

  Color get secondaryColor => _secondaryColor;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  set secondaryColor(Color color) {
    _secondaryColor = color;
    notifyListeners();
  }
}
