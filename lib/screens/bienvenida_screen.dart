import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/boton_principal.dart';
import 'home_screen.dart';

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 1. Imagen de fondo (puedes cambiar el enlace por la que quieras)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba',
            ),
            fit: BoxFit.cover,
          ),
        ),
        // 2. Capa oscura semitransparente para que el texto resalte
        child: Container(
          color: Colors.black.withOpacity(0.65),
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
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
                      color: Colors.white, // Blanco para que contraste bien con el fondo
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Un catálogo de películas para descubrir qué ver hoy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70, // Texto suave claro
                    ),
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
        ),
      ),
    );
  }
}