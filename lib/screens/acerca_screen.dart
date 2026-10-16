import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/titulo_seccion.dart';

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acerca de',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TituloSeccion(texto: 'Proyecto'),
            Text(
              'Catálogo de películas hecho en Flutter. '
              'Los datos viven en archivos JSON locales y las imágenes '
              'se cargan desde internet.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            TituloSeccion(texto: 'Integrantes'),
            Text(
              '• Integrante 1',
              style: TextStyle(color: AppColors.textoSuave),
            ),
            Text(
              '• Integrante 2',
              style: TextStyle(color: AppColors.textoSuave),
            ),
            SizedBox(height: 24),
            TituloSeccion(texto: 'Materia'),
            Text('Desarrollo de Aplicaciones Móviles - Unidad 3'),
          ],
        ),
      ),
    );
  }
}
