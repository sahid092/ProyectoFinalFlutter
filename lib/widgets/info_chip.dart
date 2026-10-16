import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class InfoChip extends StatelessWidget {
  final IconData icono;
  final String texto;

  const InfoChip({super.key, required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secundario.withAlpha(90),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 16, color: AppColors.texto),
          const SizedBox(width: 6),
          Text(texto, style: const TextStyle(color: AppColors.texto)),
        ],
      ),
    );
  }
}
