import 'package:flutter/material.dart';
import 'package:museumsq/src/widgets/inicio_widget.dart';
import 'package:museumsq/src/widgets/location_widget.dart';
import 'package:museumsq/src/widgets/user_widget.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.account_circle, "User"),
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu(Icons.location_on, "Locación"),
  //ItemMenu(Icons.search, "Buscar"),
  //ItemMenu(Icons.people, "Técnicos")
];
List<ItemMenu> materiales = [
  ItemMenu(Icons.light, "NORTE"),
  ItemMenu(Icons.build, "CENTER"),
  ItemMenu(Icons.cable, "SUR"),
];
List<Widget> homeWidgets = [
  const UserWidget(),
  InicioWidget(),
  const LocationWidget()
];
