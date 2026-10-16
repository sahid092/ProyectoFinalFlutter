import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ListaReparto extends StatelessWidget {
  final List<String> reparto;
  const ListaReparto({super.key, required this.reparto});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: reparto
          .map(
            (nombre) => Chip(
              avatar: const Icon(
                Icons.person_outline,
                size: 18,
                color: AppColors.textoSuave,
              ),
              label: Text(nombre),
              backgroundColor: AppColors.tarjeta,
              side: BorderSide(color: AppColors.secundario.withAlpha(160)),
            ),
          )
          .toList(),
    );
  }
}
