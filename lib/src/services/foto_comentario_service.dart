import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:museumsq/src/models/comentario_model.dart';

class FotocomentarioService {
  FotocomentarioService();
  final String _urlroot = "https://museumsq.web.app/api/museo/foto";

  Future<int> postFoto(Comentario fotocomentario) async {
    try {
      String _fotocomentariobody = comentarioToJson(fotocomentario);
      var uri = Uri.parse(_urlroot);
      print("FOTOCOMENTARIO " + _fotocomentariobody);
      final Map<String, String> _headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };
      print("paso1 ");
      var response =
          await http.post(uri, headers: _headers, body: _fotocomentariobody);
      print("paso2 ");
      if (response.body.isEmpty) return 400;
      print("paso3 ");
      Map<String, dynamic> content = json.decode(response.body);
      print("paso4 ");
      return content["Estado"];

    } catch (ex) {
      developer.log("Error $ex");
      return 500;
    }
  }
}
