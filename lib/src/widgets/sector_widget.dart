import 'package:museumsq/src/models/sector_model.dart';
import 'package:flutter/material.dart';
import 'package:museumsq/src/pages/museos_page.dart';

class JsonSectorWitget extends StatelessWidget {
  const JsonSectorWitget({Key? key, required this.model}) : super(key: key);
  final Sector model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => MuseoPage(sector: model)));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: AssetImage(model.imagen),
              colorFilter:
                  // ignore: unnecessary_new
                  new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
              height: 220,
              width: 420,
              fit: BoxFit.fill,
            ),
            Text(model.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 65,
                )),
          ],
        ),
      ),
    );
  }
}
