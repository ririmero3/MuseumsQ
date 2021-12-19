// To parse this JSON data, do
//
//     final sector = sectorFromJson(jsonString);

import 'dart:convert';

Sector sectorFromJson(String str) => Sector.fromJson(json.decode(str));

String sectorToJson(Sector data) => json.encode(data.toJson());

class Sector {
  Sector({
    required this.nombre,
    required this.imagen,
  });

  String nombre;
  String imagen;

  factory Sector.fromJson(Map<String, dynamic> json) => Sector(
        nombre: json["nombre"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "imagen": imagen,
      };
}
