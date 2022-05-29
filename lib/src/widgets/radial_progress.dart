import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  const RadialProgress(
      {Key? key,
      required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.grosorPrimario = 10,
      this.grosorSecundario = 4})
      : super(key: key);

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(10),
            child: CustomPaint(
              painter: _MiRadialProgress(
                (widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value),
                widget.colorPrimario,
                widget.colorSecundario,
                widget.grosorPrimario,
                widget.grosorSecundario,
              ),
            ),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180.0);

  static const Gradient gradiente = LinearGradient(colors: [
    Color(0xffC012FF),
    Color(0xff6D05E8),
    Colors.red
  ]);

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorPrimario, this.grosorSecundario);

  @override
  void paint(Canvas canvas, Size size) {
    //** Circulo completado
    final paint = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorSecundario
      //..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Offset center = Offset(size.width * 0.5, size.width / 2);

    final double radius = min(size.width * 0.5, size.width * 0.5);

    canvas.drawCircle(center, radius, paint);

    //* arco
    double arcAngle = 2 * pi * (porcentaje / 100);

    final paintArco = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorPrimario.withOpacity(0.78)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //* arco glow
    final arcGlow = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorPrimario
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 10.0);

    //canvas.drawShadow(Path()..addArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle), colorPrimario, 1.0, true);
    //canvas.drawColor(color, BlendMode.luminosity);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      arcGlow,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
