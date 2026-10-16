import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/genero.dart';

class GeneroService {
  Future<List<Genero>> obtenerGeneros() async {
    final String respuesta = await rootBundle.loadString(
      'assets/data/generos.json',
    );
    final List<dynamic> datos = jsonDecode(respuesta);
    return datos
        .map((json) => Genero.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
