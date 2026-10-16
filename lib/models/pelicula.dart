class Pelicula {
  final int id;
  final int generoId;
  final String titulo;
  final String imagen;
  final int anio;
  final String duracion;
  final double calificacion;
  final String director;
  final String sinopsis;
  final List<String> reparto;

  Pelicula({
    required this.id,
    required this.generoId,
    required this.titulo,
    required this.imagen,
    required this.anio,
    required this.duracion,
    required this.calificacion,
    required this.director,
    required this.sinopsis,
    required this.reparto,
  });

  // Convierte el Map del JSON en un objeto Pelicula
  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      id: json['id'] as int,
      generoId: json['generoId'] as int,
      titulo: json['titulo'] as String,
      imagen: json['imagen'] as String,
      anio: json['anio'] as int,
      duracion: json['duracion'] as String,
      // num cubre tanto 8 como 8.2 en el JSON
      calificacion: (json['calificacion'] as num).toDouble(),
      director: json['director'] as String,
      sinopsis: json['sinopsis'] as String,
      reparto: List<String>.from(json['reparto']),
    );
  }
}
