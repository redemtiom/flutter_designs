import 'package:flutter/material.dart';

class CuadradoAnimadoReto extends StatelessWidget {
  const CuadradoAnimadoReto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation moverD;
  late Animation moverA;
  late Animation moverI;
  late Animation moverAb;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    moverD = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moverA = Tween(begin: 0.0, end: - 100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));
    
    moverI = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));

    moverAb = Tween(begin: 0.0, end: - 100.0)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() { 
      if(controller.status == AnimationStatus.completed){
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
      child: const _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moverD.value - moverI.value, moverA.value - moverAb.value),
          child: const _Rectangulo(),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.0,
        height: 70.0,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ));
  }
}
