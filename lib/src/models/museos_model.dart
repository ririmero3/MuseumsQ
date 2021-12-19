import 'dart:convert';

Museos museoFromJson(String str) => Museos.fromJson(json.decode(str));

String museoToJson(Museos data) => json.encode(data.toJson());

class Museos {
  Museos({
    this.nombre,
    this.direccion,
    this.descripcion,
    this.telefono,
    this.imagen,
  });

  String? nombre;
  String? direccion;
  String? telefono;
  String? descripcion;
  String? imagen;

  factory Museos.fromJson(Map<String, dynamic> json) => Museos(
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
        "descripcion": descripcion,
        "imagen": imagen,
      };
}
