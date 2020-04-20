import 'package:flutter/material.dart';

class TercerReto extends StatefulWidget {
  @override
  TercerRetoState createState() => TercerRetoState();
}

class TercerRetoState extends State<TercerReto> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}

class Usuarios {
  String name;
  String description;
  String iconaction;
  Usuarios(this.name, this.description, this.iconaction );
}