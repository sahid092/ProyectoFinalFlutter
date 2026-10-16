import 'package:flutter/material.dart';

import '../models/genero.dart';
import '../services/genero_service.dart';
import '../widgets/cargando_indicador.dart';
import '../widgets/genero_card.dart';
import '../widgets/mensaje_error.dart';
import 'peliculas_genero_screen.dart';

class GenerosScreen extends StatefulWidget {
  const GenerosScreen({super.key});

  @override
  State<GenerosScreen> createState() => _GenerosScreenState();
}

class _GenerosScreenState extends State<GenerosScreen> {
  late Future<List<Genero>> _futuroGeneros;

  @override
  void initState() {
    super.initState();
    _futuroGeneros = GeneroService().obtenerGeneros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Géneros',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Genero>>(
        future: _futuroGeneros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CargandoIndicador();
          }
          if (snapshot.hasError) {
            return const MensajeError();
          }
          final generos = snapshot.data!;
          return ListView.builder(
            itemCount: generos.length,
            itemBuilder: (context, index) {
              final genero = generos[index];
              return GeneroCard(
                genero: genero,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PeliculasGeneroScreen(genero: genero),
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
