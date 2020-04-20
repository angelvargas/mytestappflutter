import 'package:flutter/material.dart';

class TercerReto extends StatefulWidget {
  @override
  TercerRetoState createState() => TercerRetoState();
}

class TercerRetoState extends State<TercerReto> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Review("assets/img/persona1.jpg", "Miguel Lopez", "Experiencia : 1 años"),
        Review("assets/img/persona2.png", "Antonio Perez", "Experiencia : 2 años"),
        Review("assets/img/persona3.png", "Mariana Mendez", "Experiencia : 3 años"),
        Review("assets/img/persona1.jpg", "Mariana Mendez", "Experiencia : 4 años"),
        Review("assets/img/persona2.png", "Mariana Mendez", "Experiencia : 5 años"),
        Review("assets/img/persona3.png", "Mariana Mendez", "Experiencia : 6 años"),
        Review("assets/img/persona1.jpg", "Mariana Mendez", "Experiencia : 7 años"),
        Review("assets/img/persona2.png", "Mariana Mendez", "Experiencia : 8 años"),
        Review("assets/img/persona3.png", "Mariana Mendez", "Experiencia : 9 años"),
      ],
    );
  }
}


class Review extends StatelessWidget {
  String pathImage = "asset/img/people.jpg";
  String name = "Varuna Yasas";
  String details = "1 review 5 Photos";

  Review(this.pathImage, this.name, this.details);
  @override
  Widget build(BuildContext context) {

    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 13, color: Color(0xFFa3a5a7)),
      ),
    );

    final username = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[username, userInfo],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );
    
    final actions = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage))),
    );

    return Row(
      children: <Widget>[photo, userDetails, actions],
    );
  }
}

class Usuarios {
  String name;
  String description;
  String iconaction;
  Usuarios(this.name, this.description, this.iconaction );
}