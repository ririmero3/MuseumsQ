// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/models/sector_model.dart';

class ApiService {
  ApiService();
  Future<List<Museos>?> getMuseo(String sec) async {
    Sector sector;

    try {
      List<Museos> result = [];

      var url = Uri.parse('https://museumsq.web.app/api/museo' + sec);
      var response = await http.get(url);

      if (response.body.isEmpty) return result;
      var content = json.decode(response.body);
      List<dynamic> listmuseo = content;
      // ignore: avoid_print

      for (var item in listmuseo) {
        var museo = Museos.fromJson(item);
        result.add(museo);
      }
      return result;
      // ignore: avoid_print, dead_code
      print(result);
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
    }
  }
}
