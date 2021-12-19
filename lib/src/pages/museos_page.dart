import 'package:flutter/material.dart';
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/models/sector_model.dart';
import 'package:museumsq/src/services/api_service.dart';
import 'package:museumsq/src/widgets/museo_widget.dart';

class MuseoPage extends StatefulWidget {
  MuseoPage({Key? key, required this.sector}) : super(key: key);
  final Sector sector;

  @override
  _MuseoPageState createState() => _MuseoPageState();
}

class _MuseoPageState extends State<MuseoPage> {
  ApiService _apiService = ApiService();
  List<Museos>? _museos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _llenardatosmuseos();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.sector.nombre),
            ),
            body: _museos == null
                ? const SizedBox.square(
                    dimension: 50, child: CircularProgressIndicator())
                : _museos!.isEmpty
                    ? const Center(child: Text("No hay datos"))
                    : ListView(
                        children:
                            _museos!.map((e) => MuseoWitget(museo: e)).toList(),
                      )));
  }

  _llenardatosmuseos() async {
    String sec = widget.sector.nombre.toLowerCase();
    // ignore: avoid_print
    _museos = await _apiService.getMuseo(sec);
    setState(() {});
  }
}
