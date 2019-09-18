//import 'package:mytestappflutter/utils/conexion.dart';
//import 'dart:math';
//import 'package:http/http.dart';
import 'package:mytestappflutter/views/home/fragments/web3j_view.dart';
//import 'package:web3dart/web3dart.dart';
//import 'package:web3dart/json_rpc.dart';

class Web3jPresenter {
  void onConectBlockchain() {}
  set web3view(Web3jView value) {}
}

class BasicWeb3jPresenter implements Web3jPresenter {
  Web3jView view;
  BasicWeb3jPresenter() {
    //this.view = "Hello World";
  }
  @override
  void onConectBlockchain() {
    view.updateBlock('2019');
  }

  @override
  set web3view(Web3jView value) {
    view = value;
  }
  /*
  Conexion cnx = new Conexion();
  Web3Client _client;
  JsonRPC jsonRpc;

  void conect() {
    _client = Web3Client(cnx.nodeurl, Client());
  }

  void getBlockWeb3() async {
    String _anwer;
    try {
      final _block = await _client.getBlockNumber();
		_anwer = _block.toString();
    } catch (e) {
      _anwer = 'Error : $e';
    }
  }

  void ethrpc() async {
    jsonRpc = JsonRPC(url, Client());
    final answer = await jsonRpc.call('personal_listAccounts');
    print(answer.result);
  }
  */
}
