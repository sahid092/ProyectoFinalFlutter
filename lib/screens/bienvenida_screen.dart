import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/boton_principal.dart';
import 'home_screen.dart';

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.local_movies,
                size: 80,
                color: AppColors.primario,
              ),
              const SizedBox(height: 16),
              const Text(
                'Aplicacion de Películas',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.texto,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Un catálogo de películas para descubrir qué ver hoy.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textoSuave),
              ),
              const SizedBox(height: 40),
              BotonPrincipal(
                texto: 'Ver películas',
                icono: Icons.movie,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
