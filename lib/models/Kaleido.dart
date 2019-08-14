import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3dart/web3dart.dart';

const String user = "u0mjgm2y4w";
const String pass = "tyYKxQ4gqVNgU0yhLcpTy-v5_KIa1BGEzkTZZYJGmq0";
const String rpcUrl = "u0t1wfxa79-u0i4zhl18v-rpc.us0-aws.kaleido.io";
const String nodeurl = "https://" + user + ":" + pass + "@" + rpcUrl;


class Kaleido {
  Kaleido();
  void conectar() {
    var httpCliente = new Client();
    final client = Web3Client(rpcUrl, httpCliente);
    return client.getBlockNumber();
    //print(client.getBlockNumber());
  }

  //void getNumber(){

  //}
}
/*
import 'dart:async';

class A {
  Future<int> getInt() {
    return Future.value(10);
  }
}

class B {
  checkValue() async {
    final val = await A().getInt();
    print(val == 10 ? "yes" : "no");
  }
}*/
/*
class Kaleido{
  var httpCliente = new Client();
  final client = Web3Client(rpcUrl, httpCliente);

  
  Function returnblock(){
    Future<int> number = client.getBlockNumber();
    return number;
  }
}
*/
/*
const Web3 = require('web3');

let USER = "u0mjgm2y4w";
let PASS = "tyYKxQ4gqVNgU0yhLcpTy-v5_KIa1BGEzkTZZYJGmq0";
let RPC_ENDPOINT = "u0t1wfxa79-u0i4zhl18v-rpc.us0-aws.kaleido.io"; // Remove the leading https://

// HTTP Provider Example
// NOTE: The HTTP Provider is deprecated, as it won't work for subscriptions.
// See: https://web3js.readthedocs.io/en/1.0/web3.html#providers

let nodeUrl = "https://" + USER + ":" + PASS + "@" + RPC_ENDPOINT;

let provider = new Web3.providers.HttpProvider(nodeUrl);
let web3 = new Web3(provider);

// Now you can call web3 functions, so we'll just test the connection by getting the latest block in the chain.

web3.eth.getBlock("latest").then((latestBlock) => {
    console.log("Latest Block Via HTTP Provider: ")
    console.log(latestBlock);
    // Stop the program once this has finished
    process.exit();
});
*/