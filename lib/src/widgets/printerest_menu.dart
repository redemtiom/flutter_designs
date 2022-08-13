import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrinterestMenu extends StatelessWidget {
  const PrinterestMenu({Key? key, this.show = true}) : super(key: key);

  final bool show;

  @override
  Widget build(BuildContext context) {
    final List<PrinterestButton> items = [
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
  ];

    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: _PrinterestMenuBackground(child: _MenuItems(menuItems: items)));
  }
}

class _PrinterestMenuBackground extends StatelessWidget {
  const _PrinterestMenuBackground({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              spreadRadius: -5,
            )
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  final List<PrinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) =>
              _PrinterestMenuButton(index: index, menuItem: menuItems[index])),
    );
  }
}

class _PrinterestMenuButton extends StatelessWidget {
  const _PrinterestMenuButton(
      {Key? key, required this.index, required this.menuItem})
      : super(key: key);

  final int index;
  final PrinterestButton menuItem;

  @override
  Widget build(BuildContext context) {
    final itemSelecionado = Provider.of<_MenuModel>(context).itemSelecionado;

    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSelecionado =
              index;
          menuItem.onPressed();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          child: Icon(
            menuItem.icon,
            size: (itemSelecionado == index) ? 35.0 : 25.0,
            color: (itemSelecionado == index) ? Colors.black : Colors.blueGrey,
          ),
        ));
  }
}

class PrinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PrinterestButton({required this.onPressed, required this.icon});
}

class _MenuModel with ChangeNotifier {
  int _itemSelecionado = 0;

  int get itemSelecionado => _itemSelecionado;

  set itemSelecionado(int index) {
    _itemSelecionado = index;
    notifyListeners();
  }
}
