import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottonGordo extends StatelessWidget {
  const BottonGordo(
      {Key? key,
      required this.icon,
      required this.message,
      required this.onPressed,
      this.color1 = const Color(0xff6989F5),
      this.color2 = const Color(0xff906EF5)})
      : super(key: key);

  final IconData icon;
  final String message;
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _BotonGordoBackground(
            icon: icon,
            color1: color1,
            color2: color2,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 100.0, width: 40.0),
            FaIcon(
              icon,
              size: 40.0,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 18.0),
            )),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
            const SizedBox(width: 40.0)
          ]),
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  const _BotonGordoBackground(
      {Key? key,
      required this.icon,
      required this.color1,
      required this.color2})
      : super(key: key);

  final IconData icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
