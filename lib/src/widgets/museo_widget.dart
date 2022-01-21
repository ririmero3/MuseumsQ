import 'package:flutter/material.dart';
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/pages/descripcion_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MuseoWitget extends StatelessWidget {
  const MuseoWitget({Key? key, required this.museo}) : super(key: key);
  final Museos museo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFFbc8a5f),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-0.7, 0),
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  museo.imagen.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                await prefs.setString('nombre', museo.nombre.toString());
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            DescripcionPage(mus: museo)));
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFF8b5e34),
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: const BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                      child: Text(
                        museo.nombre ?? "No encontrado",
                        textAlign: TextAlign.center,
                        // style: FlutterFlowTheme.title2.override(
                        //   fontFamily: 'Poppins',
                        //   color: Colors.white,
                        //   fontSize: 15,
                        // ),
                      ),
                    ),
                    Text(
                      '    Dirección: ' + museo.direccion.toString(),
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Poppins',
                      //   color: Color(0xFFD2D7E4),
                      //   fontSize: 10,
                      // ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.63,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: const BoxDecoration(
                        color: Color(0x00ade8f4),
                      ),
                      alignment:
                          const AlignmentDirectional(0.3999999999999999, 0),
                      child: Text(
                        museo.descripcion ?? "No encontrado",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFdee2e6),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
