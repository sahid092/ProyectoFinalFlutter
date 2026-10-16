import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Imagen de red con esquinas redondeadas, placeholder y manejo de error.
class PosterImagen extends StatelessWidget {
  final String url;
  final double ancho;
  final double alto;

  const PosterImagen({
    super.key,
    required this.url,
    this.ancho = 60,
    this.alto = 80,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: ancho,
        height: alto,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progreso) {
          if (progreso == null) return child;
          return Container(
            width: ancho,
            height: alto,
            color: AppColors.secundario.withAlpha(90),
          );
        },
        errorBuilder: (context, error, stack) => Container(
          width: ancho,
          height: alto,
          color: AppColors.secundario.withAlpha(90),
          child: const Icon(Icons.movie_outlined, color: AppColors.textoSuave),
        ),
      ),
    );
  }
}
