import 'package:flutter/material.dart';
import 'package:dbcrypt/dbcrypt.dart';


class Bluefish extends StatefulWidget {
  @override
  _BluefishState createState() => _BluefishState();
}
class _BluefishState extends State<Bluefish> {
  DBCrypt dBCrypt;
  String plainPassword;
  String hashedPassword;
  String resp;
  _BluefishState(){
    DBCrypt dBCrypt = DBCrypt();
    plainPassword = "super";

    String salt = dBCrypt.gensaltWithRounds(7);
    // hashedPassword = dBCrypt.hashpw(plainPassword, salt);
    // hashedPassword = "\$2x\$07\$5cDaDpgH0kIquwqDKtlUWel6kM5e6xOUzM37oLMqmnh0LQCh5R4ba";
    // hashedPassword = "\$2y\$08\$T5lqWnzVfNJ6q6WTcJRJROeA.AcDjXHvJzKnc1v4d37figlg.zNr6";
    hashedPassword = "\$2b\$08\$T5lqWnzVfNJ6q6WTcJRJROeA.AcDjXHvJzKnc1v4d37figlg.zNr6";
    // hashedPwd = dBCrypt.hashpw(plainPwd, salt);

    var isCorrect = new DBCrypt().checkpw(plainPassword, hashedPassword);
    resp = isCorrect ? 'True' :'False';
  }
  // 
  // static const 
  // String 

  // 
  // 
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(hashedPassword),
        Text(resp)
      ],
    );
  }
}