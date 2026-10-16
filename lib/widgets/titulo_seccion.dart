import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TituloSeccion extends StatelessWidget {
  final String texto;
  const TituloSeccion({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          texto.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: AppColors.texto,
          ),
        ),
        const Divider(thickness: 1.5),
        const SizedBox(height: 8),
      ],
    );
  }
}
