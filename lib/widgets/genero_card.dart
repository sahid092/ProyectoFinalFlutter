import 'package:flutter/material.dart';

import '../models/genero.dart';
import '../theme/app_colors.dart';

class GeneroCard extends StatelessWidget {
  final Genero genero;
  final VoidCallback onTap;

  const GeneroCard({super.key, required this.genero, required this.onTap});

  IconData _iconoDe(String nombre) {
    switch (nombre) {
      case 'drama':
        return Icons.theater_comedy;
      case 'ciencia':
        return Icons.rocket_launch;
      case 'animacion':
        return Icons.movie_filter;
      default:
        return Icons.movie;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tarjeta,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.secundario.withAlpha(110),
          child: Icon(_iconoDe(genero.icono), color: AppColors.texto),
        ),
        title: Text(
          genero.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(genero.descripcion),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
