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

  // Función que devuelve el enlace de la imagen según el género
  String _imagenDe(String nombre) {
    switch (nombre.toLowerCase()) {
      case 'drama':
        return 'https://images.unsplash.com/photo-1485846234645-a62644f84728';
      case 'ciencia':
        return 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23';
      case 'animacion':
        return 'https://images.unsplash.com/photo-1626544827763-d516dce335e2';
      default:
        return 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba';
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
          // Aquí cargamos la imagen en lugar del icono
          backgroundImage: NetworkImage(_imagenDe(genero.icono)),
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