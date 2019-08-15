//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class SecondFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new SecondFragmentState();
  }
}

class SecondFragmentState extends State<SecondFragment> {
  
  static String user = "";
  static String pass = "";
  static String rpcUrl = "";
  static String nodeurl = "https://$user:$pass@$rpcUrl";
  String url = "https://mainnet.infura.io";
  Web3Client _client;
  String bloque;
  String address;
  void initState(){
    _client = Web3Client(nodeurl, Client());
    super.initState();
  }
  void getBlock() async {
    setState(() {
      //_client = Web3Client(url, Client());
      bloque = "Null"; 
    });
    try {
      final _block = await _client.getBlockNumber(); 
      setState(() {
        bloque = _block.toString();
      });
    } catch (e) {
      bloque = 'Error : $e';
    }
  }
  void newWallet() async{
    try {
      //Wallet wallet = Wallet.createNew(credentials, "password", random);
      //print(wallet.toJson());
    } catch (e) {
      address = e;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0, bottom: 20.0),
            child: Text("Scanner"),
            onPressed: (){
              getBlock();
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Bloque : $bloque",
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
          Text(
            "Esta es : $address"
          )
        ],
      ),
    );
  }
}

/*
class EthApp extends StatefulWidget {
  @override
  _EthAppState createState() => _EthAppState();
}

class _EthAppState extends State<EthApp> {
  Web3Client _client;
  final TextEditingController _addressController = TextEditingController();

  bool _loading = false;
  String _error;
  String _balance;

  @override
  void initState() {
    _client = Web3Client(
        'https://mainnet.infura.io/v3/e8b3da9156fd4b4f8f8cdac7e085e1e0',
        Client());
    super.initState();
  }

  void _loadBalance() async {
    setState(() {
      _loading = true;
      _error = null;
      _balance = null;
    });

    try {
      final address = EthereumAddress(_addressController.text);
      final ethAmount = await _client.getBalance(address);

      setState(() {
        _balance = '${ethAmount.getValueInUnit(EtherUnit.ether)} Eth';
      });
    } catch (e, s) {
      print(e);
      print(s);

      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
  */