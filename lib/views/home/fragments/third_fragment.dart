import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:ethereum/ethereum.dart';
import 'package:ethereum/ethereum_server_client.dart';

class ThirdFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new ThirdFragmentState();
  }
}

class ThirdFragmentState extends State<ThirdFragment> {
  
  static String user = "";
  static String pass = "";
  static String curl = "";
  static String rpcUrl = "";
  static String myaddress = '';
  static String nodeurl = "";
  static String wsurl = '';
  String url = "";
  String _address = 'Default';
  String bloque = 'default';
  EthereumServerClient client;
  
  void initState() {
    Uri _nodeurl = Uri.parse(nodeurl);
    client = EthereumServerClient();
    client.connectUri(_nodeurl);
    //print(client);
    super.initState();
  }

  void test(){
    print('Third.test');
  }

  FutureOr<void> getBlockEth() async {
    //Uri _nodeurl = Uri.parse(nodeurl);
    //client = EthereumServerClient();
    //client.connectUri(_nodeurl);
    final EthereumServerClient client =
      EthereumServerClient.withConnectionParameters(nodeurl);
    try {
      client.printError = true;
      final String version = await client.eth.protocolVersion();
      if (version == null) {
        print('We have errored -> ${client.lastError}');
      } else {
        print('We are OK -> ${client.lastError}');
      }
      setState(() {
        bloque = 'Es:$bloque';
      });
    } catch (e) {
      bloque = 'Error : $e';
    }
  }
  // void newWallet() async{
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

  //     //final data = _client.
      
  //     setState(() {
  //       //_address = networkid.toString();
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
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0, bottom: 20.0),
            child: Text("Scanner"),
            onPressed: (){
              test();
              getBlockEth();
              //newWallet();
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
          SizedBox(
            height: 80,
          ),
          GestureDetector(
            child: new Text(_address),
            onLongPress:() {
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