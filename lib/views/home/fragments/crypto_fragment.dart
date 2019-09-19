import 'package:flutter/material.dart';
import 'package:mytestappflutter/model/crypto.dart';
import 'package:mytestappflutter/presenter/crypto_presenter.dart';

class CryptoFragment extends StatefulWidget {
  //final Web3jPresenter presenter;

  final String title;
  CryptoFragment({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CryptoFragmentState();
  }
}

class CryptoFragmentState extends State<CryptoFragment> implements CryptoView {
  CryptoPresenter _presenter;
  List<Crypto> _currencies;
  bool _isLoading;
  //
  String _msg = "Cryptolist";
  CryptoFragmentState() {
    this._presenter = new CryptoPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? new Center(
            child: new CircularProgressIndicator(),
          )
        : new ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) =>
                _getRowWithDivider(index));
  }

  Widget _getRowWithDivider(int i) {
    final Crypto currency = _currencies[i];
    var children = <Widget>[
      Padding(
        padding: EdgeInsets.all(10.0),
        child: _getListItemUi(currency),
      ),
      new Divider(height: 5.0)
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  ListTile _getListItemUi(Crypto currency) {
    return ListTile(
      leading: FadeInImage(
          placeholder: AssetImage('assets/2.0x/stars.png'),
          image: NetworkImage(
              "https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@9867bdb19da14e63ffbe63805298fa60bf255cdd/32/color/" +
                  currency.symbol.toLowerCase() +
                  ".png")),
      title: Text(currency.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(currency.priceUsd, currency.percentChange1h),
      isThreeLine: true,
    );
  }
//<img src="https://cdn.jsdelivr.net/gh/atomiclabs/cryptocurrency-icons@9867bdb19da14e63ffbe63805298fa60bf255cdd/32/color/btc.png" alt="btc">

  Widget _getSubtitleText(String priceUSD, String percentChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  @override
  void setmsg(String msg) {
    setState(() {
      this._msg = msg;
    });
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
