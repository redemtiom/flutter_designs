import 'dart:math';

import 'package:disenos_app/src/theme/themechanger.dart';
import 'package:disenos_app/src/widgets/printerest_menu.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PrinterestPage extends StatelessWidget {
  const PrinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PrinterestGridView(),
            _PrinterestMenuLocation(),
          ],
        ),
        //PrinterestMenu(),
        //PrinterestGridView(),
      ),
    );
  }
}

class _PrinterestMenuLocation extends StatelessWidget {
  const _PrinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currenTheme;

    if (widthScreen > 500) {
      widthScreen = widthScreen - 300;
    }

    return Positioned(
        bottom: 30.0,
        child: Container(
          width: widthScreen,
          child: Row(
            children: [
              const Spacer(),
              PrinterestMenu(
                show: show,
                backgroundColor: appTheme!.scaffoldBackgroundColor,
                primaryColor: appTheme.accentColor,
                children: [
              PrinterestButton(
                  onPressed: () {
                    print('Icon pie chart');
                  },
                  icon: Icons.pie_chart),
              PrinterestButton(
                  onPressed: () {
                    print('Icon search');
                  },
                  icon: Icons.search),
              PrinterestButton(
                  onPressed: () {
                    print('Icon notifications');
                  },
                  icon: Icons.notifications),
              PrinterestButton(
                  onPressed: () {
                    print('Icon supervised user circle');
                  },
                  icon: Icons.supervised_user_circle),
                ],
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}

class PrinterestGridView extends StatefulWidget {
  const PrinterestGridView({Key? key}) : super(key: key);

  @override
  State<PrinterestGridView> createState() => _PrinterestGridViewState();
}

class _PrinterestGridViewState extends State<PrinterestGridView> {
  final int algo = 4;
  final ScrollController controller = ScrollController();
  double scrollState = 0;

  @override
  void initState() {
    controller.addListener(() {
      //print('scroll listener: ${controller.offset} ');

      if (controller.offset > scrollState) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      scrollState = controller.offset;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count;

    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: count,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      //itemCount: 4,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          extent: (index % 5 + 1) * 100,
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      //color: backgroundColor ?? Colors.amber,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
