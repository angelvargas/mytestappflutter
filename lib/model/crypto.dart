class Crypto {
  String name;
  String priceUsd;
  String percentChange1h;
  String symbol;

  Crypto({this.name, this.priceUsd, this.percentChange1h, this.symbol});
  Crypto.fromMap(Map<String, dynamic> map)
      : name = 'btc',
        priceUsd = '10.00',
        percentChange1h = '1',
        symbol = 'btc';
}
abstract class CriptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}
class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
