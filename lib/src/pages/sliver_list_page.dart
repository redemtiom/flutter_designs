import 'package:disenos_app/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _ButtonNewList()),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  //const _ButtonNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: (appTheme.darkTheme)
              ? appTheme.currenTheme!.accentColor
              : Color(0xffED6762),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          minimumSize: Size(size.width * 0.9, 100)),
      onPressed: () {},
      child: Text(
        'CREATE NEW LIST',
        style: TextStyle(
            color: appTheme.currenTheme!.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
      const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    ];

    final appTheme = Provider.of<ThemeChanger>(context).currenTheme;

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 202.0,
            maxHeight: 250.0,
            child: Container(
                color: appTheme!.scaffoldBackgroundColor,
                child: const _Titulo()),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 100.0,
          )
        ]))
        //SliverFillRemaining()
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
              fontSize: 50,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 8.0,
                  child: Container(
                    width: 120.0,
                    height: 8.0,
                    color:
                        (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
                  ),
                ),
                const Text(
                  'List',
                  style: TextStyle(
                      color: Color(0xffD93A30),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  const _ListaTareas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
      const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
      const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
      const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.titulo,
    required this.color,
  }) : super(key: key);

  final String titulo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(30.0),
      alignment: Alignment.centerLeft,
      height: 130.0,
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
