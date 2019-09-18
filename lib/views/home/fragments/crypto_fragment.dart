import 'package:flutter/material.dart';
import 'package:mytestappflutter/presenter/crypto_presenter.dart';

class CryptoFragment extends StatefulWidget {
	//final Web3jPresenter presenter;
	
	final String title;
	CryptoFragment({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CryptoFragmentState();
  }
}

class CryptoFragmentState extends State<CryptoFragment> implements CryptoView {
  CryptoPresenter presenter;
  String _msg = "Cryptolist";
  CryptoFragmentState(){
    this.presenter = new CryptoPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Text(_msg),
          RawMaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            ),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              //color: Color(0xFF000000)
            ),
            fillColor: Colors.blue,
            elevation: 5.0,
            highlightElevation: 15.0,
            padding: EdgeInsets.only(
                left: 50.0, right: 50.0, top: 20.0, bottom: 20.0),
            child: Text("Change Text"),
            onPressed: () {
							presenter.execute();
              //test();
              //getBlockWeb3();
              //ethrpc();
              //newWallet();
            },
          ),
        ],
      )
    );
  }

  @override
  void getlist() {
    // TODO: implement getlist
  }

  @override
  void setmsg(String msg) {
    setState(() {
      this._msg = msg;
    });
  }
}