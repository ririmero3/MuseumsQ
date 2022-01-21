import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:museumsq/src/models/comentario_model.dart';
import 'package:museumsq/src/models/museos_model.dart';
import 'package:museumsq/src/services/foto_comentario_service.dart';

class comentarioformwidget extends StatefulWidget {
  const comentarioformwidget(
      {Key? key,
      required this.idmuseo,
      required this.museo,
      required this.isInicio})
      : super(key: key);
  final Museos museo;
  final String idmuseo;
  final bool isInicio;
  @override
  _comentarioformwidgetState createState() => _comentarioformwidgetState();
}

class _comentarioformwidgetState extends State<comentarioformwidget> {
  late Comentario _comentario;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  final _formkey = GlobalKey<FormState>();
  bool _onSaving = false;
  final FotocomentarioService _fotocomentarioService = FotocomentarioService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _comentario = Comentario.created(widget.idmuseo);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xFFDADADA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            initialValue: _comentario.comentario,
                            onSaved: (value) {
                              _comentario.comentario = value;
                              print("VALOR COMENTARIO " + value.toString());
                            },
                            validator: (value) {
                              if (value!.length < 15) {
                                return "Minimo 15 caracteres";
                              }
                            },
                            decoration:
                                const InputDecoration(labelText: "Comentario"),
                            maxLength: 255,
                            maxLines: 4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                        child: _imagen == null
                            ? Image.network(widget.museo.imagen ?? "",
                                width: 100, height: 120, fit: BoxFit.cover)
                            : Image.file(_imagen!),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () =>
                                      _selecImage(ImageSource.camera),
                                  icon: const Icon(Icons.camera),
                                  label: const Text("Cámara")),
                              ElevatedButton.icon(
                                  onPressed: () =>
                                      _selecImage(ImageSource.gallery),
                                  icon: const Icon(Icons.image),
                                  label: const Text("Galería")),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                child: _onSaving
                                    ? const CircularProgressIndicator()
                                    : Tooltip(
                                        message: "Agregar comentario",
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            textStyle: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          onPressed: () {
                                            _sendForm();
                                          },
                                          icon: const Icon(Icons.save),
                                          label: const Text("Comentar"),
                                        ),
                                      ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _selecImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
    }
    print("FOTOIMAGEN $_imagen");
    setState(() {});
  }

  _sendForm() async {
    if (!_formkey.currentState!.validate()) return;

    _onSaving = true;
    setState(() {});
    _formkey.currentState!.save();
    String comen = _comentario.comentario.toString();
    print("COMENTARIO NUEVO " + comen);
    int estado = await _fotocomentarioService.postFoto(_comentario);
    if (estado == 201) {
      _formkey.currentState!.reset();
      _onSaving = false;
      _formkey.currentState!.setState(() {});
      setState(() {});
    }
  }
}
