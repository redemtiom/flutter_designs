import 'package:disenos_app/src/theme/themechanger.dart';
import 'package:disenos_app/src/widgets/neon_text.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFFbc13fe).withOpacity(0.78),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFbc13fe),
                    offset: Offset(0, 0),
                    blurRadius: 20,
                    spreadRadius: 3)
              ]),
          child: Icon(Icons.refresh),
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    color: Colors.lightBlue,
                  ),
                  NeonText(
                    message: porcentaje.toString(),
                    color: Colors.lightBlue,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    color: Colors.cyan,
                  ),
                  NeonText(
                    message: porcentaje.toString(),
                    color: Colors.cyan,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    color: Colors.amber,
                  ),
                  NeonText(
                    message: porcentaje.toString(),
                    color: Colors.amber,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomRadialProgress(
                    porcentaje: porcentaje,
                    color: Colors.deepOrange,
                  ),
                  NeonText(
                    message: porcentaje.toString(),
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    Key? key,
    required this.color,
    required this.porcentaje,
  }) : super(key: key);

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currenTheme;

    return Container(
      width: 200,
      height: 200,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme!.textTheme.bodyText1!.color ?? Colors.white,//Colors.white,
        grosorSecundario: 10,
        grosorPrimario: 4,
      ),
    );
  }
}
