//import 'package:disenos_app/src/pages/animaciones_page.dart';
//import 'package:disenos_app/src/retos/cuadrado_animado_reto.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
//import 'package:disenos_app/src/pages/printerest_page.dart';
//import 'package:disenos_app/src/labs/slideshow_page.dart';
//import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

//import 'package:disenos_app/src/pages/headers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disenos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmergencyPage(),
    );
  }
}

