import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class EstadoVacio extends StatelessWidget {
  final String mensaje;
  const EstadoVacio({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.inbox_outlined,
              size: 48,
              color: AppColors.textoSuave,
            ),
            const SizedBox(height: 12),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textoSuave),
            ),
          ],
        ),
      ),
    );
  }
}
