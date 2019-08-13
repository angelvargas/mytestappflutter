import 'package:flutter/material.dart';

class SegundoReto extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/img.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: Container(
          height: 60.0,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: Center(
            child: Text(
              "SOCCER",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 40.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
      /*
      child: Center(
        child: Container(
          //height: 60,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: Center(
            child:Text(
              "SOCCER",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 40.0,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
      ),
      */
    );
  }
}