import 'package:flutter/material.dart';
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/widgets/descripcion_widget.dart';

class DescripcionPage extends StatefulWidget {
  const DescripcionPage({Key? key, required this.mus}) : super(key: key);
  final Museos mus;
  @override
  _DescripcionPageState createState() => _DescripcionPageState();
}

class _DescripcionPageState extends State<DescripcionPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    return Scaffold(
      body: WidgetDescripcion(museo: widget.mus),
    );
    // SafeArea(
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height * 0.3,
    //     decoration: BoxDecoration(
    //       color: Color(0xFFEEEEEE),
    //     ),
    //     child: Container(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height * 0.3,
    //       child: Stack(
    //         children: [
    //           Column(
    //             mainAxisSize: MainAxisSize.max,
    //             children: [
    //               Image.network(
    //                 'https://picsum.photos/seed/663/600',
    //                 width: MediaQuery.of(context).size.width,
    //                 height: MediaQuery.of(context).size.height * 0.15,
    //                 fit: BoxFit.cover,
    //               ),
    //               Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 height: MediaQuery.of(context).size.height * 0.15,
    //                 decoration: BoxDecoration(
    //                   color: Color(0xFFEEEEEE),
    //                 ),
    //                 child: Column(
    //                   mainAxisSize: MainAxisSize.max,
    //                   children: [
    //                     Container(
    //                       width: MediaQuery.of(context).size.width,
    //                       height: MediaQuery.of(context).size.height * 0.03,
    //                       decoration: BoxDecoration(
    //                         color: Color(0xFFEEEEEE),
    //                       ),
    //                       alignment: AlignmentDirectional(0, 0),
    //                       child: Text(
    //                         'NOMBRE DEL MUSEO',
    //                         textAlign: TextAlign.center,
    //                         // style: FlutterFlowTheme.bodyText1.override(
    //                         //   fontFamily: 'Poppins',
    //                         //   color: Colors.black,
    //                         //   fontWeight: FontWeight.bold,
    //                         // ),
    //                       ),
    //                     ),
    //                     Container(
    //                       width: MediaQuery.of(context).size.width,
    //                       height: MediaQuery.of(context).size.height * 0.12,
    //                       constraints: BoxConstraints(
    //                         maxWidth: MediaQuery.of(context).size.width,
    //                         maxHeight:
    //                             MediaQuery.of(context).size.height * 0.05,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: Color(0xFFEEEEEE),
    //                       ),
    //                       alignment: AlignmentDirectional(0, 0),
    //                       child: Text(
    //                         "",
    //                         textAlign: TextAlign.center,
    //                         // style: FlutterFlowTheme.bodyText1,
    //                       ),
    //                     ),
    //                     Container(
    //                       width: MediaQuery.of(context).size.width,
    //                       height: MediaQuery.of(context).size.height * 0.03,
    //                       decoration: BoxDecoration(
    //                         color: Color(0xFFEEEEEE),
    //                       ),
    //                       child: Text(
    //                         'Direccion: AV. AMAZONAS Y Cuencca',
    //                         textAlign: TextAlign.center,
    //                         // style: FlutterFlowTheme.bodyText1,
    //                       ),
    //                     ),
    //                     Container(
    //                       width: MediaQuery.of(context).size.width,
    //                       height: MediaQuery.of(context).size.height * 0.03,
    //                       decoration: BoxDecoration(
    //                         color: Color(0xFFEEEEEE),
    //                       ),
    //                       child: Text(
    //                         'Telefono: 090909098098',
    //                         textAlign: TextAlign.center,
    //                         // style: FlutterFlowTheme.bodyText1.override(
    //                         //   fontFamily: 'Poppins',
    //                         //   fontWeight: FontWeight.bold,
    //                         // ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
// class MuseoPage extends StatefulWidget {
//   MuseoPage({Key? key, required this.sector}) : super(key: key);
//   final Sector sector;

//   @override
//   _MuseoPageState createState() => _MuseoPageState();
// }

// class _MuseoPageState extends State<MuseoPage> {
//   ApiService _apiService = ApiService();
//   List<Museos>? _museos;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _llenardatosmuseos();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: AppBar(
//               title: Text(widget.sector.nombre),
//             ),
//             body: _museos == null
//                 ? const SizedBox.square(
//                     dimension: 50, child: CircularProgressIndicator())
//                 : _museos!.isEmpty
//                     ? const Center(child: Text("No hay datos"))
//                     : ListView(
//                         children:
//                             _museos!.map((e) => MuseoWitget(museo: e)).toList(),
//                       )));
//   }

//   _llenardatosmuseos() async {
//     String sec = widget.sector.nombre.toLowerCase();
//     // ignore: avoid_print
//     _museos = await _apiService.getMuseo(sec);
//     setState(() {});
//   }
// }
