import 'package:flutter/material.dart';
import 'package:museumsq/src/providers/main_provider.dart';
import 'package:museumsq/src/utils/main_menu.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _options = ["User", "Inicio", "Locación"];
  @override
  void initState() {
    super.initState();
    //print("1. Inicio del widget");
  }

  @override
  Widget build(BuildContext context) {
    final maiprovider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
          leading: Switch(
            value: maiprovider.mode,
            onChanged: (bool value) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool("mode", value);
              maiprovider.mode = value;
            },
          ),
          centerTitle: true,
          title: Text('MuseumsQ - ' + _options[_selectedIndex])),
      body: homeWidgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _selectedIndex = index;
          //print("3. Cambio de estado del widget");
          setState(() {});
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: menuOptions
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
            .toList(),
      ),
    );
  }
}
