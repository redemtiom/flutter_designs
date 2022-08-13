import 'package:disenos_app/src/widgets/printerest_menu.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PrinterestPage extends StatelessWidget {
  const PrinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PrinterestGridView(),
          _PrinterestMenuLocation(),
        ],
      ),
      //PrinterestMenu(),
      //PrinterestGridView(),
    );
  }
}

class _PrinterestMenuLocation extends StatelessWidget {
  const _PrinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 30.0,
        child: Container(
          width: widthScreen,
          child: Align(child: PrinterestMenu()),
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
        print('ocultar menu');
      } else {
        print('mostrar menu');
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
    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: 2,
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
