import 'dart:math';

import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({Key? key}) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> rotacion;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0).animate(controller);
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
    return _Rectangle();
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
