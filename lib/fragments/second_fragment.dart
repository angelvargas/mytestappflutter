//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mytestappflutter/models/Kaleido.dart';
class SecondFragment extends StatelessWidget {
  //Kaleido k = new Kaleido();
  final val = Kaleido().conectar();
  //Kaleido.conectar();
  @override
  Widget build(BuildContext context){
    return new Center(
      child: new Text(val),
    );
  }
}