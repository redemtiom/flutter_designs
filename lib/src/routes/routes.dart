import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/labs/slideshow_page.dart';
import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/printerest_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';

final pageRoutes =<_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', const SlideShowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro Animado', const CuadradoAnimado()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra Progreso', const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Printerest', const PrinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

class _Route {
  _Route(this.icon, this.titulo, this.page);

  final IconData icon;
  final String titulo;
  final Widget page;
}
