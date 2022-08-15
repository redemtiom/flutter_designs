import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrinterestMenu extends StatelessWidget {
  const PrinterestMenu(
      {Key? key,
      required this.children,
      this.show = true,
      this.backgroundColor = Colors.white,
      this.primaryColor = Colors.black,
      this.secondaryColor = Colors.blueGrey})
      : super(key: key);

  final List<PrinterestButton> children;

  final bool show;

  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: Builder(builder: (BuildContext context) {
          Future.microtask(() {
            Provider.of<_MenuModel>(context, listen: false).backgroundColor =
                backgroundColor;
            Provider.of<_MenuModel>(context, listen: false).primaryColor =
                primaryColor;
            Provider.of<_MenuModel>(context, listen: false).secondaryColor =
                secondaryColor;
          });

          return AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: (show) ? 1 : 0,
            child: _PrinterestMenuBackground(
              child: _MenuItems(menuItems: children),
            ),
          );
        }));
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
          color: Provider.of<_MenuModel>(context).backgroundColor,
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
    //final itemSelecionado = Provider.of<_MenuModel>(context).itemSelecionado;

    final menuModel = Provider.of<_MenuModel>(context);

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
            size: (menuModel.itemSelecionado == index) ? 35.0 : 25.0,
            color: (menuModel.itemSelecionado == index)
                ? menuModel.primaryColor
                : menuModel.secondaryColor,
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
  Color _backgroundColor = Colors.white;
  Color _primaryColor = Colors.black;
  Color _secondaryColor = Colors.blueGrey;

  int get itemSelecionado => _itemSelecionado;

  Color get backgroundColor => _backgroundColor;

  Color get primaryColor => _primaryColor;

  Color get secondaryColor => _secondaryColor;

  set itemSelecionado(int index) {
    _itemSelecionado = index;
    notifyListeners();
  }

  set backgroundColor(Color value) {
    _backgroundColor = value;
    notifyListeners();
  }

  set primaryColor(Color value) {
    _primaryColor = value;
    notifyListeners();
  }

  set secondaryColor(Color value) {
    _secondaryColor = value;
    notifyListeners();
  }
}
