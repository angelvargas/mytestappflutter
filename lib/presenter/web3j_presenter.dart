import 'package:mytestappflutter/utils/conexion.dart';
//import 'dart:math';
import 'package:http/http.dart';
import 'package:mytestappflutter/views/home/fragments/web3j_view.dart';
import 'package:web3dart/web3dart.dart';
//import 'package:web3dart/json_rpc.dart';

class Web3jPresenter {
  void onConectBlockchain() {}
  set web3view(Web3jView value) {}
}

class BasicWeb3jPresenter implements Web3jPresenter {
  Web3jView view;
  Conexion cnx = Conexion();
  Web3Client _client;
  BasicWeb3jPresenter() {
    this._client = Web3Client(cnx.nodeurl, Client());
  }
  @override
  void onConectBlockchain() async {
    String _answer;
    try {
      final _block = await _client.getBlockNumber();
      _answer = _block.toString();
    } catch (e) {
      _answer = 'Error : $e';
    }
    view.updateBlock(_answer);
  }

  @override
  set web3view(Web3jView value) {
    view = value;
  }
  /*
  
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
