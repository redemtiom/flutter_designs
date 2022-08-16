import 'package:disenos_app/src/widgets/boton_gordo.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BottonGordo(
          icon: FontAwesomeIcons.carBurst,
          message: 'Hola que hay',
          onPressed: () {
            print('no se');
          },
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Haz Solicitado',
      subtitle: 'Asistencia Médica',
    );
  }
}
