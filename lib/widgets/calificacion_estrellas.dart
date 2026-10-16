import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Muestra una calificación de 0 a 10 como 5 estrellas.
class CalificacionEstrellas extends StatelessWidget {
  final double calificacion;

  const CalificacionEstrellas({super.key, required this.calificacion});

  Widget _estrella(int posicion) {
    final double valor = calificacion / 2; // pasamos de 0-10 a 0-5
    if (valor >= posicion + 1) {
      return const Icon(Icons.star, color: AppColors.acento, size: 22);
    }
    if (valor >= posicion + 0.5) {
      return const Icon(Icons.star_half, color: AppColors.acento, size: 22);
    }
    return const Icon(Icons.star_border, color: AppColors.acento, size: 22);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++) _estrella(i),
        const SizedBox(width: 8),
        Text(
          calificacion.toStringAsFixed(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
