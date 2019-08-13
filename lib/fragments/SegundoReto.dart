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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.5],
              colors: [
                Color.fromRGBO(0, 0, 0, 0.4), 
                Color.fromRGBO(0, 0, 0, 0.6)
              ],
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
              //stops: [0.0, 1],
              //colors: [
              //  Colors.red,
              //  Colors.cyan
                //Color.fromRGBO(0, 0, 0, 0.4),
                //Color.fromRGBO(0, 0, 0, 0.7)
              //]
            )
          ),
          //color: Color.fromRGBO(0, 0, 0, 0.5),
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
      
    );
  }
}