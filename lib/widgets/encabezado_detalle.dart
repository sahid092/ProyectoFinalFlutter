import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// SliverAppBar que colapsa la imagen al hacer scroll.
class EncabezadoDetalle extends StatelessWidget {
  final String titulo;
  final String imagen;

  const EncabezadoDetalle({
    super.key,
    required this.titulo,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: AppColors.primario,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [Shadow(blurRadius: 6, color: Colors.black54)],
          ),
        ),
        background: Image.network(
          imagen,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) =>
              Container(color: AppColors.secundario),
        ),
      ),
    );
  }
}
