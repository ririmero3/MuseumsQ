import 'package:flutter/material.dart';
import 'package:museumsq/src/models/comentario_model.dart';
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/widgets/comentario_form_widget.dart';
import 'package:museumsq/src/widgets/detalles_museo_content_widget.dart';
import 'package:museumsq/src/widgets/location_widget.dart';

// ignore: camel_case_types
class detalles_museo_widget extends StatefulWidget {
  const detalles_museo_widget({Key? key, required this.museo})
      : super(key: key);
  final Museos museo;

  @override
  _detalles_museo_widgetState createState() => _detalles_museo_widgetState();
}

// ignore: camel_case_types
class _detalles_museo_widgetState extends State<detalles_museo_widget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    const Tab(text: 'Detalles'),
    const Tab(text: 'Ubicación'),
    const Tab(text: 'Comentarios')
  ];

  // ignore: unused_field
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(tabs: _tabs, controller: _tabController),
      body: TabBarView(
        children: [
          detallesmuseocontentwidget(museo: widget.museo),
          const LocationWidget(),
          comentarioformwidget(
              idmuseo: widget.museo.nombre.toString(),
              museo: widget.museo,
              isInicio: true),
        ],
        controller: _tabController,
      ),
    );
  }
}
