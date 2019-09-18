import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytestappflutter/presenter/web3j_presenter.dart';
import 'package:mytestappflutter/views/home/fragments/web3j_view.dart';

class Web3jFragment extends StatefulWidget {
	//final Web3jPresenter presenter;
	final BasicWeb3jPresenter presenter;
	final String title;
	Web3jFragment(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new Web3jFragmentState();
  }
}

class Web3jFragmentState extends State<Web3jFragment> implements Web3jView {
  String _address = 'Default';
  String bloque;
  void initState() {
    super.initState();
		this.widget.presenter.web3view = this;
  }
	@override
  void updateBlock(String block) {
    setState(() {
        bloque = block;
    });
  }
	void onChangeBlock(){
		this.widget.presenter.onConectBlockchain();
	}

  @override
  Widget build(BuildContext context) {
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
							onChangeBlock();
              //test();
              //getBlockWeb3();
              //ethrpc();
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
