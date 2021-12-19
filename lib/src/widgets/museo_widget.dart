import 'package:flutter/material.dart';
import 'package:museumsq/src/models/museos_model.dart';

class MuseoWitget extends StatelessWidget {
  const MuseoWitget({Key? key, required this.museo}) : super(key: key);
  final Museos museo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: const Color(0xFF7986CB),
      elevation: 13,
      shadowColor: Colors.amberAccent[100],
      child: ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(museo.imagen.toString())),
          trailing: Text(
            museo.direccion.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          title: Text(
            museo.nombre ?? "No encontrado",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            museo.descripcion.toString() + '\t' + museo.telefono.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
          )),
    );
  }
}
