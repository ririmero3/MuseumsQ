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
  String? fechaPublicacion;

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        idmuseo: json["id_museo"],
        idUser: json["id_User"],
        foto: json["foto"],
        comentario: json["comentario"],
        fechaPublicacion: json["fechaPublicacion"],
      );

  factory Comentario.created(String id) => Comentario(idmuseo: id);

  Map<String, dynamic> toJson() => {
        "id_museo": idmuseo,
        "id_User": idUser,
        "foto": foto,
        "comentario": comentario,
        "fechaPublicacion": fechaPublicacion,
      };
}
