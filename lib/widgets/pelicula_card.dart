import 'package:flutter/material.dart';

import '../models/pelicula.dart';
import '../theme/app_colors.dart';
import 'poster_imagen.dart';

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;
  final VoidCallback onTap;

  const PeliculaCard({super.key, required this.pelicula, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tarjeta,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: PosterImagen(url: pelicula.imagen),
        title: Text(
          pelicula.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${pelicula.anio} · ${pelicula.duracion}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 18, color: AppColors.acento),
            const SizedBox(width: 4),
            Text(pelicula.calificacion.toStringAsFixed(1)),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
