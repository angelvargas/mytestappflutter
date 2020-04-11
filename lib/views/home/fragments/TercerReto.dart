import 'package:flutter/material.dart';

class TercerReto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class TercerRetoState extends State<TercerReto> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}

class Item {
  String imagen;
  String titulo;
  String subtitulo;
  String icono;
  Item(this.imagen, this.titulo, this.subtitulo, this.icono );
}