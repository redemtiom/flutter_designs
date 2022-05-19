import 'dart:math' as math;

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

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> mover;
  late Animation<double> agrandar;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0, 0.25, curve: Curves.easeOut),
    ));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 1.0, curve: Curves.easeOut),
    ));

    mover = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(controller);

    controller.addListener(() {
      print('controller value: ${controller.value}');
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
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
    controller.forward();

    return AnimatedBuilder(
        animation: controller,
        child: const _Rectangle(),
        builder: (BuildContext context, Widget? childRectangulo) {
          return Transform.translate(
            offset: Offset(mover.value, 0.0),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value - opacidadOut.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childRectangulo,
                ),
              ),
            ),
          );
        });
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
