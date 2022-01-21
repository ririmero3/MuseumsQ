import 'package:flutter/material.dart';
import 'package:museumsq/src/models/museos_model.dart';

class detallesmuseocontentwidget extends StatelessWidget {
  const detallesmuseocontentwidget({Key? key, required this.museo})
      : super(key: key);
  final Museos museo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: const Color(0xFFDEDEDE),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                    child: Text(
                      'Direccion: ' + museo.direccion.toString(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 50),
                  child: Text(
                    'Descripción: ' + museo.descripcion.toString(),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Telefono: ' + museo.telefono.toString(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
