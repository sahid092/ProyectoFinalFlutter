import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/pelicula.dart';

/// Lee las películas del JSON local. La UI nunca toca el archivo directamente.
class PeliculaService {
  Future<List<Pelicula>> obtenerPeliculas() async {
    final String respuesta = await rootBundle.loadString(
      'assets/data/peliculas.json',
    );
    final List<dynamic> datos = jsonDecode(respuesta);
    return datos
        .map((json) => Pelicula.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Pelicula>> obtenerPorGenero(int generoId) async {
    final todas = await obtenerPeliculas();
    return todas.where((p) => p.generoId == generoId).toList();
  }
}
