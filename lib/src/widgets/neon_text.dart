import 'package:flutter/material.dart';

class NeonText extends StatelessWidget {
  final String message;
  final Color color;
  const NeonText({Key? key, required this.message, this.color = Colors.amber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          '$message %',
          style: TextStyle(
              color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w400),
        ),
        Text(
          '$message %',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w400,
            shadows: [
              BoxShadow(
                color: color,
                offset: Offset.zero,
                blurRadius: 20.0,
                spreadRadius: 3.0,
                blurStyle: BlurStyle.outer
              ),
            ],
            color: color.withOpacity(0.78),
          ),
        ),
      ],
    );
  }
}
