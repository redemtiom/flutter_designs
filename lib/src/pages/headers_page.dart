import 'package:disenos_app/src/theme/themechanger.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenTheme;

    return Scaffold(
      body: HeaderWave(
        color: appTheme!.accentColor,
      ),
    );
  }
}
