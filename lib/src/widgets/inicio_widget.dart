// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:museumsq/src/models/sector_model.dart';
import 'package:museumsq/src/services/sector_service.dart';
import 'package:museumsq/src/widgets/sector_widget.dart';

class InicioWidget extends StatefulWidget {
  InicioWidget({Key? key}) : super(key: key);

  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  SectorService sectorservice = SectorService();
  List<Sector>? sector;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    llenarsector();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sector == null
          ? const SizedBox.square(
              dimension: 50, child: CircularProgressIndicator())
          : sector!.isEmpty
              ? const Center(child: Text("Sin datos"))
              : ListView(
                  children:
                      sector!.map((e) => JsonSectorWitget(model: e)).toList(),
                ),
    );
  }

  llenarsector() async {
    sector = await sectorservice.getSector();
    setState(() {});
  }
}
