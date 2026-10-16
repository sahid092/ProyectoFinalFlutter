import 'package:flutter/material.dart';

import '../models/genero.dart';
import '../models/pelicula.dart';
import '../services/pelicula_service.dart';
import '../widgets/cargando_indicador.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/mensaje_error.dart';
import '../widgets/pelicula_card.dart';
import 'detalle_pelicula_screen.dart';

class PeliculasGeneroScreen extends StatefulWidget {
  final Genero genero;
  const PeliculasGeneroScreen({super.key, required this.genero});

  @override
  State<PeliculasGeneroScreen> createState() => _PeliculasGeneroScreenState();
}

class _PeliculasGeneroScreenState extends State<PeliculasGeneroScreen> {
  late Future<List<Pelicula>> _futuroPeliculas;

  @override
  void initState() {
    super.initState();
    _futuroPeliculas = PeliculaService().obtenerPorGenero(widget.genero.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.genero.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
          if (peliculas.isEmpty) {
            return const EstadoVacio(
              mensaje: 'Aún no hay películas de este género',
            );
          }
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
