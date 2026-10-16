import 'package:flutter/material.dart';

import '../models/pelicula.dart';
import '../theme/app_colors.dart';
import '../widgets/calificacion_estrellas.dart';
import '../widgets/encabezado_detalle.dart';
import '../widgets/info_chip.dart';
import '../widgets/lista_reparto.dart';
import '../widgets/titulo_seccion.dart';

class DetallePeliculaScreen extends StatelessWidget {
  final Pelicula pelicula; // Se recibe la película completa por constructor

  const DetallePeliculaScreen({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          EncabezadoDetalle(titulo: pelicula.titulo, imagen: pelicula.imagen),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CalificacionEstrellas(calificacion: pelicula.calificacion),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      InfoChip(
                        icono: Icons.calendar_today_outlined,
                        texto: '${pelicula.anio}',
                      ),
                      InfoChip(
                        icono: Icons.timer_outlined,
                        texto: pelicula.duracion,
                      ),
                      InfoChip(
                        icono: Icons.movie_creation_outlined,
                        texto: pelicula.director,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const TituloSeccion(texto: 'Sinopsis'),
                  Text(
                    pelicula.sinopsis,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.texto,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const TituloSeccion(texto: 'Reparto'),
                  ListaReparto(reparto: pelicula.reparto),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
