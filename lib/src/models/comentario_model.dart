import 'dart:convert';

Comentario comentarioFromJson(String str) =>
    Comentario.fromJson(json.decode(str));

String comentarioToJson(Comentario data) => json.encode(data.toJson());

class Comentario {
  Comentario({
    this.idmuseo,
    this.idUser,
    this.foto,
    this.comentario,
    this.fechaPublicacion,
  });
  String? idmuseo;
  String? idUser;
  String? foto;
  String? comentario;
  DateTime? fechaPublicacion;

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        idmuseo: json["id_museo"],
        idUser: json["id_User"],
        foto: json["foto"],
        comentario: json["comentario"],
        fechaPublicacion: DateTime.parse(json["fechaPublicacion"]),
      );

  Map<String, dynamic> toJson() => {
        "id_museo": idmuseo,
        "id_User": idUser,
        "foto": foto,
        "comentario": comentario,
        "fechaPublicacion": fechaPublicacion!.toIso8601String(),
      };
}
