class Breed {
  final String name;
  final String origin;
  final String description;
  final int intelligence;
  final String lifeSpan;
  final String imageUrl;

  Breed({
    required this.name,
    required this.origin,
    required this.description,
    required this.intelligence,
    required this.lifeSpan,
    required this.imageUrl,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    String description = json['description'] ?? '';
    // Si es la raza "Abyssinian", repetimos la descripción 10 veces
    if (json['name'] == "Abyssinian") {
      description = description * 10;
    }

    // Inicializar con una cadena vacía
    String imageUrl = '';

    if (json['reference_image_id'] != null) {
      // Intentamos con .jpg primero
      imageUrl = 'https://cdn2.thecatapi.com/images/${json['reference_image_id']}.jpg';
    }

    // Retornamos el objeto Breed con los datos obtenidos
    return Breed(
      name: json['name'] ?? '',
      origin: json['origin'] ?? '',
      description: description,
      intelligence: json['intelligence'] ?? 0,
      lifeSpan: json['life_span'] ?? '',
      imageUrl: imageUrl,
    );
  }
}
