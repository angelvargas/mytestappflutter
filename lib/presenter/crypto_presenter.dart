import 'package:mytestappflutter/model/crypto.dart';
import 'package:mytestappflutter/model/crypto_model.dart';

abstract class CryptoView {
  void setmsg(String msg) {}
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoPresenter {
  CryptoView _view;
  ProdCryptoRepository _repository;
  String data;
  CryptoPresenter(this._view) {
    data = 'Hellor World';
    _repository = new ProdCryptoRepository();
  }
  void execute() {
    _view.setmsg('Msg changed');
  }

  void loadCurrencies() {
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}
