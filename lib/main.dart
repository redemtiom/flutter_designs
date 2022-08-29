//import 'package:disenos_app/src/pages/animaciones_page.dart';
//import 'package:disenos_app/src/retos/cuadrado_animado_reto.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
//import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';
import 'package:disenos_app/src/theme/themechanger.dart';
//import 'package:disenos_app/src/pages/printerest_page.dart';
//import 'package:disenos_app/src/labs/slideshow_page.dart';
//import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:disenos_app/src/pages/headers_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(1)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currenTheme = Provider.of<ThemeChanger>(context).currenTheme;

    return MaterialApp(
      title: 'Disenos App',
      theme: currenTheme,
      home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        final screenSize = MediaQuery.of(context).size;

        if (screenSize.width > 500) {
          return LauncherTabletPage();
        } else {
          return LauncherPage();
        }

        // print('Orientation: $orientation');
        // return Container(
        //   child: LauncherPage(),
        // );
      }),
    );
  }
}
