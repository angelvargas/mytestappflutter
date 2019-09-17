//import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/json_rpc.dart';

class Web3jFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Web3jFragmentState();
  }
}

class Web3jFragmentState extends State<Web3jFragment> {
  //u0mjgm2y4w:6VeObr_jUe3C15xoqvXPciihJo5QZ3KFtP8HnDAW8D8
  static String user = "";
  static String pass = "";
  static String rpcUrl = "";
  static String myaddress = '';
  static String nodeurl = "https://$user:$pass@$rpcUrl";
  String url = "https://mainnet.infura.io";
  Web3Client _client;
  String bloque;
  String _address = 'Default';
  int networkid = 0;
  JsonRPC jsonRpc;
  void initState() {
    _client = Web3Client(nodeurl, Client());
    super.initState();
  }
  void test(){
    print('Second.test');
  }
  void getBlockWeb3() async {
    setState(() {
      //_client = Web3Client(url, Client());
      bloque = "Null";
    });
    try {
      final _block = await _client.getBlockNumber();
      setState(() {
        bloque = _block.toString();
      });
      print('Try');
    } catch (e) {
      bloque = 'Error : $e';
    }
  }
  void ethrpc() async{
    jsonRpc = JsonRPC(url, Client());
    final answer = await jsonRpc.call('personal_listAccounts');
    print(answer.result);
  }
  // void newWallet() async {
  //   try {
  //     //networkid = await _client.getNetworkId();
  //     //var rng = new Random.secure();
  //     //Credentials random = EthPrivateKey.createRandom(rng);
  //     //var credentials = await _client.credentialsFromPrivateKey("$random");
  //     //var getaddress = await credentials.extractAddress();
  //     //EthereumAddress _myaddress = myaddress;

  //     //obtener balance
  //     //EtherAmount balance = await _client.getBalance(EthereumAddress.fromHex(myaddress));

  //     //final balance = await _client.coinbaseAddress();
  //     //networkid = await _client.getNetworkId();
  //     //_client.

  //     _jsonRpc = JsonRPC(url, Client());
  //     //final rpc = JsonRPC(nodeurl, Client());
  //     final answer = await _jsonRpc.call('personal_newAccount');
  //     //print(answer.result as String);
  //     print(answer.result as List<dynamic>);
  //     //final data = _client.

  //     setState(() {
  //       //_address = answer.toString();
  //     });
  //     //print(balance.getValueInUnit(EtherUnit.ether));
  //     //Wallet wallet = Wallet.createNew(credentials, "password", random);
  //     //print(wallet.toJson());
  //   } catch (e) {
  //     _address = 'error:$e';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //final key = new GlobalKey();
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
            padding: EdgeInsets.only(
                left: 50.0, right: 50.0, top: 20.0, bottom: 20.0),
            child: Text("Scanner"),
            onPressed: () {
              test();
              getBlockWeb3();
              ethrpc();
              //newWallet();
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Bloque : $bloque",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 80,
          ),
          GestureDetector(
            child: new Text(_address),
            onLongPress: () {
              Clipboard.setData(new ClipboardData(text: _address));
              //new SnackBar(content: new Text("Copied to Clipboard"),);
              print('Copied');
              //key.currentState.showSnackBar(
              //  new SnackBar(content: new Text("Copied to Clipboard"),));
            },
          ),
        ],
      ),
    );
  }
}