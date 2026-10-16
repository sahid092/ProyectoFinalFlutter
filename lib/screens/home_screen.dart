import 'package:flutter/material.dart';

import '../models/pelicula.dart';
import '../services/pelicula_service.dart';
import '../widgets/cargando_indicador.dart';
import '../widgets/mensaje_error.dart';
import '../widgets/pelicula_card.dart';
import 'detalle_pelicula_screen.dart';
import 'generos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pelicula>> _futuroPeliculas;

  @override
  void initState() {
    super.initState();
    // Se crea una sola vez para que no recargue en cada rebuild
    _futuroPeliculas = PeliculaService().obtenerPeliculas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cartelera',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.category_outlined),
            tooltip: 'Géneros',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GenerosScreen()),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Pelicula>>(
        future: _futuroPeliculas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CargandoIndicador();
          }
          if (snapshot.hasError) {
            return const MensajeError();
          }
          final peliculas = snapshot.data!;
          return ListView.builder(
            itemCount: peliculas.length,
            itemBuilder: (context, index) {
              final pelicula = peliculas[index];
              return PeliculaCard(
                pelicula: pelicula,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetallePeliculaScreen(pelicula: pelicula),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
