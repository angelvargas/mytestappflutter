class CryptoView {
  void getlist(){}
  void setmsg(String msg){}
}
class CryptoPresenter {
  CryptoView _view;
  String data;
  CryptoPresenter(this._view){
    data = 'Hellor World';
  }
  void execute(){
    _view.setmsg('Msg changed');
  }
}