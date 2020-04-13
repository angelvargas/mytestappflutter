import 'dart:convert';
import 'package:mytestappflutter/model/crypto.dart';
import 'package:mytestappflutter/utils/conexion.dart';
import 'package:http/http.dart' as http;

class ProdCryptoRepository implements CriptoRepository {
  static Conexion cnx = Conexion();
  String cryptoUrl = cnx.cryptourl;

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(cryptoUrl);
    var res  = json.decode(response.body);
    final List responseBody = res["results"];
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }
    return responseBody.map((c) => new Crypto.fromMap(c)).toList();
  }
}
