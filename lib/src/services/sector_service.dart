import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:museumsq/src/models/sector_model.dart';

class SectorService {
  SectorService();

  Future<List<Sector>> getSector() async {
    List<Sector> result = [];
    try {
      var content = await rootBundle.loadString("assets/json/sector.json");
      List<dynamic> list = json.decode(content);
      for (var item in list) {
        var sectores = Sector.fromJson(item);
        result.add(sectores);
      }
      // ignore: avoid_print
      print(result);
      return result;
    } catch (ex) {
      developer.log("Error $ex");
      return result;
    }
  }
}
