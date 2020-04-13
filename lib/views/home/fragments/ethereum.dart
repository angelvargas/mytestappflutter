import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:laksadart/laksadart.dart';
//import 'package:laksadart/src/';
class EthereumFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new EthereumFragmentState();
  }
}

class EthereumFragmentState extends State<EthereumFragment> {
  
  static String user = "";
  static String pass = "";
  static String rpcUrl = "";
  static String myaddress = '';
  static String nodeurl = "https://$user:$pass@$rpcUrl";
  static String url = "https://mainnet.infura.io";
  //Web3Client _client;
  // Laksa _client;
  String bloque;
  String _address = 'Default';
  int networkid = 0;
  void initStateE(){
    // _client = new Laksa(nodeUrl:url, networkID:'Kaleido');
    // _client.setNetworkID('979031953');
    super.initState();
  }
  void getBlockE() async {
    setState(() {
      //_client = Web3Client(url, Client());
      bloque = "Null"; 
    });
    try {
    //   _client = new Laksa(nodeUrl:url, networkID:'Kaleido');
    // _client.setNetworkID('979031953');
    //   final _block = await _client.blockchain.getNumTransactions(); 
      setState(() {
        // bloque = 'Es '+_block.toString();
      });
    } catch (e) {
      //bloque = 'Error : $e';
    }
  }
  void newWalletE() async{
    try {
      //networkid = await _client.getNetworkId();
      //var rng = new Random.secure();
      //Credentials random = EthPrivateKey.createRandom(rng);
      //var credentials = await _client.credentialsFromPrivateKey("$random");
      //var getaddress = await credentials.extractAddress();
      //EthereumAddress _myaddress = myaddress;
      
      //obtener balance
      //EtherAmount balance = await _client.getBalance(EthereumAddress.fromHex(myaddress));

      //final balance = await _client.coinbaseAddress();
      //networkid = await _client.getNetworkId();

      //final data = _client.
      
      setState(() {
        _address = networkid.toString();
      });
      //print(balance.getValueInUnit(EtherUnit.ether));
      //Wallet wallet = Wallet.createNew(credentials, "password", random);
      //print(wallet.toJson());
    } catch (e) {
      _address = 'error:$e';
    }
  }
  
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
              getBlockE();
              //newWalletE();
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