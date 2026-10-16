class Genero {
  final int id;
  final String nombre;
  final String descripcion;
  final String icono;

  Genero({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.icono,
  });

  factory Genero.fromJson(Map<String, dynamic> json) {
    return Genero(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String,
      icono: json['icono'] as String,
    );
  }
}
