class Conexion {
  static String _user = "";
  static String _pass = "";
  static String _rpcUrl = "";
  String _myaddress = '';
  String _nodeurl = "https://$_user:$_pass@$_rpcUrl";
  String _infuraurl = "https://mainnet.infura.io";
  get nodeurl => _nodeurl;
  get myaddress => _myaddress;
  get infuraurl => _infuraurl;
}