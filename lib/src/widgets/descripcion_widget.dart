import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/widgets/detalles_museo_widget.dart';

class WidgetDescripcion extends StatelessWidget {
  const WidgetDescripcion({Key? key, required this.museo}) : super(key: key);
  final Museos museo;
  @override
  Widget build(BuildContext context) {
    String img = museo.imagen ?? "";
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 180.h,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(museo.nombre.toString()),
              background: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                child:
                    Image.network(museo.imagen.toString(), fit: BoxFit.cover),
              ),
            ),
          ),
          SliverFillRemaining(
            child: detalles_museo_widget(museo: museo),
          ),
          // SliderFillRemaining(),
        ],
      ),
    )
        // Container(
        //   child: Text(museo.nombre.toString()),
        );
  }
}
